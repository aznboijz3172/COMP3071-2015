import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.antlr.v4.runtime.tree.ParseTree;

public class Calculator extends ExprBaseVisitor<Double> {
	List<Double> results;
	Map<String, Double> memory;
	@Override
	public Double visitProg(ExprParser.ProgContext ctx) {
		results = new ArrayList<Double>();
		memory = new HashMap<String,Double>();
		int i = 0;
		for (ParseTree kid : ctx.children) {
			if (kid == ctx.NEWLINE(i)) {
				i++;
			} else {
				results.add(this.visit(kid));
			}
		}
		return this.visit(ctx.getChild(0));
	}
	public Double visitStatement(ExprParser.StatementContext stmt) {
		String id = stmt.id.getText();
		Double result = this.visit(stmt.right);
		memory.put(id, result);
		return result;
	}
	@Override
	public Double visitExpr
	 (ExprParser.ExprContext expr) {
		if (expr.number != null) {
			return Double.parseDouble(expr.number.getText());
		}
		if (expr.id != null) {
			return memory.get(expr.id.getText());
		}
		if (expr.sub != null) {
			return this.visit(expr.sub);
		}
		if (expr.op != null) {
			switch(expr.op.getType()) {
			case ExprParser.DIVIDE:
				return this.visit(expr.left) / this.visit(expr.right);
			case ExprParser.TIMES:
				return this.visit(expr.left) * this.visit(expr.right);
			case ExprParser.PLUS:
				return this.visit(expr.left) + this.visit(expr.right);
			case ExprParser.MINUS:
				return this.visit(expr.left) - this.visit(expr.right);
			}
		}
		// We shouldn't get here, so yeah...
		return Double.NaN;
	}

}
