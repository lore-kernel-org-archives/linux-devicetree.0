From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH v2 3/4] ARM: dts: rockchip: add GMAC nodes for RK322x
 SoCs
Date: Wed, 22 Jun 2016 11:16:52 +0800
Message-ID: <1466565413-31027-4-git-send-email-zhengxing@rock-chips.com>
References: <1466565413-31027-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1466565413-31027-1-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, radek.dostal-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, roger.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add the GMAC dt nodes for rk322x SoCs.

Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v2: None

 arch/arm/boot/dts/rk322x.dtsi |   64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index d5626705..a9cbef9 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -415,6 +415,28 @@
 		status = "disabled";
 	};
 
+	gmac: eth@30200000 {
+		compatible = "rockchip,rk3228-gmac";
+		reg = <0x30200000 0x10000>;
+		rockchip,grf = <&grf>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq";
+		clocks = <&cru SCLK_MAC>, <&cru SCLK_MAC_RX>,
+			<&cru SCLK_MAC_TX>, <&cru SCLK_MAC_REF>,
+			<&cru SCLK_MAC_REFOUT>, <&cru ACLK_GMAC>,
+			<&cru PCLK_GMAC>;
+		clock-names = "stmmaceth", "mac_clk_rx",
+			"mac_clk_tx", "clk_mac_ref",
+			"clk_mac_refout", "aclk_mac",
+			"pclk_mac";
+		resets = <&cru SRST_GMAC>;
+		reset-names = "stmmaceth";
+		phy-mode = "rgmii";
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgmii_pins>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@32010000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
@@ -499,6 +521,10 @@
 			bias-disable;
 		};
 
+		pcfg_pull_none_drv_12ma: pcfg-pull-none-drv-12ma {
+			drive-strength = <12>;
+		};
+
 		emmc {
 			emmc_clk: emmc-clk {
 				rockchip,pins = <2 7 RK_FUNC_2 &pcfg_pull_none>;
@@ -520,6 +546,44 @@
 			};
 		};
 
+		gmac {
+			rgmii_pins: rgmii-pins {
+				rockchip,pins = <2 14 RK_FUNC_1 &pcfg_pull_none>,
+						<2 12 RK_FUNC_1 &pcfg_pull_none>,
+						<2 25 RK_FUNC_1 &pcfg_pull_none>,
+						<2 19 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 18 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 22 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 23 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 9 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 13 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 17 RK_FUNC_1 &pcfg_pull_none>,
+						<2 16 RK_FUNC_1 &pcfg_pull_none>,
+						<2 21 RK_FUNC_2 &pcfg_pull_none>,
+						<2 20 RK_FUNC_2 &pcfg_pull_none>,
+						<2 11 RK_FUNC_1 &pcfg_pull_none>,
+						<2 8 RK_FUNC_1 &pcfg_pull_none>;
+			};
+
+			rmii_pins: rmii-pins {
+				rockchip,pins = <2 14 RK_FUNC_1 &pcfg_pull_none>,
+						<2 12 RK_FUNC_1 &pcfg_pull_none>,
+						<2 25 RK_FUNC_1 &pcfg_pull_none>,
+						<2 19 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 18 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 13 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 17 RK_FUNC_1 &pcfg_pull_none>,
+						<2 16 RK_FUNC_1 &pcfg_pull_none>,
+						<2 8 RK_FUNC_1 &pcfg_pull_none>,
+						<2 15 RK_FUNC_1 &pcfg_pull_none>;
+			};
+
+			phy_pins: phy-pins {
+				rockchip,pins = <2 14 RK_FUNC_2 &pcfg_pull_none>,
+						<2 8 RK_FUNC_2 &pcfg_pull_none>;
+			};
+		};
+
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
 				rockchip,pins = <0 0 RK_FUNC_1 &pcfg_pull_none>,
-- 
1.7.9.5
