Return-Path: <SRS0=MLGG=TQ=nvidia.com=nkristam@kernel.org>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 5/8] arm64: tegra: Add xudc node for Tegra210
Date: Thu, 16 May 2019 12:09:29 +0530
Message-ID: <1557988772-15406-6-git-send-email-nkristam@nvidia.com>
In-Reply-To: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Tegra210 has one XUSB device mode controller, which can be operated
HS and SS modes. Add DT support for XUSB device mode controller.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index a550c0a..edef00b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1184,6 +1184,25 @@
 		status = "disabled";
 	};
 
+	xudc@700d0000 {
+		compatible = "nvidia,tegra210-xudc";
+		reg = <0x0 0x700d0000 0x0 0x8000>,
+			<0x0 0x700d8000 0x0 0x1000>,
+			<0x0 0x700d9000 0x0 0x1000>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
+			<&tegra_car TEGRA210_CLK_XUSB_SS>,
+			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
+			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
+			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
+		clock-names = "dev", "ss", "ss_src",
+			      "hs_src", "fs_src";
+		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
+		power-domain-names = "dev", "ss";
+		nvidia,xusb-padctl = <&padctl>;
+		status = "disabled";
+	};
+
 	mipi: mipi@700e3000 {
 		compatible = "nvidia,tegra210-mipi";
 		reg = <0x0 0x700e3000 0x0 0x100>;
-- 
2.7.4
