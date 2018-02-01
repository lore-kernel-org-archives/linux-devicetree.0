From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 2/3] pinctrl: imx: allow to configure SION with generic pinconf
Date: Thu,  1 Feb 2018 18:49:22 +0100
Message-ID: <20180201174923.7385-2-l.stach@pengutronix.de>
References: <20180201174923.7385-1-l.stach@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20180201174923.7385-1-l.stach@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, "A . s . Dong" <aisheng.dong@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

The SION bit force enables the input buffer, overriding the configuration
driven by the muxed module. It is not located in the pad config register,
but in the mux register and thus needs special handling.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: new patch in v2
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 19 +++++++------------
 drivers/pinctrl/freescale/pinctrl-imx.h |  4 ++++
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 24aaddd760a0..c976ffe7d47b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -31,10 +31,6 @@
 #include "../pinmux.h"
 #include "pinctrl-imx.h"
 
-/* The bits in CONFIG cell defined in binding doc*/
-#define IMX_NO_PAD_CTL	0x80000000	/* no pin config need */
-#define IMX_PAD_SION 0x40000000		/* set SION */
-
 static inline const struct group_desc *imx_pinctrl_find_group_by_name(
 				struct pinctrl_dev *pctldev,
 				const char *name)
@@ -509,18 +505,17 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 		pin->mux_mode = be32_to_cpu(*list++);
 		pin->input_val = be32_to_cpu(*list++);
 
-		if (info->generic_pinconf) {
+		if (info->generic_pinconf)
 			/* generic pin config decoded */
 			pin->config = config;
-		} else {
+		else
 			/* legacy pin config read from devicetree */
-			config = be32_to_cpu(*list++);
+			pin->config = be32_to_cpu(*list++);
 
-			/* SION bit is in mux register */
-			if (config & IMX_PAD_SION)
-				pin->mux_mode |= IOMUXC_CONFIG_SION;
-			pin->config = config & ~IMX_PAD_SION;
-		}
+		/* SION bit is in mux register */
+		if (pin->config & IMX_PAD_SION)
+			pin->mux_mode |= IOMUXC_CONFIG_SION;
+		pin->config = pin->config & ~IMX_PAD_SION;
 
 		dev_dbg(ipctl->dev, "%s: 0x%x 0x%08lx", info->pins[pin_id].name,
 				pin->mux_mode, pin->config);
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 038e8c0e5b96..8e74ddc9cd8a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -18,6 +18,10 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinmux.h>
 
+/* The bits in CONFIG cell defined in binding doc*/
+#define IMX_NO_PAD_CTL	0x80000000	/* no pin config need */
+#define IMX_PAD_SION 0x40000000		/* set SION */
+
 struct platform_device;
 
 extern struct pinmux_ops imx_pmx_ops;
-- 
2.15.1

