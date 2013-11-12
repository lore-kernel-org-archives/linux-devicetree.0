From: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] input: tc3589x-keypad: support probing from
 device tree
Date: Tue, 12 Nov 2013 21:05:14 +0100
Message-ID: <20131112200514.GA15413@earth.universe>
References: <1384265618-10590-1-git-send-email-linus.walleij@linaro.org>
 <20131112153057.GA9683@earth.universe>
 <CACRpkdb_bryGJo7CKGP5tj3RFGv=Gh+Q5m9ucVKqJ068tjPC2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb_bryGJo7CKGP5tj3RFGv=Gh+Q5m9ucVKqJ068tjPC2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2013 at 06:06:49PM +0100, Linus Walleij wrote:
> On Tue, Nov 12, 2013 at 4:30 PM, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org> wrote:
> > On Tue, Nov 12, 2013 at 03:13:38PM +0100, Linus Walleij wrote:
>=20
> >> +     plat->no_autorepeat =3D of_property_read_bool(np, "linux,no-auto=
repeat");
> >> +     plat->enable_wakeup =3D of_property_read_bool(np, "linux,wakeup"=
);
> >
> > There is currently discussion going on for the property name of
> > autorepeat:
> >
> > https://lkml.org/lkml/2013/11/11/680
>=20
> So this binding is documented for GPIO keys in:
> Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
>=20
> This is probably the most used binding as GPIO matrixes are
> not uncommon. But I don't know, yes it is a mess. (As usual.)

I could find two boards using "gpio-matrix-keypad" in the mainline
kernel and not a single instance of "linux,no-autorepeat":

arch $ grep "gpio-matrix-keypad" **/*.dts **/*.dtsi
arm/boot/dts/am335x-evm.dts:               compatible =3D "gpio-matrix-keyp=
ad";
powerpc/boot/dts/ac14xx.dts:               compatible =3D "gpio-matrix-keyp=
ad";

arch $ grep "autorepeat" **/*.dts **/*.dtsi
arch/arm/boot/dts/am335x-evm.dts:          autorepeat;
arch/arm/boot/dts/ea3250.dts:              autorepeat;
arch/arm/boot/dts/exynos4210-smdkv310.dts: linux,keypad-no-autorepeat;
arch/arm/boot/dts/exynos4412-origen.dts:   linux,keypad-no-autorepeat;
arch/arm/boot/dts/exynos4412-smdk4412.dts: linux,keypad-no-autorepeat;
arch/arm/boot/dts/omap4-sdp.dts:           linux,input-no-autorepeat;
arch/arm/boot/dts/spear1310-evb.dts:       autorepeat;
arch/arm/boot/dts/spear1340-evb.dts:       autorepeat;
arch/arm/boot/dts/spear300-evb.dts:        autorepeat;
arch/arm/boot/dts/ste-stuib.dtsi:          st,no-autorepeat;

-- Sebastian

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSgon6AAoJENju1/PIO/qay38P/RnuZZd7bzikUgj/fEQdfRc9
Keb+fbiB8iWTTtTBVHl1fbA4ATxznNISNWfzAeUJkakSA/lH6iiaL6cOYsvWQHwY
7HHLRT33yntSMq55eKSGZI4YDzNT86KinMzvuyq2y8/QsaPwSS3AmxPFVwiwQvaa
bcoz3fEgul6Na2vkuEr98DfZ7/0glGAWsfFoz0viYSua1evBnDMgybo163UpYMAs
VaoSQeaBY+zj5tDTctn9vy44lnqhzCuhMszyuaUzpq8SXIwEsij/yW8ghOXXtOrH
h2cvMVwfJiNWPpV126q94v1BDWuNE4sr9+J1FlX/wyDAG9ZSBFZrdEOD0VtXbT4C
1id+GYgpyUX281WrJyWz11kquPT/BhZtXEIaXZ3pyp9KkIzmmcMnoZdEm35X58I4
D/Xi6R0TKVABeaTHktg/O19PX/X3DXFF7qxwCAvlxekOZ/VRVMH56mLHNrInkK5G
kecPW+JZk5Zz8kzKPADrwIiFMrHki2C+bo4xi3KwKZHG1Dd5ivUGSW4yOMU0obZX
7trmfPwaggs8PnR3ouHQ9o+KPedKainptwQlvjLoo0taitiW/C3jNnU/4bAb9Dv3
dFua01FEogeHNkuj/2j+cWxkDKi2ht64TY6pLPLFWbdB3wk3XykVNfryxcUmo3iv
wL6D9w1EDC1YHHfSxmUT
=x9ZB
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
