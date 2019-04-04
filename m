Return-Path: <SRS0=qFGJ=SG=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/8] arm64: tegra: jetson-tx1: Move PLL power supplies to XUSB pad controller
Date: Thu,  4 Apr 2019 13:25:09 +0200
Message-Id: <20190404112511.28118-6-thierry.reding@gmail.com>
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
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 95e890d8a119..a7dc319214a4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1352,6 +1352,11 @@
 	padctl@7009f000 {
 		status = "okay";
 
+		avdd-pll-utmip-supply = <&vdd_1v8>;
+		avdd-pll-uerefe-supply = <&avdd_1v05_pll>;
+		dvdd-pex-pll-supply = <&vdd_pex_1v05>;
+		hvdd-pex-pll-e-supply = <&vdd_1v8>;
+
 		pads {
 			usb2 {
 				status = "okay";
-- 
2.21.0
