From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 6/9] ARM: dts: exynos5420: add dt nodes for hdmi subsystem
Date: Thu, 25 Jul 2013 13:04:34 +0530
Message-ID: <1374737677-3215-7-git-send-email-rahul.sharma@samsung.com>
References: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Add hdmi, mixer, ddc device tree nodes for Exynos 5420 SoC.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   20 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi         |    8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 08607df..fcd0f69 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -30,4 +30,24 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	hdmi@14530000 {
+		status = "okay";
+		hpd-gpio = <&gpx3 7 0>;
+	};
+
+	mixer@14450000 {
+		status = "okay";
+	};
+
+	i2c_2: i2c@12C80000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+		status = "okay";
+
+		hdmiddc@50 {
+			compatible = "samsung,exynos4210-hdmiddc";
+			reg = <0x50>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 953f877..93caef7 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -177,4 +177,12 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c3_bus>;
 	};
+
+	hdmi@14530000 {
+		compatible = "samsung,exynos4212-hdmi";
+	};
+
+	mixer@14450000 {
+		compatible = "samsung,exynos5420-mixer";
+	};
 };
-- 
1.7.10.4
