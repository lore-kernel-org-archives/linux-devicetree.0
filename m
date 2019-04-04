Return-Path: <SRS0=qFGJ=SG=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/8] ARM: tegra: venice2: Move PLL power supplies to XUSB pad controller
Date: Thu,  4 Apr 2019 13:25:08 +0200
Message-Id: <20190404112511.28118-5-thierry.reding@gmail.com>
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
 arch/arm/boot/dts/tegra124-venice2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 4882b61fb680..5d5e6e18bc7b 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -921,6 +921,11 @@
 	};
 
 	padctl@7009f000 {
+		avdd-pll-utmip-supply = <&vddio_1v8>;
+		avdd-pll-erefe-supply = <&avdd_1v05_run>;
+		avdd-pex-pll-supply = <&vdd_1v05_run>;
+		hvdd-pex-pll-e-supply = <&vdd_3v3_lp0>;
+
 		pads {
 			usb2 {
 				status = "okay";
-- 
2.21.0
