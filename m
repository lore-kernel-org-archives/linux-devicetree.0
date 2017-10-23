From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: add bindings doc for hi3798cv200 combphy
Date: Mon, 23 Oct 2017 19:26:07 +0800
Message-ID: <1508757968-22729-2-git-send-email-shawnguo@kernel.org>
References: <1508757968-22729-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508757968-22729-1-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pengcheng Li <lpc.li-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

It adds the device tree bindings for PCIE/SATA/USB3 combo PHY found on
HiSilicon STB SoCs.

Signed-off-by: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/phy/phy-hi3798cv200-combphy.txt          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt b/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
new file mode 100644
index 000000000000..5fd548f078f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
@@ -0,0 +1,19 @@
+HiSilicon STB PCIE/SATA/USB3 PHY
+
+Properties:
+- compatible: Should be "hisilicon,hi3798cv200-combphy"
+- #phy-cells: Should be 1.  The cell number is used to select the phy mode
+  as defined in <dt-bindings/phy/phy.h>.
+- clocks: The phandle to clock provider and clock specifier pair.
+- resets: The phandle to reset controller and reset specifier pair.
+- hisilicon,peripheral-syscon: The phandle to the peripheral controller.
+
+Example:
+
+combphy1: phy {
+	compatible = "hisilicon,hi3798cv200-combphy";
+	#phy-cells = <1>;
+	clocks = <&crg HISTB_COMBPHY1_CLK>;
+	resets = <&crg 0x188 12>;
+	hisilicon,peripheral-syscon = <&peri_ctrl>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
