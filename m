From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH v3 2/2] ARM: Dove: Add the audio device to the Cubox DT
Date: Tue, 8 Oct 2013 20:56:17 +0200
Message-ID: <20131008205617.079142b6@armhf>
References: <20131008194232.7d74b9e6@armhf>
	<525448DE.5030004@gmail.com>
	<20131008181647.GW5402@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008181647.GW5402-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch activates the audio device of the Cubox.

The audio flow (pin mpp_audio1) is output on both I2S and S/PDIF.

The third si5351 clock (#2, pin mpp13) is used as the external clock.

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
Jason,

this patch replaces the previous patch v2 2/2

v3:
- move the pins declaration to dove.dtsi (Sebastian Hesselbarth)
---
 arch/arm/boot/dts/dove.dtsi      | 10 ++++++++++
 arch/arm/boot/dts/dove-cubox.dts |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index e177e66..772b15e 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -227,6 +227,11 @@
 				marvell,function =3D "gpio";
 			};
=20
+			pmx_audio1_extclk: pmx-audio1-extclk {
+				marvell,pins =3D "mpp13";
+				marvell,function =3D "audio1";
+			};
+
 			pmx_gpio_14: pmx-gpio-14 {
 				marvell,pins =3D "mpp14";
 				marvell,function =3D "gpio";
@@ -302,6 +307,11 @@
 				marvell,function =3D "gpio";
 			};
=20
+			pmx_audio1_i2s1_spdifo: pmx-audio1-i2s1-spdifo {
+				marvell,pins =3D "mpp_audio1";
+				marvell,function =3D "i2s1/spdifo";
+			};
+
 			pmx_spi0: pmx-spi0 {
 				marvell,pins =3D "mpp_spi0";
 				marvell,function =3D "spi0";
diff --git a/arch/arm/boot/dts/dove-cubox.dts b/arch/arm/boot/dts/dove-=
cubox.dts
index 022646e..78b0057 100644
--- a/arch/arm/boot/dts/dove-cubox.dts
+++ b/arch/arm/boot/dts/dove-cubox.dts
@@ -132,3 +132,11 @@
 		reg =3D <0>;
 	};
 };
+
+&audio1 {
+	status =3D "okay";
+	clocks =3D <&gate_clk 13>, <&si5351 2>;
+	clock-names =3D "internal", "extclk";
+	pinctrl-0 =3D <&pmx_audio1_i2s1_spdifo &pmx_audio1_extclk>;
+	pinctrl-names =3D "default";
+};

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
