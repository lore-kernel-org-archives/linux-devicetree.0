From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 5/8] arm64: dts: rockchip: Clean up gpio-keys nodes
Date: Wed, 16 Mar 2016 14:58:43 +0100
Message-ID: <1458136727-32075-6-git-send-email-afaerber@suse.de>
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

Drop superfluous #address-cells and #size-cells.
Use KEY_POWER define for 116.
Rename sub-nodes to avoid new dtc warnings.

Reported-by: Julien Chauveau <chauveau.julien@gmail.com>
Cc: Julien Chauveau <chauveau.julien@gmail.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v3 -> v4:
 * Renamed sub-node names (Julien)
=20
 v3: New (Julien)
=20
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi | 7 +++----
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts  | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3368-evb.dtsi
index e4c91e86e9b6..bd4f2cf326b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
@@ -40,6 +40,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
=20
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pwm/pwm.h>
 #include "rk3368.dtsi"
=20
@@ -105,16 +106,14 @@
=20
 	keys: gpio-keys {
 		compatible =3D "gpio-keys";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
 		pinctrl-names =3D "default";
 		pinctrl-0 =3D <&pwr_key>;
=20
-		button@0 {
+		power {
 			wakeup-source;
 			gpios =3D <&gpio0 2 GPIO_ACTIVE_LOW>;
 			label =3D "GPIO Power";
-			linux,code =3D <116>;
+			linux,code =3D <KEY_POWER>;
 		};
 	};
=20
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/b=
oot/dts/rockchip/rk3368-r88.dts
index 5c63f8982128..5ea68c493400 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
@@ -42,6 +42,7 @@
=20
 /dts-v1/;
 #include "rk3368.dtsi"
+#include <dt-bindings/input/input.h>
=20
 / {
 	model =3D "Rockchip R88";
@@ -65,16 +66,14 @@
=20
 	keys: gpio-keys {
 		compatible =3D "gpio-keys";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
 		pinctrl-names =3D "default";
 		pinctrl-0 =3D <&pwr_key>;
=20
-		button@0 {
+		power {
 			wakeup-source;
 			gpios =3D <&gpio0 2 GPIO_ACTIVE_LOW>;
 			label =3D "GPIO Power";
-			linux,code =3D <116>;
+			linux,code =3D <KEY_POWER>;
 		};
 	};
=20
--=20
2.6.2
