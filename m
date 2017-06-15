From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v4 20/20] arm64: dts: hi3660-hikey960: add nodes for WiFi
Date: Thu, 15 Jun 2017 11:04:17 +0800
Message-ID: <20170615030417.14059-21-guodong.xu@linaro.org>
References: <20170615030417.14059-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615030417.14059-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hw.wangxiaoyin@hisilicon.com, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Add nodes for WiFi. HiKey960 is using TI WL1837MOD module.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index cec0b60..6609b0f 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -145,6 +145,20 @@
 			};
 		};
 	};
+
+	wlan_en: wlan-en-1-8v {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		/* GPIO_051_WIFI_EN */
+		gpio = <&gpio6 3 0>;
+
+		/* WLAN card specific delay */
+		startup-delay-us = <70000>;
+		enable-active-high;
+	};
 };
 
 &i2c0 {
@@ -208,3 +222,22 @@
 	vqmmc-supply = <&ldo9>;
 	status = "okay";
 };
+
+&dwmmc2 { /* WIFI */
+	broken-cd;
+	/* WL_EN */
+	vmmc-supply = <&wlan_en>;
+	ti,non-removable;
+	non-removable;
+	#address-cells = <0x1>;
+	#size-cells = <0x0>;
+	status = "ok";
+
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1837";
+		reg = <2>;      /* sdio func num */
+		/* WL_IRQ, GPIO_179_WL_WAKEUP_AP */
+		interrupt-parent = <&gpio22>;
+		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+	};
+};
-- 
2.10.2
