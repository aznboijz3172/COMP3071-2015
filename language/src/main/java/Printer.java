import org.antlr.v4.runtime.tree.ParseTree;

public class Printer extends ExprBaseVisitor<String> {
	@Override
	public String visitProg(ExprParser.ProgContext ctx) {
		StringBuilder builder = new StringBuilder();
		int i = 0;
		for (ParseTree kid : ctx.children) {
			if (kid == ctx.NEWLINE(i)) {
				builder.append("\n");
				i++;
			} else {
				builder.append(this.visit(kid));
			}
		}
		return builder.toString();
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public String visitExpr(ExprParser.ExprContext expression) {
		StringBuilder builder = new StringBuilder();
		if (expression.number != null) {
			builder.append(expression.number.getText());
		}
		if (expression.sub != null) {
			builder.append("(" + this.visit(expression.sub) + ")");
		}
		if (expression.left != null) {
			builder.append(this.visit(expression.left));
		}
		if (expression.op != null) {
			switch(expression.op.getType()) {
			case ExprParser.DIVIDE: builder.append("/"); break;
			case ExprParser.TIMES: builder.append("*"); break;
			case ExprParser.PLUS: builder.append("+"); break;
			case ExprParser.MINUS: builder.append("-"); break;
			}
		}
		if (expression.right != null) {
			builder.append(this.visit(expression.right));
		}
		return builder.toString();
	}

}
