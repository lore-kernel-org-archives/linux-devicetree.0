From: Horst Kronstorfer <hkronsto-USXAA5bZaHGDvotElmWtJA@public.gmane.org>
Subject: [PATCH] dtc: Fix zero-length input segfault
Date: Tue,  7 Feb 2012 10:02:53 +0100
Message-ID: <1328605373-14063-1-git-send-email-hkronsto@frequentis.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Horst Kronstorfer <hkronsto-USXAA5bZaHGDvotElmWtJA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fixes a segmentation fault caused by dereferencing a NULL
pointer (pos->file aka yylloc.file) in srcpos_string when the input
length is 0 (fe 'dtc </dev/null'.) Reason: yylloc.file is initialized
with 0 and the tokenizer, which updates yylloc.file via srcpos_update
doesn't get a chance to run on zero-length input.

Signed-off-by: Horst Kronstorfer <hkronsto-USXAA5bZaHGDvotElmWtJA@public.gmane.org>
---
 treesource.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/treesource.c b/treesource.c
index c09aafa..33eeba5 100644
--- a/treesource.c
+++ b/treesource.c
@@ -23,6 +23,7 @@
 
 extern FILE *yyin;
 extern int yyparse(void);
+extern YYLTYPE yylloc;
 
 struct boot_info *the_boot_info;
 int treesource_error;
@@ -34,6 +35,7 @@ struct boot_info *dt_from_source(const char *fname)
 
 	srcfile_push(fname);
 	yyin = current_srcfile->f;
+	yylloc.file = current_srcfile;
 
 	if (yyparse() != 0)
 		die("Unable to parse input tree\n");
-- 
1.7.7.6
