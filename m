From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] dtc: Use type information when printing tree source
Date: Fri, 13 Dec 2013 17:49:12 +0100
Message-ID: <1386953352-25402-4-git-send-email-t.figa@samsung.com>
References: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1386953352-25402-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since we already have type information in livetree representation, there
is no need to guess types when printing DTS. This patch modifies
printing code to use type information.

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 treesource.c | 150 +++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 84 insertions(+), 66 deletions(-)

diff --git a/treesource.c b/treesource.c
index ffebb77..1c440a0 100644
--- a/treesource.c
+++ b/treesource.c
@@ -54,29 +54,44 @@ static void write_prefix(FILE *f, int level)
 		fputc('\t', f);
 }
 
-static bool isstring(char c)
+static size_t prop_len(struct data *val, struct marker *marker)
 {
-	return (isprint(c)
-		|| (c == '\0')
-		|| strchr("\a\b\t\n\v\f\r", c));
+	struct marker *m = marker->next;
+
+	for_each_marker_of_type(m, TYPE)
+		return m->offset - marker->offset;
+
+	return val->len - marker->offset;
 }
 
-static void write_propval_string(FILE *f, struct data val)
+static void write_propval_string(FILE *f, struct data val,
+				 struct marker *marker)
 {
-	const char *str = val.val;
+	const char *str = &val.val[marker->offset];
+	size_t offset = marker->offset;
+	size_t len = prop_len(&val, marker);
 	int i;
-	struct marker *m = val.markers;
+	struct marker *m = marker->next;
 
-	assert(str[val.len-1] == '\0');
+	assert(str[len-1] == '\0');
 
-	while (m && (m->offset == 0)) {
+	while (m && (m->offset == offset)) {
 		if (m->type == LABEL)
 			fprintf(f, "%s: ", m->ref);
+		else if (m->type == REF_PATH) {
+			if (offset + len == val.len) {
+				fprintf(f, "&%s", m->ref);
+				goto labels;
+			} else {
+				fprintf(f, "&%s, ", m->ref);
+				return;
+			}
+		}
 		m = m->next;
 	}
 	fprintf(f, "\"");
 
-	for (i = 0; i < (val.len-1); i++) {
+	for (i = 0; i < (len-1); i++) {
 		char c = str[i];
 
 		switch (c) {
@@ -107,17 +122,6 @@ static void write_propval_string(FILE *f, struct data val)
 		case '\"':
 			fprintf(f, "\\\"");
 			break;
-		case '\0':
-			fprintf(f, "\", ");
-			while (m && (m->offset < i)) {
-				if (m->type == LABEL) {
-					assert(m->offset == (i+1));
-					fprintf(f, "%s: ", m->ref);
-				}
-				m = m->next;
-			}
-			fprintf(f, "\"");
-			break;
 		default:
 			if (isprint(c))
 				fprintf(f, "%c", c);
@@ -125,20 +129,26 @@ static void write_propval_string(FILE *f, struct data val)
 				fprintf(f, "\\x%02hhx", c);
 		}
 	}
-	fprintf(f, "\"");
 
+	if (offset + len != val.len) {
+		fprintf(f, "\", ");
+		return;
+	}
+
+	fprintf(f, "\"");
+labels:
 	/* Wrap up any labels at the end of the value */
-	for_each_marker_of_type(m, LABEL) {
-		assert (m->offset == val.len);
+	for_each_marker_of_type(m, LABEL)
 		fprintf(f, " %s:", m->ref);
-	}
 }
 
-static void write_propval_cells(FILE *f, struct data val)
+static void write_propval_cells(FILE *f, struct data val, struct marker *marker)
 {
-	void *propend = val.val + val.len;
-	cell_t *cp = (cell_t *)val.val;
-	struct marker *m = val.markers;
+	size_t offset = marker->offset;
+	size_t len = prop_len(&val, marker);
+	void *propend = val.val + offset + len;
+	cell_t *cp = (cell_t *)(val.val + offset);
+	struct marker *m = marker->next;
 
 	fprintf(f, "<");
 	for (;;) {
@@ -146,6 +156,13 @@ static void write_propval_cells(FILE *f, struct data val)
 			if (m->type == LABEL) {
 				assert(m->offset == ((char *)cp - val.val));
 				fprintf(f, "%s: ", m->ref);
+			} else if (m->type == REF_PHANDLE) {
+				assert(m->offset == ((char *)cp - val.val));
+				fprintf(f, "&%s", m->ref);
+				++cp;
+				if ((void *)cp >= propend)
+					goto done;
+				fprintf(f, " ");
 			}
 			m = m->next;
 		}
@@ -156,19 +173,26 @@ static void write_propval_cells(FILE *f, struct data val)
 		fprintf(f, " ");
 	}
 
+done:
+	if (offset + len != val.len) {
+		fprintf(f, ">, ");
+		return;
+	}
+
 	/* Wrap up any labels at the end of the value */
-	for_each_marker_of_type(m, LABEL) {
-		assert (m->offset == val.len);
+	for_each_marker_of_type(m, LABEL)
 		fprintf(f, " %s:", m->ref);
-	}
+
 	fprintf(f, ">");
 }
 
-static void write_propval_bytes(FILE *f, struct data val)
+static void write_propval_bytes(FILE *f, struct data val, struct marker *marker)
 {
-	void *propend = val.val + val.len;
-	const char *bp = val.val;
-	struct marker *m = val.markers;
+	size_t offset = marker->offset;
+	size_t len = prop_len(&val, marker);
+	void *propend = val.val + offset + len;
+	const char *bp = val.val + marker->offset;
+	struct marker *m = marker->next;
 
 	fprintf(f, "[");
 	for (;;) {
@@ -184,52 +208,46 @@ static void write_propval_bytes(FILE *f, struct data val)
 		fprintf(f, " ");
 	}
 
+	if (offset + len != val.len) {
+		fprintf(f, "], ");
+		return;
+	}
+
 	/* Wrap up any labels at the end of the value */
-	for_each_marker_of_type(m, LABEL) {
-		assert (m->offset == val.len);
+	for_each_marker_of_type(m, LABEL)
 		fprintf(f, " %s:", m->ref);
-	}
+
 	fprintf(f, "]");
 }
 
 static void write_propval(FILE *f, struct property *prop)
 {
-	int len = prop->val.len;
-	const char *p = prop->val.val;
 	struct marker *m = prop->val.markers;
-	int nnotstring = 0, nnul = 0;
-	int nnotstringlbl = 0, nnotcelllbl = 0;
-	int i;
+	int len = prop->val.len;
 
 	if (len == 0) {
 		fprintf(f, ";\n");
 		return;
 	}
 
-	for (i = 0; i < len; i++) {
-		if (! isstring(p[i]))
-			nnotstring++;
-		if (p[i] == '\0')
-			nnul++;
-	}
-
-	for_each_marker_of_type(m, LABEL) {
-		if ((m->offset > 0) && (prop->val.val[m->offset - 1] != '\0'))
-			nnotstringlbl++;
-		if ((m->offset % sizeof(cell_t)) != 0)
-			nnotcelllbl++;
-	}
-
 	fprintf(f, " = ");
-	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul < (len-nnul))
-	    && (nnotstringlbl == 0)) {
-		write_propval_string(f, prop->val);
-	} else if (((len % sizeof(cell_t)) == 0) && (nnotcelllbl == 0)) {
-		write_propval_cells(f, prop->val);
-	} else {
-		write_propval_bytes(f, prop->val);
-	}
 
+	for_each_marker_of_type(m, TYPE) {
+		switch ((intptr_t)m->ref) {
+		case TYPE_STRING:
+			write_propval_string(f, prop->val, m);
+			break;
+		case TYPE_ARRAY_INT32:
+		case TYPE_ARRAY_INT64:
+			write_propval_cells(f, prop->val, m);
+			break;
+		case TYPE_BYTE:
+		case TYPE_ARRAY_INT8:
+		case TYPE_ARRAY_INT16:
+		default:
+			write_propval_bytes(f, prop->val, m);
+		}
+	}
 	fprintf(f, ";\n");
 }
 
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
