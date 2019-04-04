Return-Path: <SRS0=qFGJ=SG=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/8] ARM: tegra: apalis: Move PLL power supplies to XUSB pad controller
Date: Thu,  4 Apr 2019 13:25:05 +0200
Message-Id: <20190404112511.28118-2-thierry.reding@gmail.com>
In-Reply-To: <20190404112511.28118-1-thierry.reding@gmail.com>
References: <20190404112511.28118-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

The XUSB pad controller is responsible for supplying power to the PLLs
used to drive the various USB, PCI and SATA pads. Move the PLL power
supplies from the PCIe and XUSB controllers to the XUSB pad controller
to make sure they are available when needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 7 +++++++
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 367eb8c86098..691dd0f628e5 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -17,6 +17,7 @@
 
 	pcie@1003000 {
 		status = "okay";
+
 		avddio-pex-supply = <&reg_1v05_vdd>;
 		avdd-pex-pll-supply = <&reg_1v05_vdd>;
 		avdd-pll-erefe-supply = <&reg_1v05_avdd>;
@@ -1796,6 +1797,7 @@
 		       <&{/padctl@7009f000/pads/usb2/lanes/usb2-2}>,
 		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>;
 		phy-names = "usb2-0", "usb3-1", "usb2-1", "usb2-2", "usb3-0";
+
 		avddio-pex-supply = <&reg_1v05_vdd>;
 		avdd-pll-erefe-supply = <&reg_1v05_avdd>;
 		avdd-pll-utmip-supply = <&reg_1v8_vddio>;
@@ -1807,6 +1809,11 @@
 	};
 
 	padctl@7009f000 {
+		avdd-pll-utmip-supply = <&reg_1v8_vddio>;
+		avdd-pll-erefe-supply = <&reg_1v05_avdd>;
+		avdd-pex-pll-supply = <&reg_1v05_vdd>;
+		hvdd-pex-pll-e-supply = <&reg_module_3v3>;
+
 		pads {
 			usb2 {
 				status = "okay";
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 13c93cd507d8..1da6fe1925a3 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1837,6 +1837,11 @@
 	};
 
 	padctl@7009f000 {
+		avdd-pll-utmip-supply = <&reg_1v8_vddio>;
+		avdd-pll-erefe-supply = <&reg_1v05_avdd>;
+		avdd-pex-pll-supply = <&reg_1v05_vdd>;
+		hvdd-pex-pll-e-supply = <&reg_module_3v3>;
+
 		pads {
 			usb2 {
 				status = "okay";
-- 
2.21.0
