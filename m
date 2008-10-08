From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: [experimental] Process input files with cpp
Date: Wed, 8 Oct 2008 13:53:12 +1100
Message-ID: <20081008025312.GC13615@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

I'm starting to be convinced by the arguments that we need internal
function processing instead of using preprocessor macros.  However, in
the interests of more bits and pieces to play with, here's an
experimental patch that causes dtc to run its input files through cpp
before reading them.

This uses a probably not portable option to GNU cpp to make it only
recognize # characters in column 0, and disables rather than using the
file/line number information the preprocessor would usually include in
its output.  All fixable, but like I say, this is just for playing
with, not an actual proposal.

---

This applies on top of my srcpos / input file rework series.

Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2008-10-07 17:07:28.000000000 +1100
+++ dtc/srcpos.c	2008-10-07 17:07:31.000000000 +1100
@@ -46,7 +46,8 @@ struct srcfile_state *current_srcfile; /
 #define MAX_SRCFILE_DEPTH     (100)
 static int srcfile_depth; /* = 0 */
 
-FILE *srcfile_relative_open(const char *fname, char **fullnamep)
+static FILE *__srcfile_relative_open(const char *fname, char **fullnamep,
+				     int preprocess)
 {
 	FILE *f;
 	char *fullname;
@@ -61,7 +62,15 @@ FILE *srcfile_relative_open(const char *
 		else
 			fullname = join_path(current_srcfile->dir, fname);
 
-		f = fopen(fullname, "r");
+		if (!preprocess) {
+			f = fopen(fullname, "r");
+		} else {
+			char *cmd;
+
+			asprintf(&cmd, "cpp -traditional-cpp -undef -P < %s", fullname);
+			f = popen(cmd, "r");
+			free(cmd);
+		}
 		if (!f)
 			die("Couldn't open \"%s\": %s\n", fname,
 			    strerror(errno));
@@ -75,6 +84,11 @@ FILE *srcfile_relative_open(const char *
 	return f;
 }
 
+FILE *srcfile_relative_open(const char *fname, char **fullnamep)
+{
+	return __srcfile_relative_open(fname, fullnamep, 0);
+}
+
 void srcfile_push(const char *fname)
 {
 	struct srcfile_state *srcfile;
@@ -84,7 +98,7 @@ void srcfile_push(const char *fname)
 
 	srcfile = xmalloc(sizeof(*srcfile));
 
-	srcfile->f = srcfile_relative_open(fname, &srcfile->name);
+	srcfile->f = __srcfile_relative_open(fname, &srcfile->name, 1);
 	srcfile->dir = dirname(srcfile->name);
 	srcfile->prev = current_srcfile;
 


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
