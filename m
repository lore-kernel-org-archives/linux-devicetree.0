From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] ARM: dts: rockchip: make more compatible for rk3036 SoCs
Date: Thu, 14 Jan 2016 09:08:41 +0800
Message-ID: <1452733721-28110-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch will be better to support and compatible for rk3036.
Although some other SoCs drivers also can work for rk3036, that will
prevent some mutatin factors for drivers.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/rk3036.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index ee457a2..7897449 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -161,7 +161,7 @@
 	};
 
 	usb_otg: usb@10180000 {
-		compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
+		compatible = "rockchip,rk3036-usb", "rockchip,rk3066-usb",
 				"snps,dwc2";
 		reg = <0x10180000 0x40000>;
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -176,7 +176,7 @@
 	};
 
 	usb_host: usb@101c0000 {
-		compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
+		compatible = "rockchip,rk3036-usb", "rockchip,rk3066-usb",
 				"snps,dwc2";
 		reg = <0x101c0000 0x40000>;
 		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
@@ -211,7 +211,7 @@
 	};
 
 	emmc: dwmmc@1021c000 {
-		compatible = "rockchip,rk3288-dw-mshc";
+		compatible = "rockchip,rk3036-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x1021c000 0x4000>;
 		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 		broken-cd;
@@ -327,7 +327,7 @@
 	};
 
 	i2c1: i2c@20056000 {
-		compatible = "rockchip,rk3288-i2c";
+		compatible = "rockchip,rk3036-i2c", "rockchip,rk3288-i2c";
 		reg = <0x20056000 0x1000>;
 		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -340,7 +340,7 @@
 	};
 
 	i2c2: i2c@2005a000 {
-		compatible = "rockchip,rk3288-i2c";
+		compatible = "rockchip,rk3036-i2c", "rockchip,rk3288-i2c";
 		reg = <0x2005a000 0x1000>;
 		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -395,7 +395,7 @@
 	};
 
 	i2c0: i2c@20072000 {
-		compatible = "rockchip,rk3288-i2c";
+		compatible = "rockchip,rk3036-i2c", "rockchip,rk3288-i2c";
 		reg = <0x20072000 0x1000>;
 		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
-- 
1.9.1
