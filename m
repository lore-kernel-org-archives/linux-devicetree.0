From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] dtc: Inject guessed type information in case of flat and
 fs trees
Date: Fri, 13 Dec 2013 17:49:11 +0100
Message-ID: <1386953352-25402-3-git-send-email-t.figa@samsung.com>
References: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1386953352-25402-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since flat and fs trees do not provide any kind of type information,
just raw data, types must be guessed based on some data analysis, as it
is currently done when generating DTS back from livetree representation.

This patch moves data type guessing from livetree printing code to
generic helper function that can be called when parsing flat and fs
trees. In effect, printing can be modified to use type markers alone
instead of guessing in further patch.

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 data.c     | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h      |  2 ++
 flattree.c |  2 +-
 fstree.c   |  6 ++++--
 4 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/data.c b/data.c
index a33b475..25888ae 100644
--- a/data.c
+++ b/data.c
@@ -268,3 +268,62 @@ bool data_is_one_string(struct data d)
 
 	return true;
 }
+
+static bool isstring(char c)
+{
+	return (isprint(c)
+		|| (c == '\0')
+		|| strchr("\a\b\t\n\v\f\r", c));
+}
+
+struct data data_detect_type(struct data d)
+{
+	int len = d.len;
+	const char *p = d.val;
+	int nnotstring = 0, nnul = 0;
+	struct marker *m;
+	int i;
+
+	if (len == 0)
+		return d;
+
+	assert(d.markers == NULL);
+
+	for (i = 0; i < len; i++) {
+		if (!isstring(p[i]))
+			nnotstring++;
+		if (p[i] == '\0')
+			nnul++;
+	}
+
+	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul < (len-nnul))) {
+		int offset = 0;
+		/* String(s) */
+		do {
+			m = xmalloc(sizeof(*m));
+			m->offset = offset;
+			m->type = TYPE;
+			m->next = NULL;
+			m->ref = (char *)TYPE_STRING;
+			d = data_append_markers(d, m);
+			offset += strlen(p + offset) + 1;
+		} while (offset < len && p[offset] != '\0');
+		return d;
+	} else if (((len % sizeof(cell_t)) == 0)) {
+		/* Cells */
+		m = xmalloc(sizeof(*m));
+		m->offset = 0;
+		m->type = TYPE;
+		m->next = NULL;
+		m->ref = (char *)TYPE_ARRAY_INT32;
+		return data_append_markers(d, m);
+	} else {
+		/* Bytes */
+		m = xmalloc(sizeof(*m));
+		m->offset = 0;
+		m->type = TYPE;
+		m->next = NULL;
+		m->ref = (char *)TYPE_BYTE;
+		return data_append_markers(d, m);
+	}
+}
diff --git a/dtc.h b/dtc.h
index e800600..6dd4797 100644
--- a/dtc.h
+++ b/dtc.h
@@ -128,6 +128,8 @@ struct data data_append_align(struct data d, int align);
 
 struct data data_add_marker(struct data d, enum markertype type, char *ref);
 
+struct data data_detect_type(struct data d);
+
 bool data_is_one_string(struct data d);
 
 /* DT constraints */
diff --git a/flattree.c b/flattree.c
index bd99fa2..93cdacb 100644
--- a/flattree.c
+++ b/flattree.c
@@ -690,7 +690,7 @@ static struct property *flat_read_property(struct inbuf *dtbuf,
 	if ((flags & FTF_VARALIGN) && (proplen >= 8))
 		flat_realign(dtbuf, 8);
 
-	val = flat_read_data(dtbuf, proplen);
+	val = data_detect_type(flat_read_data(dtbuf, proplen));
 
 	return build_property(name, val);
 }
diff --git a/fstree.c b/fstree.c
index f377453..bb3fd50 100644
--- a/fstree.c
+++ b/fstree.c
@@ -58,9 +58,11 @@ static struct node *read_fstree(const char *dirname)
 					"WARNING: Cannot open %s: %s\n",
 					tmpnam, strerror(errno));
 			} else {
+				struct data d = data_copy_file(pfile,
+								st.st_size);
+
 				prop = build_property(xstrdup(de->d_name),
-						      data_copy_file(pfile,
-								     st.st_size));
+							data_detect_type(d));
 				add_property(tree, prop);
 				fclose(pfile);
 			}
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
