From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH 2/2] ARM: Dove: Add the audio device to the Cubox DT
Date: Wed, 28 Aug 2013 11:35:21 +0200
Message-ID: <20130828113521.35c53365@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch activates the audio device of the Cubox and sets the i2s
and S/PDIF pins.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
 arch/arm/boot/dts/dove-cubox.dts                  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/dove-cubox.dts b/arch/arm/boot/dts/dove-=
cubox.dts
index 4af59b6..003d95b 100644
--- a/arch/arm/boot/dts/dove-cubox.dts
+++ b/arch/arm/boot/dts/dove-cubox.dts
@@ -132,3 +132,16 @@
 		reg =3D <0>;
 	};
 };
+
+&pinctrl {
+	pmx_audio1_i2s1_spdifo: pmx-audio1-i2s1-spdifo {
+		marvell,pins =3D "mpp_audio1";
+		marvell,function =3D "i2s1/spdifo";
+	};
+};
+
+&i2s1 {
+	status =3D "okay";
+	pinctrl-0 =3D <&pmx_audio1_i2s1_spdifo>;
+	pinctrl-names =3D "default";
+};


--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
