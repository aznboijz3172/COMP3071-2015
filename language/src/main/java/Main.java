import java.io.IOException;
import java.io.StringReader;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.tree.ParseTree;

public class Main {
	public static void main(String[] args) throws IOException {
		Lexer lexer = new ExprLexer(new ANTLRInputStream(new StringReader("a=10-8+5/2\r\nb=2+2*2\r\nc=a+b\r\n")));
//		Lexer lexer = new ExprLexer(new ANTLRFileStream("file-name-goes-here"));
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		ExprParser parser = new ExprParser(tokens);
		ParseTree tree = parser.prog();
		
		Printer printer = new Printer();
		System.out.println(printer.visit(tree));
		Calculator p = new Calculator();
		p.visit(tree);
//		System.out.println(p.visit(tree));
		for (String id : p.memory.keySet()) {
			System.out.format("%s = %f\n", id, p.memory.get(id));
		}
	}
}
