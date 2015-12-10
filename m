From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: sun7i: Olimex A20-SOM-EVB: Enable
 mmc3 (baseboard SD socket)
Date: Thu, 10 Dec 2015 21:32:00 +0100
Message-ID: <1449779521-754-3-git-send-email-merker@debian.org>
References: <1449779521-754-1-git-send-email-merker@debian.org>
Reply-To: merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBAGDU6ZQKGQE73XLCRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449779521-754-1-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Olimex A20-SOM-EVB is an evaluation board for the Olimex
A20-SOM system-on-module. The baseboard provides a full-size SD
socket (connected to mmc3) in addition to the micro-SD socket on
the SOM itself (which is connected to mmc0).

Enable the mmc3 controller in the dts.

Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
index 6562a6bc..6a3d95d 100644
--- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
@@ -176,6 +176,16 @@
 	status = "okay";
 };
 
+&mmc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc3_pins_a>, <&mmc3_cd_pin_olimex_som_evb>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 0 GPIO_ACTIVE_HIGH>; /* PH0 */
+	cd-inverted;
+	status = "okay";
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -198,6 +208,13 @@
 		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
+
+	mmc3_cd_pin_olimex_som_evb: mmc3_cd_pin@0 {
+		allwinner,pins = "PH0";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
 };
 
 &reg_ahci_5v {
-- 
2.1.4
