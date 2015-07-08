From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/5] dt-bindings: Add a binding for Mediatek xHCI host
 controller
Date: Wed, 8 Jul 2015 17:41:04 +0800
Message-ID: <1436348468-4126-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1436348468-4126-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1436348468-4126-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add a DT binding documentation of xHCI host controller for the
MT8173 SoC from Mediatek.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/usb/mt8173-xhci.txt        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mt8173-xhci.txt

diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
new file mode 100644
index 0000000..94cec94
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
@@ -0,0 +1,27 @@
+MT65XX xhci
+
+The device node for Mediatek SOC usb3.0 host controller
+
+Required properties:
+ - compatible : supports "mediatek,mt8173-xhci"
+ - reg        : Offset and length of registers
+ - interrupts : Interrupt mode, number and trigger mode
+ - reg-vusb33-supply:  regulator of usb avdd3.3v
+ - reg-vbus-supply : regulator of vbus;
+ - usb-phy : the phy that xhci will bind
+ - usb3-lpm-capable: supports USB3 LPM
+ - clocks     : must support all clocks that xhci needs
+ - clock-names: should be "sys_mac" for sys and mac clocks
+
+Example:
+usb: usb30@11270000 {
+	compatible = "mediatek,mt8173-xhci";
+	reg = <0 0x11270000 0 0x1000>;
+	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+	reg-vusb33-supply = <&mt6397_vusb_reg>;
+	reg-vbus-supply = <&usb_p1_vbus>;
+	usb-phy = <&u3phy>;
+	usb3-lpm-capable;
+	clocks = <&topckgen CLK_TOP_USB30_SEL>;
+	clock-names = "sys_mac";
+};
-- 
1.8.1.1.dirty
