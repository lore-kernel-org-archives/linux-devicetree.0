From: tyler@opensourcefoundries.com
Subject: [PATCH v1 6/6] ARM: dts: imx7s: add usb hsic phy domain
Date: Tue,  5 Dec 2017 14:27:07 -0800
Message-ID: <20171205222707.11302-7-tyler@opensourcefoundries.com>
References: <20171205222707.11302-1-tyler@opensourcefoundries.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171205222707.11302-1-tyler@opensourcefoundries.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, festevam@gmail.com, kernel@pengutronix.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, fabio.estevam@nxp.com, Tyler Baker <tyler@opensourcefoundries.com>
List-Id: devicetree@vger.kernel.org

From: Tyler Baker <tyler@opensourcefoundries.com>

The GPCv2 driver should control the MIPI, PCIe,
and USB HSIC PHY regulators. Add the USB HSIC
power domain to the GPC node.

Signed-off-by: Tyler Baker <tyler@opensourcefoundries.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 151ab34..9626a3e 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -602,6 +602,12 @@
 						reg = <IMX7_POWER_DOMAIN_PCIE_PHY>;
 						power-supply = <&reg_1p0d>;
 					};
+					pgc_usb_hsic_phy: pgc-usb-hsic-phy-domain {
+						#power-domain-cells = <0>;
+
+						reg = <IMX7_POWER_DOMAIN_USB_HSIC_PHY>;
+						power-supply = <&reg_1p2>;
+					};
 				};
 			};
 		};
-- 
2.9.3
