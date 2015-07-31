From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 1/5] dt-bindings: Add usb3.0 phy binding for MT65xx SoCs
Date: Fri, 31 Jul 2015 21:03:52 +0800
Message-ID: <1438347836-29060-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1438347836-29060-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438347836-29060-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add a DT binding documentation of usb3.0 phy for MT65xx
SoCs from Mediatek.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/phy/phy-mt65xx-usb.txt      | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
new file mode 100644
index 0000000..752abc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
@@ -0,0 +1,21 @@
+MT65xx USB3.0 PHY
+
+The device node for Mediatek SOC usb3.0 phy
+
+Required properties:
+ - compatible : Should be "mediatek,mt8173-u3phy"
+ - reg        : Offset and length of registers for phy domain
+ - clocks     : must support all clocks that phy need
+ - clock-names: should be "u3phya_ref" for u3phya reference clock.
+ - #phy-cells : must be 1 for the phy
+
+Example:
+
+u3phy: usb-phy@11290000 {
+	compatible = "mediatek,mt8173-u3phy";
+	reg = <0 0x11290000 0 0x3000>;
+	clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+	clock-names = "u3phya_ref";
+	#phy-cells = <1>;
+	status = "okay";
+};
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
