From: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/2] arm: dts: mt2701: add nor flash node
Date: Wed, 25 Jan 2017 11:38:35 +0800
Message-ID: <1485315515-29942-3-git-send-email-guochun.mao@mediatek.com>
References: <1485315515-29942-1-git-send-email-guochun.mao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485315515-29942-1-git-send-email-guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Mediatek nor flash node.

Signed-off-by: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt2701-evb.dts |   25 +++++++++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi    |   12 ++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701-evb.dts b/arch/arm/boot/dts/mt2701-evb.dts
index 082ca88..85e5ae8 100644
--- a/arch/arm/boot/dts/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mt2701-evb.dts
@@ -24,6 +24,31 @@
 	};
 };
 
+&nor_flash {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nor_pins_default>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
+&pio {
+	nor_pins_default: nor {
+		pins1 {
+			pinmux = <MT2701_PIN_240_EXT_XCS__FUNC_EXT_XCS>,
+				 <MT2701_PIN_241_EXT_SCK__FUNC_EXT_SCK>,
+				 <MT2701_PIN_239_EXT_SDIO0__FUNC_EXT_SDIO0>,
+				 <MT2701_PIN_238_EXT_SDIO1__FUNC_EXT_SDIO1>,
+				 <MT2701_PIN_237_EXT_SDIO2__FUNC_EXT_SDIO2>,
+				 <MT2701_PIN_236_EXT_SDIO3__FUNC_EXT_SDIO3>;
+			drive-strength = <MTK_DRIVE_4mA>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index bdf8954..1eefce4 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -227,6 +227,18 @@
 		status = "disabled";
 	};
 
+	nor_flash: spi@11014000 {
+		compatible = "mediatek,mt2701-nor",
+			     "mediatek,mt8173-nor";
+		reg = <0 0x11014000 0 0xe0>;
+		clocks = <&pericfg CLK_PERI_FLASH>,
+			 <&topckgen CLK_TOP_FLASH_SEL>;
+		clock-names = "spi", "sf";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	mmsys: syscon@14000000 {
 		compatible = "mediatek,mt2701-mmsys", "syscon";
 		reg = <0 0x14000000 0 0x1000>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
