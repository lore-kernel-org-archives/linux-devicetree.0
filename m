From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/3] util: Add method for escape output handling
Date: Wed, 14 Jun 2017 17:53:48 +0300
Message-ID: <1497452030-15588-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497452030-15588-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add 3 methods that help when dealing with escaping output strings.

util_isesc() checks whether a character should be escaped.
util_c2str() converts a character to a possibly escaped sequence
util_quoted_strlen() calculates the length of a quoted string.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 util.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 util.h | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/util.c b/util.c
index 9953c32..6895515 100644
--- a/util.c
+++ b/util.c
@@ -100,10 +100,17 @@ char *join_path(const char *path, const char *name)
 	return str;
 }
 
+bool util_isesc(char c)
+{
+	return c == '\a' || c == '\b' || c == '\t' || c == '\n' || c == '\v' ||
+	       c == '\f' || c == '\r' || c == '\\' || c == '\"';
+}
+
 bool util_is_printable_string(const void *data, int len)
 {
 	const char *s = data;
 	const char *ss, *se;
+	char c;
 
 	/* zero length is not */
 	if (len == 0)
@@ -117,8 +124,13 @@ bool util_is_printable_string(const void *data, int len)
 
 	while (s < se) {
 		ss = s;
-		while (s < se && *s && isprint((unsigned char)*s))
+		while (s < se && *s) {
+			c = *s;
+			if (!(isprint(c) || util_isesc(c)))
+				break;
 			s++;
+		}
+
 
 		/* not zero, or not done yet */
 		if (*s != '\0' || s == ss)
@@ -130,6 +142,62 @@ bool util_is_printable_string(const void *data, int len)
 	return 1;
 }
 
+char *util_c2str(char c, char *buf, int bufsz)
+{
+	char *s = buf;
+
+	if (util_isesc(c)) {
+
+		if (bufsz < 3)
+			return NULL;
+
+		/* escape case */
+		*s++ = '\\';
+		switch (c) {
+		case '\a': *s++ =  'a'; break;
+		case '\b': *s++ =  'b'; break;
+		case '\t': *s++ =  't'; break;
+		case '\n': *s++ =  'n'; break;
+		case '\v': *s++ =  'v'; break;
+		case '\f': *s++ =  'f'; break;
+		case '\r': *s++ =  'r'; break;
+		case '\\': *s++ = '\\'; break;
+		case '\"': *s++ = '\"'; break;
+		}
+	} else if (!isprint(c)) {
+		static const char *hexb = "0123456789abcdef";
+
+		if (bufsz < 5)
+			return NULL;
+
+		/* hexadecimal escape case */
+		*s++ = '\\';
+		*s++ = 'x';
+		*s++ = hexb[(((unsigned int)c >> 4) & 0xf)];
+		*s++ = hexb[  (unsigned int)c       & 0xf ];
+	} else {
+		if (bufsz < 2)
+			return NULL;
+
+		*s++ = c;	/* normal printable */
+	}
+
+	*s = '\0';
+
+	return buf;
+}
+
+int util_quoted_strlen(const char *str)
+{
+	int len;
+	char c, buf[C2STR_BUF_MAX];
+
+	len = 1;
+	while ((c = *str++) != '\0' && util_c2str(c, buf, sizeof(buf)))
+		len += strlen(buf);
+	return len + 1;
+}
+
 /*
  * Parse a octal encoded character starting at index i in string s.  The
  * resulting character will be returned and the index i will be updated to
diff --git a/util.h b/util.h
index ad5f411..3ed617c 100644
--- a/util.h
+++ b/util.h
@@ -82,6 +82,41 @@ extern char *join_path(const char *path, const char *name);
  */
 bool util_is_printable_string(const void *data, int len);
 
+/**
+ * Check if this is is a character we should escape.
+ * The list of valid escaped chars is: \a\b\t\n\b\f\r\\\"
+ *
+ * @param c	The character to check
+ * @return 1 if the character is one that should be escaped
+ */
+bool util_isesc(char c);
+
+/**
+ * Convert a given character to it's escaped form
+ * If it's a normal printable character the buffer is filled with "c\0"
+ * If it's an escaped character the corresponding escape * is terminated
+ * with \<esc>\0
+ * For any other a hex form is used (\xYY) where YY is the ascii in hex of c.
+ *
+ * @param c	The character to convert
+ * @param buf	The corresponding buffer to fill
+ * @param bufsz The maximum buffer size (including NULL).
+ * 		Note that the absolute maximum buffer fill is 5 for \xYY\0
+ * @return 	buf if the result fits or NULL on error
+ */
+char *util_c2str(char c, char *buf, int bufsz);
+
+/* maximum buffer for c2str */
+#define C2STR_BUF_MAX	5
+
+/**
+ * Return the length in characters when quoting the given string
+ *
+ * @param str	The string to query it's quoted length
+ * @return	Length in characters of the quoted string generated from str.
+ */
+int util_quoted_strlen(const char *str);
+
 /*
  * Parse an escaped character starting at index i in string s.  The resulting
  * character will be returned and the index i will be updated to point at the
-- 
2.1.4
