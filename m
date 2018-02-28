From: Baolin Wang <baolin.wang@linaro.org>
Subject: [RESEND PATCH 5/7] arm64: dts: Add watchdog device node for Spreadtrum SC9860
Date: Wed, 28 Feb 2018 18:47:08 +0800
Message-ID: <acb44a00b26bb65fa358608170e440833994c8ab.1519814593.git.baolin.wang@linaro.org>
References: <5ec790b43c6fea9f36e06b5b20233b2adebd7d50.1519814593.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5ec790b43c6fea9f36e06b5b20233b2adebd7d50.1519814593.git.baolin.wang@linaro.org>
In-Reply-To: <5ec790b43c6fea9f36e06b5b20233b2adebd7d50.1519814593.git.baolin.wang@linaro.org>
References: <5ec790b43c6fea9f36e06b5b20233b2adebd7d50.1519814593.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: chunyan.zhang@linaro.org, orson.zhai@spreadtrum.com, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Add the watchdog device node for Spreadtrum SC9860 platform to
watch the system's stability.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/whale2.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index 3dc6389..f2cdf4d 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -141,6 +141,15 @@
 				compatible = "sprd,sc9860-pinctrl";
 				reg = <0 0x402a0000 0 0x10000>;
 			};
+
+			watchdog@40310000 {
+				compatible = "sprd,sp9860-wdt";
+				reg = <0 0x40310000 0 0x1000>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				timeout-sec = <12>;
+				clock-names = "enable";
+				clocks = <&aon_gate CLK_APCPU_WDG_EB>;
+			};
 		};
 	};
 
-- 
1.7.9.5
