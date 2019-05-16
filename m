Return-Path: <SRS0=LvYT=TQ=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
Date: Thu, 16 May 2019 14:36:57 +0530
Message-ID: <20190516090657.25211-2-j-keerthy@ti.com>
In-Reply-To: <20190516090657.25211-1-j-keerthy@ti.com>
References: <20190516090657.25211-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

rtc is fused out on dra76 and accessing target module
register is causing a boot crash hence disable it.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi  | 2 +-
 arch/arm/boot/dts/dra76-evm.dts | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index fe9f0bc29fec..3b4cba9da91f 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3543,7 +3543,7 @@
 			};
 		};
 
-		target-module@38000 {			/* 0x48838000, ap 29 12.0 */
+		rtctarget: target-module@38000 {			/* 0x48838000, ap 29 12.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
 			ti,hwmods = "rtcss";
 			reg = <0x38074 0x4>,
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 6607fbe3c67c..644fe1961d28 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -363,6 +363,10 @@
 	pinctrl-3 = <&mmc4_pins_hs &mmc4_iodelay_manual1_conf>;
 };
 
+&rtctarget {
+	status = "disabled";
+};
+
 /* No RTC on this device */
 &rtc {
 	status = "disabled";
-- 
2.17.1
