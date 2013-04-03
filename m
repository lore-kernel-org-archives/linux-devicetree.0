From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 2/7] kbuild: fixdep: support concatenated dep files
Date: Wed,  3 Apr 2013 17:34:53 -0600
Message-ID: <1365032098-22825-2-git-send-email-swarren@wwwdotorg.org>
References: <1365032098-22825-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365032098-22825-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The current use-case for fixdep is: a source file is run through a single
processing step, which creates a single dependency file as a side-effect,
which fixdep transforms into the file used by the kernel build process.

In order to transparently run the C pre-processor on device-tree files,
we wish to run both gcc -E and dtc on a source file in a single rule.
This generates two dependency files, which must be transformed together
into the file used by the kernel build process. This change modifies
fixdep so it can process the concatenation of multiple separate input
dependency files, and produce a correct unified output.

The code changes have the slight benefit of transforming the loop in
parse_dep_file() into more of a lexer/tokenizer, with the loop body being
more of a parser. Previously, some of this logic was mixed together
before the loop. I also added some comments, which I hope are useful.

Benchmarking shows that on a cross-compiled ARM tegra_defconfig build,
there is less than 0.5 seconds speed decrease with this change, on top
of a build time of ~2m24s. This is probably within the noise.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 scripts/basic/fixdep.c |   93 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 32 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 7f6425e..078fe1d 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -320,49 +320,78 @@ static void parse_dep_file(void *map, size_t len)
 	char *end = m + len;
 	char *p;
 	char s[PATH_MAX];
-	int first;
-
-	p = strchr(m, ':');
-	if (!p) {
-		fprintf(stderr, "fixdep: parse error\n");
-		exit(1);
-	}
-	memcpy(s, m, p-m); s[p-m] = 0;
-	m = p+1;
+	int is_target;
+	int saw_any_target = 0;
+	int is_first_dep = 0;
 
 	clear_config();
 
-	first = 1;
 	while (m < end) {
+		/* Skip any "white space" */
 		while (m < end && (*m == ' ' || *m == '\\' || *m == '\n'))
 			m++;
+		/* Find next "white space" */
 		p = m;
-		while (p < end && *p != ' ') p++;
-		if (p == end) {
-			do p--; while (!isalnum(*p));
+		while (p < end && *p != ' ' && *p != '\\' && *p != '\n')
 			p++;
+		/* Is the token we found a target name? */
+		is_target = (*(p-1) == ':');
+		/* Don't write any target names into the dependency file */
+		if (is_target) {
+			/* The /next/ file is the first dependency */
+			is_first_dep = 1;
+		} else {
+			/* Save this token/filename */
+			memcpy(s, m, p-m);
+			s[p - m] = 0;
+
+			/* Ignore certain dependencies */
+			if (strrcmp(s, "include/generated/autoconf.h") &&
+			    strrcmp(s, "arch/um/include/uml-config.h") &&
+			    strrcmp(s, "include/linux/kconfig.h") &&
+			    strrcmp(s, ".ver")) {
+				/*
+				 * Do not list the source file as dependency,
+				 * so that kbuild is not confused if a .c file
+				 * is rewritten into .S or vice versa. Storing
+				 * it in source_* is needed for modpost to
+				 * compute srcversions.
+				 */
+				if (is_first_dep) {
+					/*
+					 * If processing the concatenation of
+					 * multiple dependency files, only
+					 * process the first target name, which
+					 * will be the original source name,
+					 * and ignore any other target names,
+					 * which will be intermediate temporary
+					 * files.
+					 */
+					if (!saw_any_target) {
+						saw_any_target = 1;
+						printf("source_%s := %s\n\n",
+							target, s);
+						printf("deps_%s := \\\n",
+							target);
+					}
+					is_first_dep = 0;
+				} else
+					printf("  %s \\\n", s);
+				do_config_file(s);
+			}
 		}
-		memcpy(s, m, p-m); s[p-m] = 0;
-		if (strrcmp(s, "include/generated/autoconf.h") &&
-		    strrcmp(s, "arch/um/include/uml-config.h") &&
-		    strrcmp(s, "include/linux/kconfig.h") &&
-		    strrcmp(s, ".ver")) {
-			/*
-			 * Do not list the source file as dependency, so that
-			 * kbuild is not confused if a .c file is rewritten
-			 * into .S or vice versa. Storing it in source_* is
-			 * needed for modpost to compute srcversions.
-			 */
-			if (first) {
-				printf("source_%s := %s\n\n", target, s);
-				printf("deps_%s := \\\n", target);
-			} else
-				printf("  %s \\\n", s);
-			do_config_file(s);
-		}
-		first = 0;
+		/*
+		 * Start searching for next token immediately after the first
+		 * "whitespace" character that follows this token.
+		 */
 		m = p + 1;
 	}
+
+	if (!saw_any_target) {
+		fprintf(stderr, "fixdep: parse error; no targets found\n");
+		exit(1);
+	}
+
 	printf("\n%s: $(deps_%s)\n\n", target, target);
 	printf("$(deps_%s):\n", target);
 }
-- 
1.7.10.4
