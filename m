Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 24/30] arm64: tegra: Add PEX DPD states as pinctrl properties
Date: Thu, 11 Apr 2019 22:33:49 +0530
Message-ID: <20190411170355.6882-25-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Add PEX DPD states as pinctrl properties to set in PCIe driver. In Tegra210
BIAS pads are not in power down mode when clamps are applied. So to set the
pads in DPD, pass the PEX DPD states as pinctrl properties to PCIe driver.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index a550c0a4d572..876e32e6d577 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -48,6 +48,11 @@
 			 <&tegra_car 72>,
 			 <&tegra_car 74>;
 		reset-names = "pex", "afi", "pcie_x";
+
+		pinctrl-names = "pex-dpd-disable", "pex-dpd-enable";
+		pinctrl-0 = <&pex_dpd_disable>;
+		pinctrl-1 = <&pex_dpd_enable>;
+
 		status = "disabled";
 
 		pci@1,0 {
@@ -848,6 +853,20 @@
 			pins = "sdmmc3";
 			power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
 		};
+
+		pex_dpd_disable: pex_en {
+			pex-dpd-disable {
+				pins = "pex-bias", "pex-clk1", "pex-clk2";
+				low-power-disable;
+			};
+		};
+
+		pex_dpd_enable: pex_dis {
+			pex-dpd-enable {
+				pins = "pex-bias", "pex-clk1", "pex-clk2";
+				low-power-enable;
+			};
+		};
 	};
 
 	fuse@7000f800 {
-- 
2.17.1
