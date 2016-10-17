package starter;


import desktop.DesktopBaseListener;
import desktop.DesktopLexer;
import desktop.DesktopParser;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.FileInputStream;
import java.io.IOException;

public class Test {
    public static void main(String[] args) throws IOException {

        final ANTLRInputStream input = new ANTLRInputStream(new FileInputStream("/usr/share/applications/firefox.desktop"));


        final DesktopLexer desktopLexer = new DesktopLexer(input);
        final CommonTokenStream commonTokenStream = new CommonTokenStream(desktopLexer);
        final DesktopParser desktopParser = new DesktopParser(commonTokenStream);
        final DesktopBaseListener desktopBaseListener = new DesktopBaseListener() {
            @Override
            public void enterName(final DesktopParser.NameContext ctx) {
                super.enterName(ctx);
            }
        };
        new ParseTreeWalker().walk(desktopBaseListener,desktopParser.file());

        //System.out.println(tree.toStringTree(desktopParser));







    }


}
