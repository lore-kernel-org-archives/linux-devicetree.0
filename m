From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] arm64: dts: hisilicon: hi3670: Add MMC controller support
Date: Thu, 28 Feb 2019 21:15:10 +0530
Message-ID: <20190228154511.17566-3-manivannan.sadhasivam@linaro.org>
References: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, amit.kucheria@linaro.org, guodong.xu@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add MMC controller support for HiSilicon HI3670 SoC reusing the HI3660
Designware MMC driver. There are 2 DWMMC controllers present in this SoC:

1. DWMMC1 is used for SD card (SD)
2. DWMMC2 is used for WiFi (SDIO)

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 9864cf59ebd8..080d6ba5ae39 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -671,5 +671,42 @@
 			resets = <&crg_rst 0x84 12>;
 			reset-names = "rst";
 		};
+
+		/* SD */
+		dwmmc1: dwmmc1@ff37f000 {
+			compatible = "hisilicon,hi3670-dw-mshc",
+				     "hisilicon,hi3660-dw-mshc";
+			reg = <0x0 0xff37f000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg_ctrl HI3670_CLK_GATE_SD>,
+				<&crg_ctrl HI3670_HCLK_GATE_SD>;
+			clock-names = "ciu", "biu";
+			clock-frequency = <3200000>;
+			resets = <&crg_rst 0x94 18>;
+			reset-names = "reset";
+			hisilicon,peripheral-syscon = <&sctrl>;
+			card-detect-delay = <200>;
+			status = "disabled";
+		};
+
+		/* SDIO */
+		dwmmc2: dwmmc2@fc183000 {
+			compatible = "hisilicon,hi3670-dw-mshc",
+				     "hisilicon,hi3660-dw-mshc";
+			reg = <0x0 0xfc183000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg_ctrl HI3670_CLK_GATE_SDIO>,
+				<&crg_ctrl HI3670_HCLK_GATE_SDIO>;
+			clock-names = "ciu", "biu";
+			clock-frequency = <3200000>;
+			resets = <&crg_rst 0x94 20>;
+			reset-names = "reset";
+			card-detect-delay = <200>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.17.1
