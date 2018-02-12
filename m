From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH v5 09/26] soc: renesas: rcar-rst: Enable watchdog as reset trigger for Gen2
Date: Mon, 12 Feb 2018 17:44:18 +0000
Message-ID: <1518457475-4480-10-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518457475-4480-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch allows for platform specific quirks as some of the SoC need
further customization for the watchdog to work properly, like for R-Car
Gen2 and for RZ/G.

Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
v4->v5:
* no change

 drivers/soc/renesas/rcar-rst.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 3316b02..93febe6 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -13,8 +13,18 @@
 #include <linux/of_address.h>
 #include <linux/soc/renesas/rcar-rst.h>
 
+#define WDTRSTCR_RESET		0xA55A0002
+#define WDTRSTCR		0x0054
+
+static int rcar_rst_enable_wdt_reset(void __iomem *base)
+{
+	iowrite32(WDTRSTCR_RESET, base + WDTRSTCR);
+	return 0;
+}
+
 struct rst_config {
-	unsigned int modemr;	/* Mode Monitoring Register Offset */
+	unsigned int modemr;		/* Mode Monitoring Register Offset */
+	int (*configure)(void *base);	/* Platform specific configuration */
 };
 
 static const struct rst_config rcar_rst_gen1 __initconst = {
@@ -23,6 +33,11 @@ static const struct rst_config rcar_rst_gen1 __initconst = {
 
 static const struct rst_config rcar_rst_gen2 __initconst = {
 	.modemr = 0x60,
+	.configure = rcar_rst_enable_wdt_reset,
+};
+
+static const struct rst_config rcar_rst_gen3 __initconst = {
+	.modemr = 0x60,
 };
 
 static const struct of_device_id rcar_rst_matches[] __initconst = {
@@ -38,11 +53,11 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	{ .compatible = "renesas,r8a7792-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a7793-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a7794-rst", .data = &rcar_rst_gen2 },
-	/* R-Car Gen3 is handled like R-Car Gen2 */
-	{ .compatible = "renesas,r8a7795-rst", .data = &rcar_rst_gen2 },
-	{ .compatible = "renesas,r8a7796-rst", .data = &rcar_rst_gen2 },
-	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen2 },
-	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen2 },
+	/* R-Car Gen3 */
+	{ .compatible = "renesas,r8a7795-rst", .data = &rcar_rst_gen3 },
+	{ .compatible = "renesas,r8a7796-rst", .data = &rcar_rst_gen3 },
+	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen3 },
+	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen3 },
 	{ /* sentinel */ }
 };
 
@@ -71,6 +86,14 @@ static int __init rcar_rst_init(void)
 	rcar_rst_base = base;
 	cfg = match->data;
 	saved_mode = ioread32(base + cfg->modemr);
+	if (cfg->configure) {
+		error = cfg->configure(base);
+		if (error) {
+			pr_warn("%pOF: Cannot run SoC specific configuration\n",
+				np);
+			goto out_put;
+		}
+	}
 
 	pr_debug("%pOF: MODE = 0x%08x\n", np, saved_mode);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
