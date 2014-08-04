From: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv2 4/6] dt-bindings: arm: add Freescale LS1021A SoC device tree binding
Date: Mon, 4 Aug 2014 17:39:06 +0800
Message-ID: <1407145148-29217-5-git-send-email-jingchang.lu@freescale.com>
References: <1407145148-29217-1-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407145148-29217-1-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index e935d7d..c962124 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -74,3 +74,40 @@ Required root node properties:
 i.MX6q generic board
 Required root node properties:
     - compatible = "fsl,imx6q";
+
+
+Freescale LS1021A Platform Device Tree Bindings
+------------------------------------------------
+
+Required root node compatible properties:
+  - compatible = "fsl,ls1021a";
+
+SoC-specific device tree bindings for system configuration
+-------------------------------------------
+
+Required device node compatible properties:
+
+  - compatible = "fsl,ls1021a-scfg":
+	scfg is the supplemental configuration unit, provides SoC specific
+	configuration and status registers for the chip. There is no dedicate
+	driver for it, but for device whose configuration and status register
+	locates in this space should operate on it. Such as getting PEX port
+	status.
+
+  - compatible = "fsl,ls1021a-dcfg":
+	dcfg is the device configuration unit that provides general purpose
+	configuration and status for the device, there is no dedicate driver
+	for it, but for device whose configuration and status register locates
+	in this space should operate on it. Such as setting the secondary core
+	start address and release the secondary core from holdoff and startup.
+
+Example:
+	scfg: scfg@1570000 {
+		compatible = "fsl,ls1021a-scfg";
+		reg = <0x0 0x1570000 0x0 0x10000>;
+	};
+
+	dcfg: dcfg@1ee0000 {
+		compatible = "fsl,ls1021a-dcfg";
+		reg = <0x0 0x1ee0000 0x0 0x10000>;
+	};
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
