From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH v2] arm64: dts: rockchip: add u2phy clock for ehci and ohci of rk3399
Date: Wed, 21 Dec 2016 18:41:05 +0800
Message-ID: <1482316865-2769-1-git-send-email-zhengxing@rock-chips.com>
References: <1482316182-2305-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482316182-2305-1-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

We found that the suspend process was blocked when it run into
ehci/ohci module due to clk-480m of usb2-phy was disabled.

The root cause is that usb2-phy suspended earlier than ehci/ohci
(usb2-phy will be auto suspended if no devices plug-in). and the
clk-480m provided by it was disabled if no module used. However,
some suspend process related ehci/ohci are base on this clock,
so we should refer it into ehci/ohci driver to prevent this case.

The u2phy clock flow like this:
===
      u2phy ________________
           |                |    |-----> UTMI_CLK ---------> | EHCI |
OSC_24M ---|---> PHY_PLL----|----|
           |________^_______|    |-----> 480M_CLK ---|G|---> | USBPHY_480M_SRC| ----> USBPHY_480M for SoC
                    |
                    |
                   GRF
===

Signed-off-by: William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v2:
- update the commit message
- remove patches whic add and export the USBPHYx_480M_SRC clock IDs

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index b65c193..2ad9255 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -315,8 +315,10 @@
 		compatible = "generic-ehci";
 		reg = <0x0 0xfe380000 0x0 0x20000>;
 		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
-		clock-names = "hclk_host0", "hclk_host0_arb";
+		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
+			 <&u2phy0>;
+		clock-names = "usbhost", "arbiter",
+			      "utmi";
 		phys = <&u2phy0_host>;
 		phy-names = "usb";
 		status = "disabled";
@@ -326,8 +328,12 @@
 		compatible = "generic-ohci";
 		reg = <0x0 0xfe3a0000 0x0 0x20000>;
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
-		clock-names = "hclk_host0", "hclk_host0_arb";
+		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
+			 <&u2phy0>;
+		clock-names = "usbhost", "arbiter",
+			      "utmi";
+		phys = <&u2phy0_host>;
+		phy-names = "usb";
 		status = "disabled";
 	};
 
@@ -335,8 +341,10 @@
 		compatible = "generic-ehci";
 		reg = <0x0 0xfe3c0000 0x0 0x20000>;
 		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>;
-		clock-names = "hclk_host1", "hclk_host1_arb";
+		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
+			 <&u2phy1>;
+		clock-names = "usbhost", "arbiter",
+			      "utmi";
 		phys = <&u2phy1_host>;
 		phy-names = "usb";
 		status = "disabled";
@@ -346,8 +354,12 @@
 		compatible = "generic-ohci";
 		reg = <0x0 0xfe3e0000 0x0 0x20000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>;
-		clock-names = "hclk_host1", "hclk_host1_arb";
+		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
+			 <&u2phy1>;
+		clock-names = "usbhost", "arbiter",
+			      "utmi";
+		phys = <&u2phy1_host>;
+		phy-names = "usb";
 		status = "disabled";
 	};
 
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
