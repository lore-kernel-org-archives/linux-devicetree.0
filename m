From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v3 5/8] arm64: dts: rockchip: Clean up gpio-keys nodes
Date: Sun,  6 Mar 2016 20:53:54 +0100
Message-ID: <1457294038-14243-6-git-send-email-afaerber@suse.de>
References: <1457294038-14243-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457294038-14243-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Julien Chauveau <chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Drop superfluous #address-cells and #size-cells.
Use KEY_POWER define for 116.

Reported-by: Julien Chauveau <chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 v3: New (Julien)
=20
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi | 5 ++---
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts  | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3368-evb.dtsi
index 06bbe421db37..b62035436d38 100644
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
@@ -105,8 +106,6 @@
=20
 	keys: gpio-keys {
 		compatible =3D "gpio-keys";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
 		pinctrl-names =3D "default";
 		pinctrl-0 =3D <&pwr_key>;
=20
@@ -114,7 +113,7 @@
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
index a1d1aa9c16fe..efb5fa32ecac 100644
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
@@ -65,8 +66,6 @@
=20
 	keys: gpio-keys {
 		compatible =3D "gpio-keys";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
 		pinctrl-names =3D "default";
 		pinctrl-0 =3D <&pwr_key>;
=20
@@ -74,7 +73,7 @@
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
