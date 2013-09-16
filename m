From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 2/2] ARM: vexpress: Add CLCD Device Tree properties
Date: Mon, 16 Sep 2013 18:18:54 +0100
Message-ID: <1379351934-25415-2-git-send-email-pawel.moll@arm.com>
References: <1379351934-25415-1-git-send-email-pawel.moll@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379351934-25415-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

... for V2M-P1 motherboard CLCD (limited to 640x480 16bpp and using
dedicated video RAM bank) and for V2P-CA9 (up to 1024x768 16bpp).

Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 22 +++++++++++++++++++++-
 arch/arm/boot/dts/vexpress-v2m.dtsi     | 22 +++++++++++++++++++++-
 arch/arm/boot/dts/vexpress-v2p-ca9.dts  | 19 +++++++++++++++++++
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/ve=
xpress-v2m-rs1.dtsi
index ac870fb..8226149 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -233,6 +233,26 @@
 =09=09=09=09interrupts =3D <14>;
 =09=09=09=09clocks =3D <&v2m_oscclk1>, <&smbclk>;
 =09=09=09=09clock-names =3D "clcdclk", "apb_pclk";
+
+=09=09=09=09arm,pl11x,panel-data-pads =3D <0x300 0x301 0x302 0x303 0x304 0=
x305 0x306 0x307>,
+=09=09=09=09=09=09=09    <0x310 0x311 0x312 0x313 0x314 0x315 0x316 0x317>=
,
+=09=09=09=09=09=09=09    <0x320 0x321 0x322 0x323 0x324 0x325 0x326 0x327>=
;
+=09=09=09=09arm,pl11x,framebuffer-base =3D <0x18000000 0x00800000>;
+=09=09=09=09max-memory-bandwidth =3D <36864000>; /* Bps, 640x480@60 16bpp =
*/
+=09=09=09=09display-timings {
+=09=09=09=09=09native-mode =3D <&v2m_clcd_timing0>;
+=09=09=09=09=09v2m_clcd_timing0: vga {
+=09=09=09=09=09=09clock-frequency =3D <25175000>;
+=09=09=09=09=09=09hactive =3D <640>;
+=09=09=09=09=09=09hback-porch =3D <40>;
+=09=09=09=09=09=09hfront-porch =3D <24>;
+=09=09=09=09=09=09hsync-len =3D <96>;
+=09=09=09=09=09=09vactive =3D <480>;
+=09=09=09=09=09=09vback-porch =3D <32>;
+=09=09=09=09=09=09vfront-porch =3D <11>;
+=09=09=09=09=09=09vsync-len =3D <2>;
+=09=09=09=09=09};
+=09=09=09=09};
 =09=09=09};
 =09=09};
=20
@@ -282,7 +302,7 @@
 =09=09=09=09/* CLCD clock */
 =09=09=09=09compatible =3D "arm,vexpress-osc";
 =09=09=09=09arm,vexpress-sysreg,func =3D <1 1>;
-=09=09=09=09freq-range =3D <23750000 63500000>;
+=09=09=09=09freq-range =3D <23750000 65000000>;
 =09=09=09=09#clock-cells =3D <0>;
 =09=09=09=09clock-output-names =3D "v2m:oscclk1";
 =09=09=09};
diff --git a/arch/arm/boot/dts/vexpress-v2m.dtsi b/arch/arm/boot/dts/vexpre=
ss-v2m.dtsi
index f142036..4befe1c 100644
--- a/arch/arm/boot/dts/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m.dtsi
@@ -232,6 +232,26 @@
 =09=09=09=09interrupts =3D <14>;
 =09=09=09=09clocks =3D <&v2m_oscclk1>, <&smbclk>;
 =09=09=09=09clock-names =3D "clcdclk", "apb_pclk";
+
+=09=09=09=09arm,pl11x,panel-data-pads =3D <0x300 0x301 0x302 0x303 0x304 0=
x305 0x306 0x307>,
+=09=09=09=09=09=09=09    <0x310 0x311 0x312 0x313 0x314 0x315 0x316 0x317>=
,
+=09=09=09=09=09=09=09    <0x320 0x321 0x322 0x323 0x324 0x325 0x326 0x327>=
;
+=09=09=09=09arm,pl11x,framebuffer-base =3D <0x4c000000 0x00800000>;
+=09=09=09=09max-memory-bandwidth =3D <36864000>; /* Bps, 640x480@60 16bpp =
*/
+=09=09=09=09display-timings {
+=09=09=09=09=09native-mode =3D <&v2m_clcd_timing0>;
+=09=09=09=09=09v2m_clcd_timing0: vga {
+=09=09=09=09=09=09clock-frequency =3D <25175000>;
+=09=09=09=09=09=09hactive =3D <640>;
+=09=09=09=09=09=09hback-porch =3D <40>;
+=09=09=09=09=09=09hfront-porch =3D <24>;
+=09=09=09=09=09=09hsync-len =3D <96>;
+=09=09=09=09=09=09vactive =3D <480>;
+=09=09=09=09=09=09vback-porch =3D <32>;
+=09=09=09=09=09=09vfront-porch =3D <11>;
+=09=09=09=09=09=09vsync-len =3D <2>;
+=09=09=09=09=09};
+=09=09=09=09};
 =09=09=09};
 =09=09};
=20
@@ -281,7 +301,7 @@
 =09=09=09=09/* CLCD clock */
 =09=09=09=09compatible =3D "arm,vexpress-osc";
 =09=09=09=09arm,vexpress-sysreg,func =3D <1 1>;
-=09=09=09=09freq-range =3D <23750000 63500000>;
+=09=09=09=09freq-range =3D <23750000 65000000>;
 =09=09=09=09#clock-cells =3D <0>;
 =09=09=09=09clock-output-names =3D "v2m:oscclk1";
 =09=09=09};
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts b/arch/arm/boot/dts/vex=
press-v2p-ca9.dts
index 62d9b22..5eb68b8 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca9.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
@@ -73,6 +73,25 @@
 =09=09interrupts =3D <0 44 4>;
 =09=09clocks =3D <&oscclk1>, <&oscclk2>;
 =09=09clock-names =3D "clcdclk", "apb_pclk";
+
+=09=09arm,pl11x,panel-data-pads =3D <0x300 0x301 0x302 0x303 0x304 0x305 0=
x306 0x307>,
+=09=09=09=09=09    <0x310 0x311 0x312 0x313 0x314 0x315 0x316 0x317>,
+=09=09=09=09=09    <0x320 0x321 0x322 0x323 0x324 0x325 0x326 0x327>;
+=09=09max-memory-bandwidth =3D <94371840>; /* Bps, 1024x768@60 16bpp */
+=09=09display-timings {
+=09=09=09native-mode =3D <&clcd_timing0>;
+=09=09=09clcd_timing0: xga {
+=09=09=09=09clock-frequency =3D <63500127>;
+=09=09=09=09hactive =3D <1024>;
+=09=09=09=09hback-porch =3D <152>;
+=09=09=09=09hfront-porch =3D <48>;
+=09=09=09=09hsync-len =3D <104>;
+=09=09=09=09vactive =3D <768>;
+=09=09=09=09vback-porch =3D <23>;
+=09=09=09=09vfront-porch =3D <3>;
+=09=09=09=09vsync-len =3D <4>;
+=09=09=09};
+=09=09};
 =09};
=20
 =09memory-controller@100e0000 {
--=20
1.8.1.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
