From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v3 2/3] pinctrl: imx: allow to configure SION with generic pinconf
Date: Wed, 20 Jun 2018 10:24:22 +0300
Message-ID: <1529479463-26961-3-git-send-email-abel.vesa@nxp.com>
References: <1529479463-26961-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529479463-26961-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach@pengutronix.de>

The SION bit force enables the input buffer, overriding the configuration
driven by the muxed module. It is not located in the pad config register,
but in the mux register and thus needs special handling.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 19 +++++++------------
 drivers/pinctrl/freescale/pinctrl-imx.h |  4 ++++
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 1c6bb15..335edc9 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -26,10 +26,6 @@
 #include "../pinmux.h"
 #include "pinctrl-imx.h"
 
-/* The bits in CONFIG cell defined in binding doc*/
-#define IMX_NO_PAD_CTL	0x80000000	/* no pin config need */
-#define IMX_PAD_SION 0x40000000		/* set SION */
-
 static inline const struct group_desc *imx_pinctrl_find_group_by_name(
 				struct pinctrl_dev *pctldev,
 				const char *name)
@@ -514,18 +510,17 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
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
index 4b8225c..44567a6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -14,6 +14,10 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinmux.h>
 
+/* The bits in CONFIG cell defined in binding doc*/
+#define IMX_NO_PAD_CTL	0x80000000	/* no pin config need */
+#define IMX_PAD_SION 0x40000000		/* set SION */
+
 struct platform_device;
 
 extern struct pinmux_ops imx_pmx_ops;
-- 
2.7.4
