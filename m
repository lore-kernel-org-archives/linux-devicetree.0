From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7 5/5] plugin: Transparently support old style syntax
Date: Tue, 24 May 2016 20:50:39 +0300
Message-ID: <1464112239-29856-6-git-send-email-pantelis.antoniou@konsulko.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464112239-29856-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The old style syntax for plugins is still out in the wild.
This patch transparently support it.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 dtc-parser.y | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 2890c1c..4a67baf 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -77,6 +77,7 @@ extern unsigned int the_versionflags;
 %type <data> propdataprefix
 %type <flags> versioninfo
 %type <flags> plugindecl
+%type <flags> oldplugindecl
 %type <re> memreserve
 %type <re> memreserves
 %type <array> arrayprefix
@@ -107,10 +108,10 @@ extern unsigned int the_versionflags;
 %%
 
 sourcefile:
-	  versioninfo ';' memreserves devicetree
+	  versioninfo ';' oldplugindecl memreserves devicetree
 		{
-			the_boot_info = build_boot_info($1, $3, $4,
-							guess_boot_cpuid($4));
+			the_boot_info = build_boot_info($1 | $3, $4, $5,
+							guess_boot_cpuid($5));
 		}
 	;
 
@@ -134,6 +135,18 @@ plugindecl:
 		}
 	;
 
+oldplugindecl:
+	DT_PLUGIN ';'
+		{
+			the_versionflags |= VF_PLUGIN;
+			$$ = VF_PLUGIN;
+		}
+	| /* empty */
+		{
+			$$ = 0;
+		}
+	;
+
 memreserves:
 	  /* empty */
 		{
-- 
1.7.12
