From: tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org
Subject: [PATCH 7/8] ARM: dts: imx7s: add usb hsic phy domain
Date: Thu, 30 Nov 2017 12:14:33 -0800
Message-ID: <20171130201434.14122-8-tyler@opensourcefoundries.com>
References: <20171130201434.14122-1-tyler@opensourcefoundries.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171130201434.14122-1-tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>

The GPCv2 driver should control the MIPI, PCIe,
and USB HSIC PHY regulators. Add the USB HSIC
power domain to the GPC node.

Signed-off-by: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
