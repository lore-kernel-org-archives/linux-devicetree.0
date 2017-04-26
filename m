From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 13/30] arm: dts: mt7623: add usb nodes to the mt7623.dtsi
 file
Date: Wed, 26 Apr 2017 17:25:57 +0800
Message-ID: <1493198774-4478-14-git-send-email-sean.wang@mediatek.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>

Add USB nodes to the mt7623.dtsi file.

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi | 77 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 1ea9b18..56da5ba 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -377,12 +377,89 @@
 		status = "disabled";
 	};
 
+	usb1: usb@1a1c0000 {
+		compatible = "mediatek,mt7623-xhci",
+			     "mediatek,mt8173-xhci";
+		reg = <0 0x1a1c0000 0 0x1000>,
+		      <0 0x1a1c4700 0 0x0100>;
+		reg-names = "mac", "ippc";
+		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&hifsys CLK_HIFSYS_USB0PHY>,
+			 <&topckgen CLK_TOP_ETHIF_SEL>;
+		clock-names = "sys_ck", "free_ck";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
+		phys = <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_TYPE_USB3>;
+		status = "disabled";
+	};
+
+	u3phy1: usb-phy@1a1c4000 {
+		compatible = "mediatek,mt7623-u3phy", "mediatek,mt2701-u3phy";
+		reg = <0 0x1a1c4000 0 0x0700>;
+		clocks = <&clk26m>;
+		clock-names = "u3phya_ref";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		u2port0: usb-phy@1a1c4800 {
+			reg = <0 0x1a1c4800 0 0x0100>;
+			#phy-cells = <1>;
+			status = "okay";
+		};
+
+		u3port0: usb-phy@1a1c4900 {
+			reg = <0 0x1a1c4900 0 0x0700>;
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
+	usb2: usb@1a240000 {
+		compatible = "mediatek,mt7623-xhci",
+			     "mediatek,mt8173-xhci";
+		reg = <0 0x1a240000 0 0x1000>,
+		      <0 0x1a244700 0 0x0100>;
+		reg-names = "mac", "ippc";
+		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&hifsys CLK_HIFSYS_USB1PHY>,
+			 <&topckgen CLK_TOP_ETHIF_SEL>;
+		clock-names = "sys_ck", "free_ck";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
+		phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
+		status = "disabled";
+	};
+
+	u3phy2: usb-phy@1a244000 {
+		compatible = "mediatek,mt7623-u3phy", "mediatek,mt2701-u3phy";
+		reg = <0 0x1a244000 0 0x0700>;
+		clocks = <&clk26m>;
+		clock-names = "u3phya_ref";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		u2port1: usb-phy@1a244800 {
+			reg = <0 0x1a244800 0 0x0100>;
+			#phy-cells = <1>;
+			status = "okay";
+		};
+
+		u3port1: usb-phy@1a244900 {
+			reg = <0 0x1a244900 0 0x0700>;
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
 			     "mediatek,mt2701-hifsys",
 			     "syscon";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	ethsys: syscon@1b000000 {
-- 
1.9.1
