From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 6/8] arm64: dts: rockchip: Add power key to GeekBox
Date: Wed, 16 Mar 2016 14:58:44 +0100
Message-ID: <1458136727-32075-7-git-send-email-afaerber@suse.de>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458136727-32075-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Julien Chauveau <chauveau.julien@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Cc: Julien Chauveau <chauveau.julien@gmail.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v3 -> v4:
 * Renamed power button sub-node name (Julien)
=20
 v2 -> v3:
 * Adopted wakeup-source instead of gpio-key,wakeup (Julien)
 * Dropped gpio-keys #address-cells and #size-cells properties (Julien)
 * Dropped power button reg property (Julien)
 * Adopted KEY_POWER (Julien)
 * Fixed power button pinctrl pull setting (Julien)
=20
 v2: New
=20
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 20 +++++++++++++++++=
+++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/arm=
64/boot/dts/rockchip/rk3368-geekbox.dts
index cef4c12bda48..46cdddfcea6c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
@@ -42,6 +42,7 @@
=20
 /dts-v1/;
 #include "rk3368.dtsi"
+#include <dt-bindings/input/input.h>
=20
 / {
 	model =3D "GeekBox";
@@ -70,6 +71,19 @@
 		pinctrl-0 =3D <&ir_int>;
 	};
=20
+	keys: gpio-keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pwr_key>;
+
+		power {
+			gpios =3D <&gpio0 2 GPIO_ACTIVE_LOW>;
+			label =3D "GPIO Power";
+			linux,code =3D <KEY_POWER>;
+			wakeup-source;
+		};
+	};
+
 	leds: gpio-leds {
 		compatible =3D "gpio-leds";
=20
@@ -265,6 +279,12 @@
 		};
 	};
=20
+	keys {
+		pwr_key: pwr-key {
+			rockchip,pins =3D <0 2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_sleep: pmic-sleep {
 			rockchip,pins =3D <0 0 RK_FUNC_2 &pcfg_pull_none>;
--=20
2.6.2
