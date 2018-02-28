From: Baolin Wang <baolin.wang@linaro.org>
Subject: [RESEND PATCH 3/7] arm64: dts: Add pin controller node for Spreadtrum SC9860
Date: Wed, 28 Feb 2018 18:47:06 +0800
Message-ID: <378c75289917a9686814f2870752f953977f564c.1519814593.git.baolin.wang@linaro.org>
References: <5ec790b43c6fea9f36e06b5b20233b2adebd7d50.1519814593.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5ec790b43c6fea9f36e06b5b20233b2adebd7d50.1519814593.git.baolin.wang@linaro.org>
In-Reply-To: <5ec790b43c6fea9f36e06b5b20233b2adebd7d50.1519814593.git.baolin.wang@linaro.org>
References: <5ec790b43c6fea9f36e06b5b20233b2adebd7d50.1519814593.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: chunyan.zhang@linaro.org, orson.zhai@spreadtrum.com, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds the pin controller device node for Spreadtrum
SC9860 platform.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/whale2.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index 63fe89e..23cedbd 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -129,6 +129,11 @@
 				clock-names = "enable";
 				clocks = <&aon_gate CLK_SPLK_EB>;
 			};
+
+			pin_controller: pinctrl@402a0000 {
+				compatible = "sprd,sc9860-pinctrl";
+				reg = <0 0x402a0000 0 0x10000>;
+			};
 		};
 	};
 
-- 
1.7.9.5
