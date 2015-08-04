From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/3] nvmem: Add i.MX6 OCOTP device tree binding documentation
Date: Tue,  4 Aug 2015 15:02:20 +0200
Message-ID: <1438693342-605-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch documents the i.MX6 OCOTP device tree binding.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/nvmem/imx-ocotp.txt          | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
new file mode 100644
index 0000000..7d9a3fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
@@ -0,0 +1,20 @@
+Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
+
+This binding represents the on-chip eFuse OTP controller found on
+i.MX6Q/D, i.MX6DL/S, i.MX6SL, and i.MX6SX SoCs.
+
+Required properties:
+- compatible: should be one of
+	"fsl,imx6q-ocotp" (i.MX6Q/D/DL/S),
+        "fsl,imx6sl-ocotp" (i.MX6SL), or
+	"fsl,imx6sx-ocotp" (i.MX6SX), followed by "syscon".
+- reg: Should contain the register base and length.
+- clocks: Should contain a phandle pointing to the gated peripheral clock.
+
+Example:
+
+	ocotp: ocotp@021bc000 {
+		compatible = "fsl,imx6q-ocotp", "syscon";
+		reg = <0x021bc000 0x4000>;
+		clocks = <&clks IMX6QDL_CLK_IIM>;
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
