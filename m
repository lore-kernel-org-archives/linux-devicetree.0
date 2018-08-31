From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] ARM: dts: pxa: fix power i2c base address
Date: Fri, 31 Aug 2018 14:03:09 +0200
Message-ID: <20180831120309.8723-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Marcel Ziswiler <marcel@ziswiler.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There is one too many zeroes in the Power I2C base address. Fix this.

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>

---

 arch/arm/boot/dts/pxa27x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 747f750f675d..837343370761 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -71,7 +71,7 @@
 			clocks = <&clks CLK_PWM1>;
 		};
 
-		pwri2c: i2c@40f000180 {
+		pwri2c: i2c@40f00180 {
 			compatible = "mrvl,pxa-i2c";
 			reg = <0x40f00180 0x24>;
 			interrupts = <6>;
-- 
2.14.4
