From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: dts: sun7i: Enable NAND on Wexler TAB7200
Date: Fri, 10 Jun 2016 10:56:22 +0200
Message-ID: <20160610085622.GO5242@lukather>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
 <1465208664-9366-8-git-send-email-mamlinav@gmail.com>
 <20160608220314.GL14179@lukather>
 <20160609111100.38931fbe05fda9be7a355836@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ssZxAlvqSOvXAj81"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160609111100.38931fbe05fda9be7a355836-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ssZxAlvqSOvXAj81
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2016 at 11:11:00AM +0300, Aleksei Mamlin wrote:
> On Thu, 9 Jun 2016 00:03:14 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > Hi,
> >=20
> > On Mon, Jun 06, 2016 at 01:24:24PM +0300, Aleksei Mamlin wrote:
> > > Enable the NFC and describe the NAND flash connected to this controll=
er.
> > >=20
> > > Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 41 ++++++++++++++++=
++++++++++
> > >  1 file changed, 41 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/ar=
m/boot/dts/sun7i-a20-wexler-tab7200.dts
> > > index 2f6b21a..42aff91 100644
> > > --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > > +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > > @@ -159,6 +159,47 @@
> > >  	status =3D "okay";
> > >  };
> > > =20
> > > +&nfc {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&nand_pins_a>, <&nand_cs0_pins_a>, <&nand_rb0_pins_a=
>;
> > > +	status =3D "okay";
> > > +
> > > +	nand@0 {
> > > +		#address-cells =3D <2>;
> > > +		#size-cells =3D <2>;
> > > +		reg =3D <0>;
> > > +		allwinner,rb =3D <0>;
> > > +
> > > +		nand-ecc-mode =3D "hw";
> > > +		nand-on-flash-bbt;
> > > +
> > > +		boot0@0 {
> > > +			label =3D "boot0";
> > > +			reg =3D /bits/ 64 <0x0 0x200000>;
> > > +		};
> > > +
> > > +		boot0-rescue@200000 {
> > > +			label =3D "boot0-rescue";
> > > +			reg =3D /bits/ 64 <0x200000 0x200000>;
> > > +		};
> > > +
> > > +		uboot@400000 {
> > > +			label =3D "uboot";
> > > +			reg =3D /bits/ 64 <0x400000 0x200000>;
> > > +		};
> > > +
> > > +		uboot-rescue@600000 {
> > > +			label =3D "uboot-rescue";
> > > +			reg =3D /bits/ 64 <0x600000 0x200000>;
> > > +		};
> > > +
> > > +		main@800000 {
> > > +			label =3D "main";
> > > +			reg =3D /bits/ 64 <0x800000 0xff800000>;
> > > +		};
> > > +	};
> > > +};
> >=20
> > This feels a bit premature. The two boards you're using have an MLC
> > NAND which is not supported yet. Until there's proper MLC support in
> > the kernel, I'm not sure we want to enable that for end-users when we
> > know that things will get wrong.
> >=20
> > However, after discussing this with Boris, I appreciate that we don't
> > have any example available because of this policy for people that want
> > to opt-in anyway.
> >=20
> > What we could do is to still mark the status as disabled in the DTS,
> > with a big fat warning as comment just before, so that it requires
> > user action, and that user will have been warned.
> >=20
> > Would that work for you?
> > Maxime
> >=20
>=20
> Let's drop this two patches with boards dts changes until we get proper M=
LC
> support in kernel.
>=20
> As for examples - I'll update linux-sunxi wiki with how to enable NAND=20
> controller and describe NAND chips in DTS. People who want to add NAND su=
pport=20
> to their boards will be warned that it is risky for now.

That works for me too.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ssZxAlvqSOvXAj81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWoC2AAoJEBx+YmzsjxAgItMQAI1qCJ7t9KQ79dMcS83CRhVe
VwJincLX8P9ie0tdxLbWKh+cTCx/bg0JLSGPCTpcz4z5RMWI1OvVI3puMvNGzzAK
Dkib/b8qtqfHS80SAa7w2l2GdD09UzXABfv/u0QZknl/mqSQkT/7LN23j5Fjz+JH
Gd5dAXgxwuryffsBwXEbhMe1qpAYh9Zt0zLmHlpaRGY9N4VH3RNp8UKtVcCbqa+R
LWRegmizoJ2P93rdSmrTjtmiZemPSa85nxSquxi3Qdgy6Pj2MMKF8tT0W9iyF1Lb
SGJ7tX3NVk49P+Ikkqj/6mLKOMzgcsOkE+OH/aVNWOwtGjOJ6zFlsKblRWfCq2M6
Mpghaozx5jtERTd86HR4puQoktYPYoL08sGa6/uwm0SNPHsv8WvISn+Iv85wxaeR
od9cA6yeL8FHTU5p0U+QGvQIpVsTxVpwTOkiETDTpu50zau7Q1KcRBiWLVphMmTB
jSbVqf1f8U70ctVNVRrcOrBCPJI9jmEYfvQtTICjIxivZdKQuNh6MGVjva0IG7Sl
aFZagoOObYjcZDzuCcrXvDIJOmMlL9ky6YgxVjNqHedSwwBxWm4ZK3bKA9ouAANj
6f0DscN7a4vbC+XOD68mfxXhZys1TgxTOSgwrWOwmWdCmJ07mnK5YpqXMchzJcFy
Dn+hE+qIep4Rl35PfC3R
=qEma
-----END PGP SIGNATURE-----

--ssZxAlvqSOvXAj81--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
