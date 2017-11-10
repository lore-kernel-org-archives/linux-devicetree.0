From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: sh-pfc: add PORT_GP_CFG_{6|22}() helper macros
Date: Fri, 10 Nov 2017 20:59:00 +0300
Message-ID: <20171110181547.933934369@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=pinctrl-sh-pfc-add-PORT_GP_CFG_-6-22-helper-macros.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

They follow the style of the existing PORT_GP_CFG_<n>() macros and
will be used by a follow-up  patch for the R8A77970 SoC.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>.

Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/pinctrl/sh-pfc/sh_pfc.h |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

Index: renesas-drivers/drivers/pinctrl/sh-pfc/sh_pfc.h
===================================================================
--- renesas-drivers.orig/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ renesas-drivers/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -389,10 +389,14 @@ extern const struct sh_pfc_soc_info shx3
 	PORT_GP_CFG_1(bank, 3,  fn, sfx, cfg)
 #define PORT_GP_4(bank, fn, sfx)	PORT_GP_CFG_4(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_6(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_4(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 4,  fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 5,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 5,  fn, sfx, cfg)
+#define PORT_GP_6(bank, fn, sfx)	PORT_GP_CFG_6(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_6(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 6,  fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 7,  fn, sfx, cfg)
 #define PORT_GP_8(bank, fn, sfx)	PORT_GP_CFG_8(bank, fn, sfx, 0)
@@ -450,9 +454,13 @@ extern const struct sh_pfc_soc_info shx3
 	PORT_GP_CFG_1(bank, 20, fn, sfx, cfg)
 #define PORT_GP_21(bank, fn, sfx)	PORT_GP_CFG_21(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_23(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_22(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_21(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 21, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 21, fn, sfx, cfg)
+#define PORT_GP_22(bank, fn, sfx)	PORT_GP_CFG_22(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_23(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_22(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 22, fn, sfx, cfg)
 #define PORT_GP_23(bank, fn, sfx)	PORT_GP_CFG_23(bank, fn, sfx, 0)
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
