From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/9] arm64: dts: rockchip: support dwc3 USB for rk3399
Date: Thu,  1 Dec 2016 18:27:28 -0800
Message-ID: <1480645653-36943-5-git-send-email-briannorris@chromium.org>
References: <1480645653-36943-1-git-send-email-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1480645653-36943-1-git-send-email-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the dwc3 usb needed node information for rk3399.

Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Somewhat rewritten from Caesar's reposting (v2) of my patch.

Changes:
 * Include USB2 PHY (which is now in -next)
 * Don't include USB3 PHY, as extcon support is not ready yet
 * Drop non-upstream properties
 * Fixup whitespace a bit
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 4ca8f9a7601c..1e97fb8c6415 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -316,6 +316,66 @@
 		};
 	};
 
+	usbdrd3_0: usb@fe800000 {
+		compatible = "rockchip,rk3399-dwc3";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		clocks = <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
+			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
+			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
+		clock-names = "clk_usb3otg0_ref", "clk_usb3otg0_suspend",
+			      "aclk_usb3otg0", "aclk_usb3_rksoc_axi_perf",
+			      "aclk_usb3", "aclk_usb3_grf";
+		resets = <&cru SRST_A_USB3_OTG0>;
+		reset-names = "usb3-otg";
+		status = "disabled";
+
+		usbdrd_dwc3_0: dwc3 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0xfe800000 0x0 0x100000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH 0>;
+			dr_mode = "otg";
+			phys = <&u2phy0_otg>;
+			phy-names = "usb2-phy";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			status = "disabled";
+		};
+	};
+
+	usbdrd3_1: usb@fe900000 {
+		compatible = "rockchip,rk3399-dwc3";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		clocks = <&cru SCLK_USB3OTG1_REF>, <&cru SCLK_USB3OTG1_SUSPEND>,
+			 <&cru ACLK_USB3OTG1>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
+			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
+		clock-names = "clk_usb3otg1_ref", "clk_usb3otg1_suspend",
+			      "aclk_usb3otg1", "aclk_usb3_rksoc_axi_perf",
+			      "aclk_usb3", "aclk_usb3_grf";
+		resets = <&cru SRST_A_USB3_OTG1>;
+		reset-names = "usb3-otg";
+		status = "disabled";
+
+		usbdrd_dwc3_1: dwc3 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0xfe900000 0x0 0x100000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+			dr_mode = "otg";
+			phys = <&u2phy1_otg>;
+			phy-names = "usb2-phy";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			status = "disabled";
+		};
+	};
+
 	usb_host0_ehci: usb@fe380000 {
 		compatible = "generic-ehci";
 		reg = <0x0 0xfe380000 0x0 0x20000>;
-- 
2.8.0.rc3.226.g39d4020
