From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 4/8] ARM: DT: STi: STiH407: Add DT node for MiPHY28lp
Date: Wed,  3 Sep 2014 17:37:13 +0200
Message-ID: <1409758637-28654-5-git-send-email-gabriel.fernandez@linaro.org>
References: <1409758637-28654-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409758637-28654-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The MiPHY28lp is a Generic PHY which can serve various SATA, PCIe or
USB3 devices. The two first ports can be use for either; both SATA, both
PCIe or one of each in any configuration.
The Third port is only for USB3.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-b2120.dts | 11 +++++++
 arch/arm/boot/dts/stih407.dtsi      | 65 +++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-b2120.dts b/arch/arm/boot/dts/stih407-b2120.dts
index fe69f92..d0837fb 100644
--- a/arch/arm/boot/dts/stih407-b2120.dts
+++ b/arch/arm/boot/dts/stih407-b2120.dts
@@ -74,5 +74,16 @@
 			st,i2c-min-scl-pulse-width-us = <0>;
 			st,i2c-min-sda-pulse-width-us = <5>;
 		};
+
+		miphy28lp_phy: miphy28lp@9b22000 {
+
+			phy_port0: port@9b22000 {
+				st,osc-rdy;
+			};
+
+			phy_port1: port@9b2a000 {
+				st,osc-force-ext;
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/stih407.dtsi b/arch/arm/boot/dts/stih407.dtsi
index 4f9024f..b8cc9a3 100644
--- a/arch/arm/boot/dts/stih407.dtsi
+++ b/arch/arm/boot/dts/stih407.dtsi
@@ -259,5 +259,70 @@
 
 			status = "disabled";
 		};
+
+		miphy28lp_phy: miphy28lp@9b22000 {
+			compatible = "st,miphy28lp-phy";
+			st,syscfg = <&syscfg_core>;
+			#address-cells	= <1>;
+			#size-cells	= <1>;
+			ranges;
+
+			phy_port0: port@9b22000 {
+				reg = <0x9b22000 0xff>,
+				      <0x9b09000 0xff>,
+				      <0x9b04000 0xff>,
+				      <0x114 0x4>, /* sysctrl MiPHY cntrl */
+				      <0x818 0x4>, /* sysctrl MiPHY status*/
+				      <0xe0  0x4>, /* sysctrl PCIe */
+				      <0xec  0x4>; /* sysctrl SATA */
+				reg-names = "sata-up",
+					    "pcie-up",
+					    "pipew",
+					    "miphy-ctrl-glue",
+					    "miphy-status-glue",
+					    "pcie-glue",
+					    "sata-glue";
+				#phy-cells = <1>;
+
+				reset-names = "miphy-sw-rst";
+				resets = <&softreset STIH407_MIPHY0_SOFTRESET>;
+			};
+
+			phy_port1: port@9b2a000 {
+				reg = <0x9b2a000 0xff>,
+				      <0x9b19000 0xff>,
+				      <0x9b14000 0xff>,
+				      <0x118 0x4>,
+				      <0x81c 0x4>,
+				      <0xe4  0x4>,
+				      <0xf0  0x4>;
+				reg-names = "sata-up",
+					    "pcie-up",
+					    "pipew",
+					    "miphy-ctrl-glue",
+					    "miphy-status-glue",
+					    "pcie-glue",
+					    "sata-glue";
+				#phy-cells = <1>;
+
+				reset-names = "miphy-sw-rst";
+				resets = <&softreset STIH407_MIPHY1_SOFTRESET>;
+			};
+
+			phy_port2: port@8f95000 {
+				reg = <0x8f95000 0xff>,
+				      <0x8f90000 0xff>,
+				      <0x11c 0x4>,
+				      <0x820 0x4>;
+				reg-names = "pipew",
+				    "usb3-up",
+				    "miphy-ctrl-glue",
+				    "miphy-status-glue";
+				#phy-cells = <1>;
+
+				reset-names = "miphy-sw-rst";
+				resets = <&softreset STIH407_MIPHY2_SOFTRESET>;
+			};
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
