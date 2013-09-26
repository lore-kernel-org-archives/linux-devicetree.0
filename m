From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] Documentation: Add device tree bindings for i.MX TVE
Date: Thu, 26 Sep 2013 12:46:13 +0200
Message-ID: <1380192374-9531-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds device tree binding documentation for i.MX Television Encoder
devices contained in i.MX51 and i.MX53 SoCs.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/video/fsl,imx-tve.txt      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/fsl,imx-tve.txt

diff --git a/Documentation/devicetree/bindings/video/fsl,imx-tve.txt b/Documentation/devicetree/bindings/video/fsl,imx-tve.txt
new file mode 100644
index 0000000..77f92d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/fsl,imx-tve.txt
@@ -0,0 +1,23 @@
+Freescale i.MX Television Encoder (TVE, TVEv2)
+
+The TVE encoders are contained in i.MX51 and i.MX53 SoCs and can drive analog
+output connectors such as VGA, Composite, or S-Video.
+
+Required properties:
+- compatible : "fsl,<soc>-tve", soc should be imx51 or imx53
+- reg : Should contain 1 register ranges(address and length)
+- interrupts : One interrupt of the fb dev
+- clocks, clock-names : Phandles to clocks called "tve" and "di_sel"
+  as documented in Documentation/devicetree/bindings/clock/clock-bindings.txt.
+  di_sel is a display interface input clock multiplexer, which can
+  be parented to the tve_di output clock provided by this device.
+
+Example:
+
+	tve: tve@63ff0000 {
+		compatible = "fsl,imx53-tve";
+		reg = <0x63ff0000 0x1000>;
+		interrupts = <92>;
+		clocks = <&clks 69>, <&clks 116>;
+		clock-names = "tve", "di_sel";
+	};
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
