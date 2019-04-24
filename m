From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/5] arm64: dts: bitmain: Add pinctrl support for BM1880 SoC
Date: Wed, 24 Apr 2019 17:32:21 +0530
Message-ID: <20190424120224.22660-3-manivannan.sadhasivam@linaro.org>
References: <20190424120224.22660-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424120224.22660-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl support for Bitmain BM1880 SoC. This SoC only supports
pinmuxing and the pinctrl registers are part of the sctrl block.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index 55a4769e0de2..fdfdc65d29ef 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -80,6 +80,20 @@
 			#interrupt-cells = <3>;
 		};
 
+		sctrl: system-controller@50010000 {
+			compatible = "bitmain,bm1880-sctrl", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x50010000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0x50010000 0x1000>;
+
+			pinctrl: pinctrl@50 {
+				compatible = "bitmain,bm1880-pinctrl";
+				reg = <0x50 0x4B0>;
+			};
+		};
+
 		uart0: serial@58018000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x58018000 0x0 0x2000>;
-- 
2.17.1
