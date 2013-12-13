From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/3] dtc: Keep type information from DTS
Date: Fri, 13 Dec 2013 17:49:10 +0100
Message-ID: <1386953352-25402-2-git-send-email-t.figa@samsung.com>
References: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1386953352-25402-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently dtc loses information about data types when parsing DTS,
because it flattens all the parsed property data into a flat stream of
bytes. The only saved metadata is for references to other nodes inside
cell arrays. This makes it impossible to do any checks on data types on
livetree representation.

This patch makes dtc store type information inside data struct by using
marker infrastructure. A new type of marker is introduced that holds
type enum as its ref member. Such markers are then inserted wherever
data of given type starts, so information about type of each property
data section is preserved.

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 data.c       |  3 ++-
 dtc-parser.y | 47 +++++++++++++++++++++++++++++++++++------------
 dtc.h        | 10 ++++++++++
 livetree.c   | 16 ++++++++++++----
 4 files changed, 59 insertions(+), 17 deletions(-)

diff --git a/data.c b/data.c
index 4c50b12..a33b475 100644
--- a/data.c
+++ b/data.c
@@ -27,7 +27,8 @@ void data_free(struct data d)
 	m = d.markers;
 	while (m) {
 		nm = m->next;
-		free(m->ref);
+		if (m->type != TYPE)
+			free(m->ref);
 		free(m);
 		m = nm;
 	}
diff --git a/dtc-parser.y b/dtc-parser.y
index 4864631..0ba6cc6 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -209,7 +209,9 @@ propdef:
 propdata:
 	  propdataprefix DT_STRING
 		{
-			$$ = data_merge($1, $2);
+			struct data d;
+			d = data_add_marker($1, TYPE, (char *)TYPE_STRING);
+			$$ = data_merge(d, $2);
 		}
 	| propdataprefix arrayprefix '>'
 		{
@@ -217,16 +219,21 @@ propdata:
 		}
 	| propdataprefix '[' bytestring ']'
 		{
-			$$ = data_merge($1, $3);
+			struct data d;
+			d = data_add_marker($1, TYPE, (char *)TYPE_BYTE);
+			$$ = data_merge(d, $3);
 		}
 	| propdataprefix DT_REF
 		{
-			$$ = data_add_marker($1, REF_PATH, $2);
+			struct data d;
+			d = data_add_marker($1, TYPE, (char *)TYPE_STRING);
+			$$ = data_add_marker(d, REF_PATH, $2);
 		}
 	| propdataprefix DT_INCBIN '(' DT_STRING ',' integer_prim ',' integer_prim ')'
 		{
 			FILE *f = srcfile_relative_open($4.val, NULL);
 			struct data d;
+			struct data orig;
 
 			if ($6 != 0)
 				if (fseek(f, $6, SEEK_SET) != 0)
@@ -236,18 +243,21 @@ propdata:
 						     strerror(errno));
 
 			d = data_copy_file(f, $8);
+			orig = data_add_marker($1, TYPE, (char *)TYPE_BYTE);
 
-			$$ = data_merge($1, d);
+			$$ = data_merge(orig, d);
 			fclose(f);
 		}
 	| propdataprefix DT_INCBIN '(' DT_STRING ')'
 		{
 			FILE *f = srcfile_relative_open($4.val, NULL);
 			struct data d = empty_data;
+			struct data orig;
 
+			orig = data_add_marker($1, TYPE, (char *)TYPE_BYTE);
 			d = data_copy_file(f, -1);
 
-			$$ = data_merge($1, d);
+			$$ = data_merge(orig, d);
 			fclose(f);
 		}
 	| propdata DT_LABEL
@@ -274,22 +284,35 @@ propdataprefix:
 arrayprefix:
 	DT_BITS DT_LITERAL '<'
 		{
-			$$.data = empty_data;
 			$$.bits = eval_literal($2, 0, 7);
 
-			if (($$.bits !=  8) &&
-			    ($$.bits != 16) &&
-			    ($$.bits != 32) &&
-			    ($$.bits != 64))
-			{
+			switch ($$.bits) {
+			case 8:
+				$$.data = data_add_marker(empty_data,
+						TYPE, (char *)TYPE_ARRAY_INT8);
+				break;
+			case 16:
+				$$.data = data_add_marker(empty_data,
+						TYPE, (char *)TYPE_ARRAY_INT16);
+				break;
+			case 64:
+				$$.data = data_add_marker(empty_data,
+						TYPE, (char *)TYPE_ARRAY_INT64);
+				break;
+			default:
 				print_error("Only 8, 16, 32 and 64-bit elements"
 					    " are currently supported");
 				$$.bits = 32;
+				/* Fall through */
+			case 32:
+				$$.data = data_add_marker(empty_data,
+						TYPE, (char *)TYPE_ARRAY_INT32);
 			}
 		}
 	| '<'
 		{
-			$$.data = empty_data;
+			$$.data = data_add_marker(empty_data,
+						TYPE, (char *)TYPE_ARRAY_INT32);
 			$$.bits = 32;
 		}
 	| arrayprefix integer_prim
diff --git a/dtc.h b/dtc.h
index 20e4d56..e800600 100644
--- a/dtc.h
+++ b/dtc.h
@@ -72,6 +72,16 @@ enum markertype {
 	REF_PHANDLE,
 	REF_PATH,
 	LABEL,
+	TYPE,
+};
+
+enum datatype {
+	TYPE_STRING,
+	TYPE_BYTE,
+	TYPE_ARRAY_INT8,
+	TYPE_ARRAY_INT16,
+	TYPE_ARRAY_INT32,
+	TYPE_ARRAY_INT64,
 };
 
 struct  marker {
diff --git a/livetree.c b/livetree.c
index b61465f..9a1536d 100644
--- a/livetree.c
+++ b/livetree.c
@@ -530,16 +530,24 @@ cell_t get_node_phandle(struct node *root, struct node *node)
 	node->phandle = phandle;
 
 	if (!get_property(node, "linux,phandle")
-	    && (phandle_format & PHANDLE_LEGACY))
+	    && (phandle_format & PHANDLE_LEGACY)) {
+		struct data d;
+
+		d = data_add_marker(empty_data, TYPE, (char *)TYPE_ARRAY_INT32);
 		add_property(node,
 			     build_property("linux,phandle",
-					    data_append_cell(empty_data, phandle)));
+					    data_append_cell(d, phandle)));
+	}
 
 	if (!get_property(node, "phandle")
-	    && (phandle_format & PHANDLE_EPAPR))
+	    && (phandle_format & PHANDLE_EPAPR)) {
+		struct data d;
+
+		d = data_add_marker(empty_data, TYPE, (char *)TYPE_ARRAY_INT32);
 		add_property(node,
 			     build_property("phandle",
-					    data_append_cell(empty_data, phandle)));
+					    data_append_cell(d, phandle)));
+	}
 
 	/* If the node *does* have a phandle property, we must
 	 * be dealing with a self-referencing phandle, which will be
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
