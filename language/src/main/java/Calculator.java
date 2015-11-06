
public class Calculator extends ExprBaseVisitor<Double> {
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.</p>
	 */
	@Override
	public Double visitProg(ExprParser.ProgContext ctx) {
		return visitChildren(ctx);
	}
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.</p>
	 */
	@Override
	public Double visitExpr(ExprParser.ExprContext ctx) {
		return visitChildren(ctx);
	}

}
