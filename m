From: "Markus Mayer" <mmayer@broadcom.com>
Subject: [PATCH 1/1] Fix segfault in DTC
Date: Tue, 25 Sep 2012 10:58:09 -0700
Message-ID: <1348595889-6495-2-git-send-email-mmayer@broadcom.com>
References: <1348526885-2113-1-git-send-email-mmayer@broadcom.com>
 <1348595889-6495-1-git-send-email-mmayer@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1348595889-6495-1-git-send-email-mmayer@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jon Loeliger <jdl@jdl.com>, Markus Mayer <mmayer@broadcom.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

Prior to this change, an empty input file would cause a segfault, because
yylloc had never been initialized. There was never any characters for the
lexer to match, so YY_USER_ACTION was never executed before the parse error
was detected.

When the parser printed the error message, it tried to include the name of
the file, but the structure holding the file name (yylloc.file, referenced
as pos->file) had never been initialized.

Without the fix:

$ ./dtc /dev/null
DTC: dts->dts  on file "/dev/null"
Segmentation fault (core dumped)

$ gdb dtc core
Program terminated with signal 11, Segmentation fault.
    at scripts/dtc/srcpos.c:194
194			fname = pos->file->name;
(gdb) bt
    at scripts/dtc/srcpos.c:194
    fmt=0x40d769 "%s", va=0x7fffbf027148) at scripts/dtc/srcpos.c:220
    at scripts/dtc/dtc-parser.tab.c:1920
    at scripts/dtc/treesource.c:38
    at scripts/dtc/dtc.c:203
(gdb) p *pos
$1 = {first_line = 0, first_column = 0, last_line = 0, last_column = 0,
  file = 0x0}

With the fix:

$ ./dtc /dev/null
DTC: dts->dts  on file "/dev/null"
Error: /dev/null:1.1 syntax error
FATAL ERROR: Unable to parse input tree

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 scripts/dtc/treesource.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/dtc/treesource.c b/scripts/dtc/treesource.c
index c09aafa..b461b88 100644
--- a/scripts/dtc/treesource.c
+++ b/scripts/dtc/treesource.c
@@ -29,11 +29,15 @@ int treesource_error;
 
 struct boot_info *dt_from_source(const char *fname)
 {
+	extern YYLTYPE yylloc;
+
 	the_boot_info = NULL;
 	treesource_error = 0;
 
 	srcfile_push(fname);
 	yyin = current_srcfile->f;
+	/* Initialize yylloc->file to avoid segfault on empty input */
+	srcpos_update(&yylloc, NULL, 0);
 
 	if (yyparse() != 0)
 		die("Unable to parse input tree\n");
-- 
1.7.5.4
