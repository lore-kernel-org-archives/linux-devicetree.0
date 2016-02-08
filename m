From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 07/10] ARM64: dts: rockchip: Add power key to GeekBox
Date: Mon,  8 Feb 2016 03:17:36 +0100
Message-ID: <1454897859-7601-8-git-send-email-afaerber@suse.de>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454897859-7601-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2: New
=20
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 22 +++++++++++++++++=
+++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/arm=
64/boot/dts/rockchip/rk3368-geekbox.dts
index e84383fd6f10..fe5aa785cfda 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
@@ -70,6 +70,22 @@
 		pinctrl-0 =3D <&ir_int>;
 	};
=20
+	keys: gpio-keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pwr_key>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		button@0 {
+			reg =3D <0>;
+			gpio-key,wakeup =3D <1>;
+			gpios =3D <&gpio0 2 GPIO_ACTIVE_LOW>;
+			label =3D "GPIO Power";
+			linux,code =3D <116>;
+		};
+	};
+
 	leds: gpio-leds {
 		compatible =3D "gpio-leds";
=20
@@ -265,6 +281,12 @@
 		};
 	};
=20
+	keys {
+		pwr_key: pwr-key {
+			rockchip,pins =3D <0 2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	pmic {
 		pmic_sleep: pmic-sleep {
 			rockchip,pins =3D <0 0 RK_FUNC_2 &pcfg_pull_none>;
--=20
2.6.2
