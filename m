From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [3/4] dtc: Cleanup srcpos_string()
Date: Mon, 9 Feb 2009 13:57:40 +1100
Message-ID: <20090209025740.GF19864@yookeroo.seuss>
References: <20090209025446.GC19864@yookeroo.seuss>
	<20090209025601.GD19864@yookeroo.seuss>
	<20090209025647.GE19864@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090209025647.GE19864-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

There are several small problems with the current srcpos_string().

	- The code unnecessarily uses a temp buffer and two rounds of
	  *printf(); a single asprintf() will suffice.

	- With previous changes, pos->file->name can never be NULL,
          and the name field for a srcfile bound to stdin is already
          set to something sensible.

	- On allocation failure in asprintf() it returns a bogus
          result, instead of causing a fatal error like every other
          failed allocation.

	- The format for representing file/line/column is gratuitously
          different from the file/line format we used to use, and the
          format used by gcc and bison.

This patch addresses all of these.  There remains the problem that
asprintf() is not portable, but that can wait until another patch.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 srcpos.c |   49 ++++++++++++++++++-------------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2009-02-09 13:52:11.000000000 +1100
+++ dtc/srcpos.c	2009-02-09 13:52:14.000000000 +1100
@@ -182,41 +182,28 @@ srcpos_dump(srcpos *pos)
 char *
 srcpos_string(srcpos *pos)
 {
-	const char *fname;
-	char col_buf[100];
+	const char *fname = "<no-file>";
 	char *pos_str;
+	int rc;
 
-	if (!pos) {
-		fname = "<no-file>";
-	} else if (pos->file->name) {
+	if (pos)
 		fname = pos->file->name;
-		if (strcmp(fname, "-") == 0)
-			fname = "stdin";
-	} else {
-		fname = "<no-file>";
-	}
-
-	if (pos->first_line == pos->last_line) {
-		if (pos->first_column == pos->last_column) {
-			snprintf(col_buf, sizeof(col_buf),
-				 "%d:%d",
-				 pos->first_line, pos->first_column);
-		} else {
-			snprintf(col_buf, sizeof(col_buf),
-				 "%d:%d-%d",
-				 pos->first_line,
-				 pos->first_column, pos->last_column);
-		}
-
-	} else {
-		snprintf(col_buf, sizeof(col_buf),
-			 "%d:%d - %d:%d",
-			 pos->first_line, pos->first_column,
-			 pos->last_line, pos->last_column);
-	}
 
-	if (asprintf(&pos_str, "%s %s", fname, col_buf) == -1)
-		return "<unknown source position?";
+
+	if (pos->first_line != pos->last_line)
+		rc = asprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
+			      pos->first_line, pos->first_column,
+			      pos->last_line, pos->last_column);
+	else if (pos->first_column != pos->last_column)
+		rc = asprintf(&pos_str, "%s:%d.%d-%d", fname,
+			      pos->first_line, pos->first_column,
+			      pos->last_column);
+	else
+		rc = asprintf(&pos_str, "%s:%d.%d", fname,
+			      pos->first_line, pos->first_column);
+
+	if (rc == -1)
+		die("Couldn't allocate in srcpos string");
 
 	return pos_str;
 }


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
