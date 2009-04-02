From: Johns Daniel <johns.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Cannot compile the DTC itself
Date: Thu, 2 Apr 2009 14:07:33 -0500
Message-ID: <ba5d9360904021207j32a13e43i9b6347147ccf7563@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

I get similar errors for dtc-v1.1.0 and dtc-v1.2.0:

...
         CC dtc-lexer.lex.o
dtc-lexer.lex.c: In function `yylex':
dtc-lexer.lex.c:762: warning: label `find_rule' defined but not used
dtc-lexer.l: At top level:
dtc-lexer.lex.c:1870: warning: 'yy_flex_realloc' defined but not used
         CC dtc-parser.tab.o
dtc-parser.tab.c: In function `yyparse':
dtc-parser.tab.c:1105: warning: implicit declaration of function `YYRHSLOC'
dtc-parser.tab.c:1105: error: request for member `first_line' in
something not a structure or union
dtc-parser.tab.c:1105: error: request for member `first_column' in
something not a structure or union
dtc-parser.tab.c:1105: error: request for member `last_line' in
something not a structure or union
dtc-parser.tab.c:1105: error: request for member `last_column' in
something not a structure or union
dtc-parser.tab.c:1105: error: request for member `file' in something
not a structure or union
dtc-parser.tab.c:1105: error: request for member `last_line' in
something not a structure or union
dtc-parser.tab.c:1105: error: request for member `last_column' in
something not a structure or union
dtc-parser.tab.c:1105: error: request for member `file' in something
not a structure or union
dtc-parser.tab.c:1625: error: request for member `first_line' in
something not a structure or union
dtc-parser.tab.c:1625: error: request for member `first_column' in
something not a structure or union
dtc-parser.tab.c:1625: error: request for member `last_line' in
something not a structure or union
dtc-parser.tab.c:1625: error: request for member `last_column' in
something not a structure or union
dtc-parser.tab.c:1625: error: request for member `file' in something
not a structure or union
dtc-parser.tab.c:1625: error: request for member `last_line' in
something not a structure or union
dtc-parser.tab.c:1625: error: request for member `last_column' in
something not a structure or union
dtc-parser.tab.c:1625: error: request for member `file' in something
not a structure or union
make: *** [dtc-parser.tab.o] Error 1

Only dtc-v1.0.0 builds completely.

Any idea as to what might be wrong?

-- Johns
