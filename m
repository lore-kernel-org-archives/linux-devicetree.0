From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 3/4] plugin: Transparently support old style syntax
Date: Thu,  5 May 2016 22:48:43 +0300
Message-ID: <1462477724-8092-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462477724-8092-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The old style syntax for plugins is still out in the wild.
This patch transparently support it.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 dtc-parser.y | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 2d3399e..3f006b4 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -76,6 +76,7 @@ extern bool treesource_error;
 %type <data> propdataprefix
 %type <flags> versioninfo
 %type <flags> plugindecl
+%type <flags> oldplugindecl
 %type <re> memreserve
 %type <re> memreserves
 %type <array> arrayprefix
@@ -106,10 +107,10 @@ extern bool treesource_error;
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
 
@@ -131,6 +132,17 @@ plugindecl:
 		}
 	;
 
+oldplugindecl:
+	DT_PLUGIN ';'
+		{
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
