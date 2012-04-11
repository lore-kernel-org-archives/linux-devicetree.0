From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] dtc: Remove spurious output on stderr
Date: Wed, 11 Apr 2012 11:55:16 -0700
Message-ID: <1334170516-23473-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Outputing to stderr is best avoided unless there is an error or warning to
display. At present dtc always displays the name of the file it is compiling
and the input/output formats. For example:

DTC: dts->dts  on file "-"

This can cause problems in some build systems. For example, U-Boot shows
build errors for any boards which use dtc at present. It is typically the
only message output during such a build. The C compiler does not output
anything in general. The current dtc behaviour makes it difficult to
provide a silent build in the normal case where nothing went wrong.

The -q flag is currently used to ignore warnings, and this message is not
really a warning. If we inserted another level of quietness that just
supresses non-warnings, then this would break the current behaviour of -q.

Therefore a new flag seems appropriate. Unfortunately both -v and -V are
already used, so I have come up with the random choice of -a: "announce
operation".

This also changes current behaviour, but hopefully in a good way. The main
problem is that people will wonder whether dtc actually ran at all, since
they are used to seeing the message. A quick check should confirm this, or
the -a flag can be added if desired.

I'm hoping someone has a better solution.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 dtc.c |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/dtc.c b/dtc.c
index 83aef32..685d046 100644
--- a/dtc.c
+++ b/dtc.c
@@ -58,6 +58,8 @@ static void  __attribute__ ((noreturn)) usage(void)
 	fprintf(stderr, "\t\tThis help text\n");
 	fprintf(stderr, "\t-q\n");
 	fprintf(stderr, "\t\tQuiet: -q suppress warnings, -qq errors, -qqq all\n");
+	fprintf(stderr, "\t-a\n");
+	fprintf(stderr, "\t\tAnnounce: Announce the file being processed\n");
 	fprintf(stderr, "\t-I <input format>\n");
 	fprintf(stderr, "\t\tInput formats are:\n");
 	fprintf(stderr, "\t\t\tdts - device tree source text\n");
@@ -103,7 +105,7 @@ int main(int argc, char *argv[])
 	const char *outform = "dts";
 	const char *outname = "-";
 	const char *depname = NULL;
-	int force = 0, sort = 0;
+	int force = 0, sort = 0, announce = 0;
 	const char *arg;
 	int opt;
 	FILE *outf = NULL;
@@ -115,9 +117,12 @@ int main(int argc, char *argv[])
 	minsize    = 0;
 	padsize    = 0;
 
-	while ((opt = getopt(argc, argv, "hI:O:o:V:d:R:S:p:fqb:i:vH:s"))
+	while ((opt = getopt(argc, argv, "ahI:O:o:V:d:R:S:p:fqb:i:vH:s"))
 			!= EOF) {
 		switch (opt) {
+		case 'a':
+			announce = 1;
+			break;
 		case 'I':
 			inform = optarg;
 			break;
@@ -193,8 +198,11 @@ int main(int argc, char *argv[])
 	if (minsize)
 		fprintf(stderr, "DTC: Use of \"-S\" is deprecated; it will be removed soon, use \"-p\" instead\n");
 
-	fprintf(stderr, "DTC: %s->%s  on file \"%s\"\n",
-		inform, outform, arg);
+	/* Messages on stderr are bad, so don't print this one unless asked */
+	if (announce) {
+		fprintf(stderr, "DTC: %s->%s  on file \"%s\"\n",
+			inform, outform, arg);
+	}
 
 	if (depname) {
 		depfile = fopen(depname, "w");
-- 
1.7.7.3
