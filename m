From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun5i: Enable touchscreen on Utoo P66
Date: Wed, 8 Apr 2015 09:12:28 +0200
Message-ID: <20150408071228.GB26727@lukather>
References: <1427902177-26526-1-git-send-email-hdegoede@redhat.com>
 <20150404124458.GI14618@lukather>
 <551FE565.6050800@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <551FE565.6050800-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04, 2015 at 03:21:41PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 04-04-15 14:44, Maxime Ripard wrote:
> >Hi Hans,
> >
> >On Wed, Apr 01, 2015 at 05:29:37PM +0200, Hans de Goede wrote:
> >>Add a node for the chipone-icn8318 touchscreen found on the Utoo P66 ta=
blet.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>---
> >>Changes in v2:
> >>-Fix touchscreen node name
> >>---
> >>  arch/arm/boot/dts/sun5i-a13-utoo-p66.dts | 22 ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >>diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot/d=
ts/sun5i-a13-utoo-p66.dts
> >>index 9108ecd..00bdf28 100644
> >>--- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> >>+++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> >>@@ -50,6 +50,7 @@
> >>  #include "sunxi-common-regulators.dtsi"
> >>  #include <dt-bindings/gpio/gpio.h>
> >>  #include <dt-bindings/input/input.h>
> >>+#include <dt-bindings/interrupt-controller/irq.h>
> >>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> >>
> >>  / {
> >>@@ -93,6 +94,20 @@
> >>  	pinctrl-0 =3D <&i2c1_pins_a>;
> >>  	status =3D "okay";
> >>
> >>+	icn8318: touchscreen@40 {
> >>+		compatible =3D "chipone,icn8318";
> >>+		reg =3D <0x40>;
> >>+		interrupt-parent =3D <&pio>;
> >>+		interrupts =3D <9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
> >
> >I don't think you sent a reply to this comment, but this should really
> >be in a pinctrl node so that no one else can request the pin and
> >change its muxing and it shows up in debugfs.
>=20
> I did reply to that comment on v1 of this patch:
>=20
> """
> That is not necessary when specifying a gpio interrupt through the
> irq chip (rather then through a gpios property), the mux is automatically
> set to irq by the kernel when requesting the irq.
>=20
> Also note that we must use the interrupts notation here as this is specif=
ied
> by the i2c client bindings. None of the other boards using i2c + oob irq
> pins specifies a pinmux for the irq pin either.
> """

I never received that mail, I guess we can blame Google Groups for
that.

> I've just double checked and I cannot (quickly) find any existing
> devicetree files using interrupts =3D <foo> combined with pinctrl for
> i2c clients.
>=20
> If you look in e.g. arch/arm/boot/dts/exynos4210-trats.dts and
> arch/arm/boot/dts/exynos4412-trats2.dts you will see the same
> pattern of using interrupts =3D <foo> pointing to a gpio without using
> pinctrl
>=20
> And we already to the same for sdio oob interrupts in
> sun7i-a20-cubietruck.dts and
> arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts, so I vote for being
> consistent here and not using pinctrl for the irq pin here either.

That might turn out to be an issue, but ok.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVJNTbAAoJEBx+YmzsjxAgZ0sP/0xX8hf+mKtWr4y/oPlGRYF0
KkF4RR8CZ5n0VN67xRLMIWayZoNbWTDk9RZ/8r3d3uFbkvx/fDun3tgdnhhFvvc8
7pW7jTU1tMEATUz3MOO/Vo7vzSSehrvRqGrR6DNKpjNxzasFeZCNJ2yx/+joWf6A
aLR/FGBBNtTUJMuPkZop4olX4nCV1IHxxG8RmI64DeWguW55aZ/MSYEv/j6cPx1h
Iv60huf0CM3JaqsZiI6iJ3Kfuj0b2EZ/9owmNxgjU8i3hgT5muEB08aNbPqe2NJE
kEc6YZRrp2GMjYiNNKo31l34hLqaR8XKsR74gJ5b/feV24SrBK0HGYYQooEL9xA6
M7AajIZbkFasu4XJY3vSQUNWDEBk1K5OdeNDDPUuYyxUj5nB/DKI5IYeE1XRf2hs
bhY30hUoUBECn6zlWVXNqZspHej0tsVnJje0xCayUg+ONRX8ZMJzxkw/rjG6SIH0
24K73uoPS4Uthb1+7DSmPngiU5ccxnXzGPXw2n1X9LDH9krB5TdP6FBtCINujLOK
Rzvcy3UtYMlukRp4NHU4L/nZJ63+BzElUkqSCDalEcrgDTK1UJS5ne/RjaO+qjU8
AnPvRzG1Yeo0ye4i4WVBzjciIm7HCIIZubRMdyebhnjukJZq9EFAeqsqkcmdD2ag
iCTrxbx61vQ3WuMhyDES
=U+z0
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
