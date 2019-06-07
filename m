From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 05/13] ARM: dts: sunxi: Prefer A31 bindings
 for IR
Date: Sat,  8 Jun 2019 01:10:52 +0200
Message-ID: <20190607231100.5894-6-peron.clem@gmail.com>
References: <20190607231100.5894-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBE665PTQKGQEKNAO24Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190607231100.5894-1-peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Young <sean-hENCXIMQXOg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since A31, memory mapping of the IR driver has changed.

Prefer the A31 bindings instead of A13.

Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi  | 2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi | 2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31=
.dtsi
index c04efad81bbc..110622b30796 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -1351,7 +1351,7 @@
 		};
=20
 		ir: ir@1f02000 {
-			compatible =3D "allwinner,sun5i-a13-ir";
+			compatible =3D "allwinner,sun6i-a31-ir";
 			clocks =3D <&apb0_gates 1>, <&ir_clk>;
 			clock-names =3D "apb", "ir";
 			resets =3D <&apb0_rst 1>;
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a8=
3t.dtsi
index 392b0cabbf0d..8d603f3309f2 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -1067,7 +1067,7 @@
=20
 		r_cir: ir@1f02000 {
 			compatible =3D "allwinner,sun8i-a83t-ir",
-				"allwinner,sun5i-a13-ir";
+				"allwinner,sun6i-a31-ir";
 			clocks =3D <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
 			clock-names =3D "apb", "ir";
 			resets =3D <&r_ccu RST_APB0_IR>;
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80=
.dtsi
index 0c1eec9000e3..310cd972ee5b 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -1167,7 +1167,7 @@
 		};
=20
 		r_ir: ir@8002000 {
-			compatible =3D "allwinner,sun5i-a13-ir";
+			compatible =3D "allwinner,sun6i-a31-ir";
 			interrupts =3D <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&r_ir_pins>;
--=20
2.20.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190607231100.5894-6-peron.clem%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
