From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] ARM64: dts: amlogic: Clean up Vega S95 /memory nodes
Date: Thu, 17 Mar 2016 00:10:53 +0100
Message-ID: <1458169854-26127-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Resolve the following warnings from new dtc by adding the unit address:

    DTC     arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
  Warning (unit_address_vs_reg): Node /memory has a reg or ranges prope=
rty, but no unit name
    DTC     arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
  Warning (unit_address_vs_reg): Node /memory has a reg or ranges prope=
rty, but no unit name
    DTC     arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
  Warning (unit_address_vs_reg): Node /memory has a reg or ranges prope=
rty, but no unit name

=46ixes: cc733bc90636 ("ARM64: dts: amlogic: Add Tronsmart Vega S95 con=
figs")
Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts  | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts   | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts b=
/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts
index 399aff9e7975..62fb4968d680 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts
@@ -48,7 +48,7 @@
 	compatible =3D "tronsmart,vega-s95-meta", "tronsmart,vega-s95", "amlo=
gic,meson-gxbb";
 	model =3D "Tronsmart Vega S95 Meta";
=20
-	memory {
+	memory@0 {
 		device_type =3D "memory";
 		reg =3D <0x0 0x0 0x0 0x80000000>;
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts b/=
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts
index ac5a241b5ec2..9a9663abdf5c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts
@@ -48,7 +48,7 @@
 	compatible =3D "tronsmart,vega-s95-pro", "tronsmart,vega-s95", "amlog=
ic,meson-gxbb";
 	model =3D "Tronsmart Vega S95 Pro";
=20
-	memory {
+	memory@0 {
 		device_type =3D "memory";
 		reg =3D <0x0 0x0 0x0 0x40000000>;
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts =
b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts
index fff7bfa2aa39..2fe167b2609d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts
@@ -48,7 +48,7 @@
 	compatible =3D "tronsmart,vega-s95-telos", "tronsmart,vega-s95", "aml=
ogic,meson-gxbb";
 	model =3D "Tronsmart Vega S95 Telos";
=20
-	memory {
+	memory@0 {
 		device_type =3D "memory";
 		reg =3D <0x0 0x0 0x0 0x80000000>;
 	};
--=20
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
