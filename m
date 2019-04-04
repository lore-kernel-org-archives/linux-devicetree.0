Return-Path: <SRS0=dKdi=SG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33696 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfDDLZU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Apr 2019 07:25:20 -0400
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/8] ARM: tegra: nyan: Move PLL power supplies to XUSB pad controller
Date: Thu,  4 Apr 2019 13:25:07 +0200
Message-Id: <20190404112511.28118-4-thierry.reding@gmail.com>
In-Reply-To: <20190404112511.28118-1-thierry.reding@gmail.com>
References: <20190404112511.28118-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

The XUSB pad controller is responsible for supplying power to the PLLs
used to drive the various USB, PCI and SATA pads. Move the PLL power
supplies from the XUSB controller to the XUSB pad controller to make
sure they are available when needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index a1acd872bcf2..3b10f475037f 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -414,6 +414,11 @@
 	padctl@7009f000 {
 		status = "okay";
 
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
