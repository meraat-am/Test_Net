package com.company;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws IOException {

        System.out.println("Enter input file's path");
        Scanner scanner = new Scanner(System.in);
        String inputArd = scanner.nextLine();
        System.out.println("Enter output file's path");
        String outputAdr = scanner.nextLine();
        LexicalAnalyzer lexicalAnalyzer = new LexicalAnalyzer
                (new FileReader(inputArd));
        FileWriter outputFile = new FileWriter(outputAdr);

        startStuff(outputFile);

        ArrayList<String> tokens = new ArrayList<>();
        int i = 1;
        outputFile.write("      <span style=\"color:#FFFFFF\"><b>" + "1" + "</b></span>");
        i++;
        while (true) {
            LexicalAnalyzer.Symbol currentToken = lexicalAnalyzer.nextToken();
            if (lexicalAnalyzer.yyatEOF()) {
                break;
            }
            if (currentToken.tokenType <= 24) { //reserved
                outputFile.write("<span style=\"color:#FC618D\">" + currentToken.text + "</span>");
            } else if (currentToken.tokenType == 58) { //id
                outputFile.write("<span style=\"color:#FFFFFF\">" + currentToken.text + "</span>");
            } else if (currentToken.tokenType == 59) { //int
                outputFile.write("<span style=\"color:#F59762\">" + currentToken.text + "</span>");
            } else if (currentToken.tokenType == 60) { //real
                outputFile.write("<span style=\"color:#F59762\"><i>" + currentToken.text + "</i></span>");
            } else if (currentToken.tokenType == 61) { //string
                outputFile.write("<span style=\"color:#FCE566\">" + currentToken.text + "</span>");
            } else if (currentToken.tokenType == 62) { //special character
                outputFile.write("<span style=\"color:#EE82EE\"><i>" + currentToken.text + "</i></span>");
            } else if (currentToken.tokenType == 63) { //comment
                outputFile.write("<span style=\"color:#69676C\">" + currentToken.text + "</span></br>");
                outputFile.write("<span style=\"color:#FFFFFF\">" + i + "</span>");
                i++;
            } else if (currentToken.tokenType == 64) { //white space
                outputFile.write("<span style=\"color:#FC618D\">" + "&nbsp;" + "</span>");
            } else if (currentToken.tokenType <= 57 && currentToken.tokenType >= 25) { //operator
                outputFile.write("<span style=\"color:#00FFFF\">" + currentToken.text + "</span>");
            } else if (currentToken.tokenType == 66) { //tab
                outputFile.write("<span style=\"color:#FFFFFF\">" + "&nbsp;&nbsp;&nbsp;&nbsp;" + "</span>");
            } else if (currentToken.tokenType == 67) { //enter
                outputFile.write("</br>\n");
                outputFile.write("      <span style=\"color:#FFFFFF\">" + i + "</span>");
                i++;
            } else { //undefined
                outputFile.write("<span style=\"color:#FF0000\">" + currentToken.text + "</span>");
            }
        }
        endStuff(outputFile);
        lexicalAnalyzer.yyclose();
    }

    private static void startStuff(FileWriter output) throws IOException {
        output.write("<!DOCTYPE html>\n");
        output.write("<html>\n");
        output.write("  <head>\n");
        output.write("      <title> Lexical Analyzer </title>\n");
        output.write("  </head>\n");
        output.write("  <body style=\"background-color:#222222;\">\n");
        output.write("     <p>\n");
    }

    private static void endStuff(FileWriter output) throws IOException {
        output.write("    </p>\n");
        output.write("  </body>\n");
        output.write("</html>\n");
        output.flush();
        output.close();
    }
}
