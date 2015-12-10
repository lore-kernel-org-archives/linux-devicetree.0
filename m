From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 3/3] arm: dts: rockchip: move the public part to rk3288-evb
 common
Date: Thu, 10 Dec 2015 13:46:39 +0800
Message-ID: <1449726399-12507-3-git-send-email-zyw@rock-chips.com>
References: <1449726399-12507-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1449726399-12507-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rk3288-evb-act8846 and rk3288-evb-rk808 are the power boards of
rk3288-evb, they provide the same power supply interface to the
motherboard. Sort out them, put the public part to rk3288-evb.dtsi,
such as gmac and cpu-supply, leaving only the power section.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

 arch/arm/boot/dts/rk3288-evb-act8846.dts |  4 ----
 arch/arm/boot/dts/rk3288-evb-rk808.dts   | 27 -----------------------
 arch/arm/boot/dts/rk3288-evb.dtsi        | 37 +++++++++++++++++++++++++++-----
 3 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rk3288-evb-act8846.dts
index 7b768b7..e662147 100644
--- a/arch/arm/boot/dts/rk3288-evb-act8846.dts
+++ b/arch/arm/boot/dts/rk3288-evb-act8846.dts
@@ -65,10 +65,6 @@
 	};
 };
 
-&cpu0 {
-	cpu0-supply = <&vdd_cpu>;
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 
diff --git a/arch/arm/boot/dts/rk3288-evb-rk808.dts b/arch/arm/boot/dts/rk3288-evb-rk808.dts
index 18eb6cb..736b08b 100644
--- a/arch/arm/boot/dts/rk3288-evb-rk808.dts
+++ b/arch/arm/boot/dts/rk3288-evb-rk808.dts
@@ -43,17 +43,6 @@
 
 / {
 	compatible = "rockchip,rk3288-evb-rk808", "rockchip,rk3288";
-
-	ext_gmac: external-gmac-clock {
-		compatible = "fixed-clock";
-		clock-frequency = <125000000>;
-		clock-output-names = "ext_gmac";
-		#clock-cells = <0>;
-	};
-};
-
-&cpu0 {
-	cpu0-supply = <&vdd_cpu>;
 };
 
 &i2c0 {
@@ -244,19 +233,3 @@
 		};
 	};
 };
-
-&gmac {
-	phy-supply = <&vcc_phy>;
-	phy-mode = "rgmii";
-	clock_in_out = "input";
-	snps,reset-gpio = <&gpio4 7 0>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 10000 1000000>;
-	assigned-clocks = <&cru SCLK_MAC>;
-	assigned-clock-parents = <&ext_gmac>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&rgmii_pins>;
-	tx_delay = <0x30>;
-	rx_delay = <0x10>;
-	status = "ok";
-};
diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index f6d2e78..4faabdb 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -89,6 +89,13 @@
 		pwms = <&pwm0 0 1000000 PWM_POLARITY_INVERTED>;
 	};
 
+	ext_gmac: external-gmac-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "ext_gmac";
+		#clock-cells = <0>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
@@ -160,6 +167,10 @@
 	};
 };
 
+&cpu0 {
+	cpu0-supply = <&vdd_cpu>;
+};
+
 &emmc {
 	broken-cd;
 	bus-width = <8>;
@@ -172,11 +183,6 @@
 	status = "okay";
 };
 
-&hdmi {
-	ddc-i2c-bus = <&i2c5>;
-	status = "okay";
-};
-
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
@@ -191,6 +197,27 @@
 	vqmmc-supply = <&vccio_sd>;
 };
 
+&gmac {
+	phy-supply = <&vcc_phy>;
+	phy-mode = "rgmii";
+	clock_in_out = "input";
+	snps,reset-gpio = <&gpio4 7 0>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 1000000>;
+	assigned-clocks = <&cru SCLK_MAC>;
+	assigned-clock-parents = <&ext_gmac>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_pins>;
+	tx_delay = <0x30>;
+	rx_delay = <0x10>;
+	status = "ok";
+};
+
+&hdmi {
+	ddc-i2c-bus = <&i2c5>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 };
-- 
2.6.3
