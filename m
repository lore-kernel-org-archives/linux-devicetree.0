From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 5/9] arm64: dts: actions: Add Reset Controller support for S700 SoC
Date: Fri, 10 Aug 2018 15:21:09 +0530
Message-ID: <20180810095113.25292-6-manivannan.sadhasivam@linaro.org>
References: <20180810095113.25292-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180810095113.25292-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org, afaerber@suse.de, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add reset controller property and bindings header for the
Actions Semi S700 SoC DTS.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 59d29e4ca404..30c4c6ea89ea 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/actions,s700-cmu.h>
+#include <dt-bindings/reset/actions,s700-reset.h>
 
 / {
 	compatible = "actions,s700";
@@ -165,6 +166,7 @@
 			reg = <0x0 0xe0168000 0x0 0x1000>;
 			clocks = <&hosc>, <&losc>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		sps: power-controller@e01b0100 {
-- 
2.17.1
