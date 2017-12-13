From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2 5/5] arm64: dts: rockchip: add pd_usb3 power-domain node for rk3399
Date: Wed, 13 Dec 2017 11:32:19 +0100
Message-ID: <20171213103219.1464-5-enric.balletbo@collabora.com>
References: <20171213103219.1464-1-enric.balletbo@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171213103219.1464-1-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the usb3 power-domain, its qos area and assign it to the usb device
node.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
Changes since v1:
 - Split the original patch in different commits

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index ea91f25..c18ff88 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -417,6 +417,7 @@
 			snps,dis_u2_susphy_quirk;
 			snps,dis-del-phy-power-chg-quirk;
 			snps,dis-tx-ipgap-linecheck-quirk;
+			power-domains = <&power RK3399_PD_USB3>;
 			status = "disabled";
 		};
 	};
@@ -447,6 +448,7 @@
 			snps,dis_u2_susphy_quirk;
 			snps,dis-del-phy-power-chg-quirk;
 			snps,dis-tx-ipgap-linecheck-quirk;
+			power-domains = <&power RK3399_PD_USB3>;
 			status = "disabled";
 		};
 	};
@@ -995,6 +997,12 @@
 				clocks = <&cru HCLK_SDIO>;
 				pm_qos = <&qos_sdioaudio>;
 			};
+			pd_usb3@RK3399_PD_USB3 {
+				reg = <RK3399_PD_USB3>;
+				clocks = <&cru ACLK_USB3>;
+				pm_qos = <&qos_usb_otg0>,
+					 <&qos_usb_otg1>;
+			};
 			pd_vio@RK3399_PD_VIO {
 				reg = <RK3399_PD_VIO>;
 				#address-cells = <1>;
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
