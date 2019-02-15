From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/2] arm64: dts: hisilicon: hi3670: Add reset controller support
Date: Fri, 15 Feb 2019 11:19:55 +0530
Message-ID: <20190215054955.788-3-manivannan.sadhasivam@linaro.org>
References: <20190215054955.788-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215054955.788-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guodong.xu@linaro.org, john.stultz@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add reset controller support for HiSilicon HI3670 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index a5bd6d80b226..2af88c429c97 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -151,6 +151,12 @@
 			#clock-cells = <1>;
 		};
 
+		crg_rst: crg_rst_controller {
+			compatible = "hisilicon,hi3670-reset", "hisilicon,hi3660-reset";
+			#reset-cells = <2>;
+			hisi,rst-syscon = <&crg_ctrl>;
+		};
+
 		pctrl: pctrl@e8a09000 {
 			compatible = "hisilicon,hi3670-pctrl", "syscon";
 			reg = <0x0 0xe8a09000 0x0 0x1000>;
-- 
2.17.1
