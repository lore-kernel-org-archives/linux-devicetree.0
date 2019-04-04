Return-Path: <SRS0=qFGJ=SG=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 7/8] arm64: tegra: smaug: Move PLL power supplies to XUSB pad controller
Date: Thu,  4 Apr 2019 13:25:10 +0200
Message-Id: <20190404112511.28118-7-thierry.reding@gmail.com>
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
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 25fd65b5397a..72c7a04ac1df 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1654,6 +1654,11 @@
 	padctl@7009f000 {
 		status = "okay";
 
+		avdd-pll-utmip-supply = <&pp1800>;
+		avdd-pll-uerefe-supply = <&pp1050_avdd>;
+		dvdd-pex-pll-supply = <&avddio_1v05>;
+		hvdd-pex-pll-e-supply = <&pp1800>;
+
 		pads {
 			usb2 {
 				status = "okay";
-- 
2.21.0
