From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH] ARM: dts: sun8i-h3: Fix wifi in Beelink X2 DT
Date: Thu, 16 May 2019 18:10:39 +0200
Message-ID: <20190516161039.18534-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

mmc1 node where wifi module is connected doesn't have properly defined
power supplies so wifi module is never powered up. Fix that by
specifying additional power supplies.

Additionally, this STB may have either Realtek or Broadcom based wifi
module. One based on Broadcom module also needs external clock to work
properly. Fix that by adding clock property to wifi_pwrseq node.

Fixes: e582b47a9252 ("ARM: dts: sun8i-h3: Add dts for the Beelink X2 STB"=
)
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dt=
s/sun8i-h3-beelink-x2.dts
index 6277f13f3eb3..6a0ac85b4616 100644
--- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
@@ -89,7 +89,10 @@
=20
 	wifi_pwrseq: wifi_pwrseq {
 		compatible =3D "mmc-pwrseq-simple";
+		pinctrl-names =3D "default";
 		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
+		clocks =3D <&rtc 1>;
+		clock-names =3D "ext_clock";
 	};
=20
 	sound_spdif {
@@ -155,6 +158,8 @@
=20
 &mmc1 {
 	vmmc-supply =3D <&reg_vcc3v3>;
+	vqmmc-supply =3D <&reg_vcc3v3>;
+	mmc-pwrseq =3D <&wifi_pwrseq>;
 	bus-width =3D <4>;
 	non-removable;
 	status =3D "okay";
--=20
2.21.0
