Return-Path: <SRS0=qFGJ=SG=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/8] dt-bindings: phy: tegra-xusb: List PLL power supplies
Date: Thu,  4 Apr 2019 13:25:04 +0200
Message-Id: <20190404112511.28118-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

These power supplies provide power for various PLLs that are set up and
driven by the XUSB pad controller. These power supplies were previously
improperly added to the PCIe and XUSB controllers, but depending on the
driver probe order, power to the PLLs will not be supplied soon enough
and cause initialization to fail.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index daedb15f322e..9fb682e47c29 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -42,6 +42,18 @@ Required properties:
 - reset-names: Must include the following entries:
   - "padctl"
 
+For Tegra124:
+- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
+- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
+- avdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3 V.
+
+For Tegra210:
+- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
+- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
+- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
+
 For Tegra186:
 - avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTMI PHY
   power supply. Must supply 1.8 V.
-- 
2.21.0
