From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 4/5] arm64: dts: rockchip: add pd_usb3 power-domain node for rk3399.
Date: Fri, 15 Dec 2017 12:00:04 +0100
Message-ID: <20171215110005.7564-4-enric.balletbo@collabora.com>
References: <20171215110005.7564-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215110005.7564-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: dianders@google.com, groeck@chromium.org, briannorris@google.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the usb3 power-domain, its qos area and assign it to the usb device
node.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Changes since v1:
 - Split the original patch in different commits
Changes since v2:
 - None

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
