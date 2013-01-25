From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/4] ARM: dts: add support for hdmi-ddc to exynos4412-origen
Date: Fri, 25 Jan 2013 05:39:43 -0500
Message-ID: <1359110384-28402-4-git-send-email-rahul.sharma@samsung.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi          |  1 -
 arch/arm/boot/dts/exynos4412-origen.dts | 13 +++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 arch/arm/boot/dts/exynos4412.dtsi

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 07cb7d4..a75e2f5 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -219,7 +219,6 @@
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138C0000 0x100>;
 		interrupts = <0 64 0>;
-		status = "disabled";
 	};
 
 	i2c_7: i2c@138D0000 {
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 4eba374..6299f1b 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -59,4 +59,17 @@
 	serial@13830000 {
 		status = "okay";
 	};
+
+	i2c_6: i2c@138C0000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+
+		pinctrl-0 = <&i2c6_bus>;
+		pinctrl-names = "default";
+
+		hdmiddc@50 {
+			compatible = "samsung,exynos4-hdmiddc";
+			reg = <0x50>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
old mode 100644
new mode 100755
-- 
1.8.0
