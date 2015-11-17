import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.antlr.v4.runtime.tree.ParseTree;

public class Interpreter extends ExprBaseVisitor<Double> {
	Map<String, Double> memory;
	public Double visitBlock(ExprParser.BlockContext ctx) {
		int i = 0;
		for (ParseTree kid : ctx.children) {
			if (kid == ctx.NEWLINE(i)) {
				i++;
			} else {
				this.visit(kid);
			}
		}
		return Double.NaN;
	}
	@Override
	public Double visitProg(ExprParser.ProgContext ctx) {
		memory = new HashMap<String,Double>();
		return super.visitProg(ctx);
	}
	private boolean evalCondition(ExprParser.StatementContext stmt) {
		Double left = this.visit(stmt.left);
		Double right = this.visit(stmt.right);
		boolean condition = false;
		if (stmt.condition.getType() == ExprParser.LT) {
			condition = left < right;
		}
		if (stmt.condition.getType() == ExprParser.GT) {
			condition = left > right;
		}
		if (stmt.condition.getType() == ExprParser.EQ) {
			condition = left == right;
		}
		return condition;
	}
	public Double visitStatement(ExprParser.StatementContext stmt) {
		if (stmt.id != null) {
			String id = stmt.id.getText();
			Double result = this.visit(stmt.right);
			memory.put(id, result);
			return result;
		}
		if (stmt.keyword != null) {
			while (evalCondition(stmt)) {
				this.visit(stmt.loop);
			}
		}
		return Double.NaN;
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
			case ExprParser.MOD:
				return this.visit(expr.left) % this.visit(expr.right);
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
