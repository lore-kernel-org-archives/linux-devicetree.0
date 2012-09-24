From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] dtc: cpp co-existence: add support for #line directives
Date: Mon, 24 Sep 2012 16:51:17 -0600
Message-ID: <1348527077-27471-3-git-send-email-swarren@wwwdotorg.org>
References: <1348527077-27471-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348527077-27471-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Line control directives of the following formats are supported:
    #line LINE "FILE"
    # LINE FILE [FLAGS]

This allows dtc to consume the output of pre-processors, and to provide
error messages that refer to the original filename, including taking
into account any #include directives that the pre-processor may have
performed.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 dtc-lexer.l                |   21 +++++++++++++++++++++
 srcpos.c                   |    6 ++++++
 srcpos.h                   |    2 ++
 tests/propname_escapes.dts |    7 +++++++
 4 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index edbeb86..506a1bf 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -71,6 +71,27 @@ static int pop_input_file(void);
 			push_input_file(name);
 		}
 
+<*>"#"(line{WS}|" "){WS}*[0-9]+{WS}+{STRING}({WS}+[0-9]+)? {
+			char *line, *tmp, *fn;
+			/* skip text before line # */
+			line = yytext;
+			while (!isdigit(*line))
+				line++;
+			/* skip digits in line # */
+			tmp = line;
+			while (!isspace(*tmp))
+				tmp++;
+			/* "NULL"-terminate line # */
+			*tmp = '\0';
+			/* start of filename */
+			fn = strchr(tmp + 1, '"') + 1;
+			/* strip trailing " from filename */
+			tmp = strchr(fn, '"');
+			*tmp = 0;
+			/* -1 since #line is the number of the next line */
+			srcpos_set_line(xstrdup(fn), atoi(line) - 1);
+		}
+
 <*><<EOF>>		{
 			if (!pop_input_file()) {
 				yyterminate();
diff --git a/srcpos.c b/srcpos.c
index 3ee523d..246ab4b 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -328,3 +328,9 @@ srcpos_warn(struct srcpos *pos, char const *fmt, ...)
 
 	va_end(va);
 }
+
+void srcpos_set_line(char *f, int l)
+{
+	current_srcfile->name = f;
+	current_srcfile->lineno = l;
+}
diff --git a/srcpos.h b/srcpos.h
index 5617916..93a2712 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -113,4 +113,6 @@ extern void srcpos_error(struct srcpos *pos, char const *, ...)
 extern void srcpos_warn(struct srcpos *pos, char const *, ...)
      __attribute__((format(printf, 2, 3)));
 
+extern void srcpos_set_line(char *f, int l);
+
 #endif /* _SRCPOS_H_ */
diff --git a/tests/propname_escapes.dts b/tests/propname_escapes.dts
index 9f70618..9f5793d 100644
--- a/tests/propname_escapes.dts
+++ b/tests/propname_escapes.dts
@@ -1,5 +1,12 @@
 /dts-v1/;
 
+/* common format */
+#line 3 "foo.dts"
+/* newer gcc format */
+# 6 "bar.dts"
+/* newer gcc sometimes uses */
+# 9 "baz.dts" 1
+
 / {
 	#address-cells = <1>;
 	\#gpio-cells = <2>;
-- 
1.7.0.4
