From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/6] ARM: dts: hix5hd2: add gmac node
Date: Wed, 27 Aug 2014 20:38:29 +0800
Message-ID: <1409143114-23311-2-git-send-email-zhangfei.gao@linaro.org>
References: <1409143114-23311-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409143114-23311-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts |   26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/hisi-x5hd2.dtsi    |   16 ++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/hisi-x5hd2-dkb.dts b/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
index 05b44c2..0344de0 100644
--- a/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
+++ b/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
@@ -51,3 +51,29 @@
 &uart0 {
 	status = "okay";
 };
+
+&gmac0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	phy-handle = <&phy2>;
+	phy-mode = "mii";
+	mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	phy2: ethernet-phy@2 {
+		reg = <2>;
+	};
+};
+
+&gmac1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii";
+	mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index f85ba29..012525c 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -166,5 +166,21 @@
 				#clock-cells = <1>;
 			};
 		};
+
+		gmac0: ethernet@1840000 {
+			compatible = "hisilicon,hix5hd2-gmac";
+			reg = <0x1840000 0x1000>,<0x184300c 0x4>;
+			interrupts = <0 71 4>;
+			clocks = <&clock HIX5HD2_MAC0_CLK>;
+			status = "disabled";
+		};
+
+		gmac1: ethernet@1841000 {
+			compatible = "hisilicon,hix5hd2-gmac";
+			reg = <0x1841000 0x1000>,<0x1843010 0x4>;
+			interrupts = <0 72 4>;
+			clocks = <&clock HIX5HD2_MAC1_CLK>;
+			status = "disabled";
+		};
 	};
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
