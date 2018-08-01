From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 07/10] arm64: dts: actions: Add RMU node for Actions Semi S700 SoC
Date: Wed,  1 Aug 2018 09:09:12 +0530
Message-ID: <20180801033915.15880-8-manivannan.sadhasivam@linaro.org>
References: <20180801033915.15880-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801033915.15880-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org, afaerber@suse.de, robh+dt@kernel.org, lee.jones@linaro.org, arnd@arndb.de
Cc: linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add Reset Controller Unit (RMU) node under the system-controller node
for Actions Semi S700 SoC. Also add the bindings constant header to
be used by clients.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index a57f54587164..8498579504c7 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/actions,s700-cmu.h>
+#include <dt-bindings/reset/actions,s700-rmu.h>
 
 / {
 	compatible = "actions,s700";
@@ -169,6 +170,11 @@
 				clocks = <&hosc>, <&losc>;
 				#clock-cells = <1>;
 			};
+
+			rmu: reset-controller {
+				compatible = "actions,s700-rmu";
+				#reset-cells = <1>;
+			};
 		};
 
 		sps: power-controller@e01b0100 {
-- 
2.17.1
