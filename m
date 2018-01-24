From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] ARM: dts: use 'atmel' as at24 manufacturer for qcom-apq8064-cm-qs600
Date: Wed, 24 Jan 2018 22:30:30 +0100
Message-ID: <20180124213030.4316-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: devicetree@vger.kernel.org

Using compatible strings without the <manufacturer> part for at24 is
now deprecated. Use a correct 'atmel,<model>' value.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index b818ebce0978..209eb21cea00 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -133,7 +133,7 @@
 				clock-frequency = <200000>;
 
 				eeprom@50 {
-					compatible = "24c02";
+					compatible = "atmel,24c02";
 					reg = <0x50>;
 					pagesize = <32>;
 				};
-- 
2.16.1
