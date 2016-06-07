From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun6i: Add pmic / regulator nodes to Mele
 A1000G quad dts
Date: Tue, 7 Jun 2016 23:25:45 +0200
Message-ID: <20160607212545.GF14179@lukather>
References: <1465133880-22921-1-git-send-email-hdegoede@redhat.com>
 <CAGb2v67Jo6MO7bp4JdV4hXrB4T60z4=ROkvAvE1i7dhAXk_UtQ@mail.gmail.com>
 <0a42bc82-83f2-80ce-93d4-a85c5ce69e24@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ls2Gy6y7jbHLe9Od"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0a42bc82-83f2-80ce-93d4-a85c5ce69e24-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Ls2Gy6y7jbHLe9Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2016 at 09:23:36AM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 06-06-16 09:12, Chen-Yu Tsai wrote:
> >On Sun, Jun 5, 2016 at 9:37 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrot=
e:
> >>Add pmic / regulator nodes to Mele A1000G quad dts.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>---
> >> arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts | 88 ++++++++++++++++=
+++++++-
> >> 1 file changed, 87 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts b/arch/ar=
m/boot/dts/sun6i-a31-mele-a1000g-quad.dts
> >>index e063dab..9782113 100644
> >>--- a/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
> >>+++ b/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
> >>@@ -72,6 +72,10 @@
> >>        };
> >> };
> >>
> >>+&cpu0 {
> >>+       cpu-supply =3D <&reg_dcdc3>;
> >>+};
> >>+
> >> &ehci0 {
> >>        status =3D "okay";
> >> };
> >>@@ -85,6 +89,7 @@
> >>        pinctrl-0 =3D <&gmac_pins_mii_a>;
> >>        phy =3D <&phy1>;
> >>        phy-mode =3D "mii";
> >>+       phy-supply =3D <&reg_dldo1>;
> >>        status =3D "okay";
> >>
> >>        phy1: ethernet-phy@1 {
> >>@@ -101,13 +106,26 @@
> >> &mmc0 {
> >>        pinctrl-names =3D "default";
> >>        pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_m9>;
> >>-       vmmc-supply =3D <&reg_vcc3v3>;
> >>+       vmmc-supply =3D <&reg_dcdc1>;
> >>        bus-width =3D <4>;
> >>        cd-gpios =3D <&pio 7 22 GPIO_ACTIVE_HIGH>; /* PH22 */
> >>        cd-inverted;
> >>        status =3D "okay";
> >> };
> >>
> >>+&p2wi {
> >>+       status =3D "okay";
> >>+
> >>+       axp22x: pmic@68 {
> >>+               compatible =3D "x-powers,axp221";
> >>+               reg =3D <0x68>;
> >>+               interrupt-parent =3D <&nmi_intc>;
> >>+               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> >>+       };
> >>+};
> >>+
> >>+#include "axp22x.dtsi"
> >>+
> >> &pio {
> >>        led_pins_m9: led_pins@0 {
> >>                allwinner,pins =3D "PH13";
> >>@@ -131,6 +149,73 @@
> >>        };
> >> };
> >>
> >>+&reg_aldo1 {
> >>+       regulator-min-microvolt =3D <3300000>;
> >>+       regulator-max-microvolt =3D <3300000>;
> >>+       regulator-name =3D "vcc-wifi";
> >>+};
> >>+
> >>+&reg_aldo3 {
> >>+       regulator-always-on;
> >>+       regulator-min-microvolt =3D <2700000>;
> >>+       regulator-max-microvolt =3D <3300000>;
> >>+       regulator-name =3D "avcc";
> >>+};
> >>+
> >>+&reg_dc5ldo {
> >>+       regulator-always-on;
> >>+       regulator-min-microvolt =3D <700000>;
> >>+       regulator-max-microvolt =3D <1320000>;
> >>+       regulator-name =3D "vdd-cpus"; /* This is an educated guess */
> >>+};
> >>+
> >>+&reg_dcdc1 {
> >>+       regulator-always-on;
> >>+       regulator-min-microvolt =3D <3300000>;
> >>+       regulator-max-microvolt =3D <3300000>;
> >>+       regulator-name =3D "vcc-3v3";
> >>+};
> >>+
> >>+&reg_dcdc2 {
> >>+       regulator-min-microvolt =3D <700000>;
> >>+       regulator-max-microvolt =3D <1320000>;
> >>+       regulator-name =3D "vdd-gpu";
> >>+};
> >>+
> >>+&reg_dcdc3 {
> >>+       regulator-always-on;
> >>+       regulator-min-microvolt =3D <700000>;
> >>+       regulator-max-microvolt =3D <1320000>;
> >>+       regulator-name =3D "vdd-cpu";
> >>+};
> >>+
> >>+&reg_dcdc4 {
> >>+       regulator-always-on;
> >>+       regulator-min-microvolt =3D <700000>;
> >>+       regulator-max-microvolt =3D <1320000>;
> >>+       regulator-name =3D "vdd-sys-dll";
> >>+};
> >>+
> >>+&reg_dcdc5 {
> >>+       regulator-always-on;
> >>+       regulator-min-microvolt =3D <1500000>;
> >>+       regulator-max-microvolt =3D <1500000>;
> >>+       regulator-name =3D "vcc-dram";
> >>+};
> >>+
> >>+&reg_dldo1 {
> >>+       regulator-min-microvolt =3D <3300000>;
> >>+       regulator-max-microvolt =3D <3300000>;
> >>+       regulator-name =3D "vcc-ethernet-phy";
> >>+};
> >>+
> >>+&reg_dldo4 {
> >>+       regulator-always-on;
> >
> >Why not tie this to the usbphy? Same for the other patch.
>=20
> Because both reg_usb1_vbus and reg_dldo4 need to be on
> for the hub attached to usb1 to work, and I can list
> only one usb1_vbus-supply.

Adding a comment stating that would be great :)

Thanks!
Maxime


--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Ls2Gy6y7jbHLe9Od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXVzvZAAoJEBx+YmzsjxAgDNMP/iOB+7XqABp2xHr0GmNoJ7mx
lsAIGFTPK4od8ulpEbLOCAb3OydbC7uFTrXBN8hMH+a17xzUxfF3sypuCo+9/xtR
+NZDxU7kYVbXEk0e1sEgVkhsMDcnCnoWD9N5JYr165+DJRQFcQgT2ZNSyIj3wD2K
8BIKmeVC3vqvfg/7Jcf2ql/NrKUH+OBHwBLuw5DWZ4+rhnzzSp2neOMd3iOYpkPc
H4TeAHjDEnIUuutv5aTuPcKpW6LpaS4z3W7/8UIi69j1mY/o6vEDi+ve/Ky9R5ld
/W+2s0glf1Qf140yKaa5xQClT+yQx2fTVcrjH1eZnhUXwejltQ/pRiny55qwfD3U
j6XSu8u6iBE1xDiWLt4TpA8EnZydzq+AzxqI9gVPDxY0aN26S9NrTPkZcpfAS7id
QT2UthdeWfwqi2GZMWS+4wq+CvQxAbTfHS+cZCuAZhm16XmwoIA09n6omNJytsqu
rYsiHuAUWadpapQoTdxLwoNK2ccauJe2NSx6T2D3BRNG5sjJu1iBgPlfJRxR54Q2
u9IkFC1lO/gsUqhuSNLmGry9BLKUGVH4ZVVAEIhs9sObTyYx2/pq9jPpRTmX2Xax
pGUsoQ45lRK/I/ggmTkwKhp0mhmedFpgiA7oIbz91Yjexfr+BPWVmC/ZggC/Nzk2
PADPjHCq7Tdh9OhjttSY
=2QPq
-----END PGP SIGNATURE-----

--Ls2Gy6y7jbHLe9Od--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
