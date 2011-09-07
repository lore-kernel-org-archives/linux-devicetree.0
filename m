From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/3] dtc: Refactor character literal parsing code
Date: Wed,  7 Sep 2011 16:15:38 -0700
Message-ID: <1315437340-1661-2-git-send-email-robotboy@chromium.org>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1315437340-1661-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Move the parsing of hex, octal and escaped characters from data.c
to util.c where it can be used for character literal parsing within
strings as well as for stand alone C style character literals.

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 data.c |   77 +-------------------------------------------------
 util.c |   99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 util.h |   18 +++++++++++
 3 files changed, 118 insertions(+), 76 deletions(-)

diff --git a/data.c b/data.c
index fe555e8..471f6c3 100644
--- a/data.c
+++ b/data.c
@@ -68,40 +68,6 @@ struct data data_copy_mem(const char *mem, int len)
 	return d;
 }
 
-static char get_oct_char(const char *s, int *i)
-{
-	char x[4];
-	char *endx;
-	long val;
-
-	x[3] = '\0';
-	strncpy(x, s + *i, 3);
-
-	val = strtol(x, &endx, 8);
-
-	assert(endx > x);
-
-	(*i) += endx - x;
-	return val;
-}
-
-static char get_hex_char(const char *s, int *i)
-{
-	char x[3];
-	char *endx;
-	long val;
-
-	x[2] = '\0';
-	strncpy(x, s + *i, 2);
-
-	val = strtol(x, &endx, 16);
-	if (!(endx  > x))
-		die("\\x used with no following hex digits\n");
-
-	(*i) += endx - x;
-	return val;
-}
-
 struct data data_copy_escape_string(const char *s, int len)
 {
 	int i = 0;
@@ -119,48 +85,7 @@ struct data data_copy_escape_string(const char *s, int len)
 			continue;
 		}
 
-		c = s[i++];
-		assert(c);
-		switch (c) {
-		case 'a':
-			q[d.len++] = '\a';
-			break;
-		case 'b':
-			q[d.len++] = '\b';
-			break;
-		case 't':
-			q[d.len++] = '\t';
-			break;
-		case 'n':
-			q[d.len++] = '\n';
-			break;
-		case 'v':
-			q[d.len++] = '\v';
-			break;
-		case 'f':
-			q[d.len++] = '\f';
-			break;
-		case 'r':
-			q[d.len++] = '\r';
-			break;
-		case '0':
-		case '1':
-		case '2':
-		case '3':
-		case '4':
-		case '5':
-		case '6':
-		case '7':
-			i--; /* need to re-read the first digit as
-			      * part of the octal value */
-			q[d.len++] = get_oct_char(s, &i);
-			break;
-		case 'x':
-			q[d.len++] = get_hex_char(s, &i);
-			break;
-		default:
-			q[d.len++] = c;
-		}
+                q[d.len++] = get_escape_char(s, &i);
 	}
 
 	q[d.len++] = '\0';
diff --git a/util.c b/util.c
index 994436f..b39392c 100644
--- a/util.c
+++ b/util.c
@@ -25,6 +25,7 @@
 #include <stdlib.h>
 #include <stdarg.h>
 #include <string.h>
+#include <assert.h>
 
 #include "util.h"
 
@@ -85,3 +86,101 @@ int util_is_printable_string(const void *data, int len)
 
 	return 1;
 }
+
+char get_oct_char(const char *s, int *i)
+{
+	char x[4];
+	char *endx;
+	long val;
+
+	x[3] = '\0';
+	strncpy(x, s + *i, 3);
+
+	val = strtol(x, &endx, 8);
+
+	assert(endx > x);
+
+	(*i) += endx - x;
+	return val;
+}
+
+char get_hex_char(const char *s, int *i)
+{
+	char x[3];
+	char *endx;
+	long val;
+
+	x[2] = '\0';
+	strncpy(x, s + *i, 2);
+
+	val = strtol(x, &endx, 16);
+	if (!(endx  > x))
+		die("\\x used with no following hex digits\n");
+
+	(*i) += endx - x;
+	return val;
+}
+
+char get_escape_char(const char *s, int *i)
+{
+	char	c = s[*i];
+	int	j = *i + 1;
+	char	val;
+
+	assert(c);
+	switch (c) {
+	case 'a':
+		val = '\a';
+		break;
+	case 'b':
+		val = '\b';
+		break;
+	case 't':
+		val = '\t';
+		break;
+	case 'n':
+		val = '\n';
+		break;
+	case 'v':
+		val = '\v';
+		break;
+	case 'f':
+		val = '\f';
+		break;
+	case 'r':
+		val = '\r';
+		break;
+	case '0':
+	case '1':
+	case '2':
+	case '3':
+	case '4':
+	case '5':
+	case '6':
+	case '7':
+		j--; /* need to re-read the first digit as
+		      * part of the octal value */
+		val = get_oct_char(s, &j);
+		break;
+	case 'x':
+		val = get_hex_char(s, &j);
+		break;
+	default:
+		val = c;
+	}
+
+	(*i) = j;
+	return val;
+}
+
+char get_escape_char_exact(const char *s, int len)
+{
+	int	j = 1; //skip intial "\"
+	char	c = get_escape_char(s, &j);
+
+	if (j != len)
+		die("Extra characters at end of character literal '%s' "
+		    "(%d != %d)\n", s, j, len);
+
+	return c;
+}
diff --git a/util.h b/util.h
index cc68933..4332b6e 100644
--- a/util.h
+++ b/util.h
@@ -64,4 +64,22 @@ extern char *join_path(const char *path, const char *name);
  * @return 1 if a valid printable string, 0 if not */
 int util_is_printable_string(const void *data, int len);
 
+/*
+ * Octal, Hex and escaped character parsing routines.  Each of these routines
+ * will parse an encoded character starting at index i in string s.  The
+ * resulting character will be returned and the index i will be updated to
+ * point at the character directly after the end of the encoding, this may
+ * be the '\0' terminator of the string.
+ */
+char get_oct_char(const char *s, int *i);
+char get_hex_char(const char *s, int *i);
+char get_escape_char(const char *s, int *i);
+
+/*
+ * Parse an escaped character of exactly len characters starting at the
+ * beginning of the passed string.  If the escape sequence is not exactly
+ * len characters long we die.  Otherwise the parsed character is returned.
+ */
+char get_escape_char_exact(const char *s, int len);
+
 #endif /* _UTIL_H */
-- 
1.7.3.1
