From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: mvebu: add Device Tree description of RTC on
 Armada 38x
Date: Wed, 14 Jan 2015 09:14:54 +0100
Message-ID: <20150114081454.GJ4891@lukather>
References: <1420817565-28800-1-git-send-email-gregory.clement@free-electrons.com>
 <1420817565-28800-5-git-send-email-gregory.clement@free-electrons.com>
 <874mrui8r3.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="icsXL8FABjDeMLkQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <874mrui8r3.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--icsXL8FABjDeMLkQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2015 at 12:03:12AM +0100, Arnaud Ebalard wrote:
> Hi Gregory,
>=20
> Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
>=20
> > The Marvell Armada 38x SoCs contains an RTC which differs from the RTC
> > used in the other mvebu SoCs until now. This commit adds the Device
> > Tree description of this interface at the SoC level.
> >
> > Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/armada-38x.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/arma=
da-38x.dtsi
> > index 04fe80d101f8..22909add8889 100644
> > --- a/arch/arm/boot/dts/armada-38x.dtsi
> > +++ b/arch/arm/boot/dts/armada-38x.dtsi
> > @@ -466,6 +466,12 @@
> >  				clocks =3D <&gateclk 4>;
> >  			};
> > =20
> > +			rtc@184a8 {
> > +				compatible =3D "marvell,armada-380-rtc";
> > +				reg =3D <0xa3800 0x20>, <0x184a0 0x0c>;
> > +				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > +			};
> > +
>=20
> Out of curiosity, why not naming the node rtc@a3800? Main argument:
> least expectation principle when reading the .dtsi and expecting
> increasing addresses. Or did I miss sth else?

Actually, the ePAPR even states that the unit-adress must be the first
address in reg (section 2.2.1.1 of the ePAPR 1.1)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--icsXL8FABjDeMLkQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUtiV+AAoJEBx+YmzsjxAgQFsQAKXcX6WiPhYrhJHAqQC3avW2
8PYK3R0UshI7A4GDOyqynF3gE5RvcQtzR0BwrX+Uxgc3CcR3ShgKzHANGZbJtuJn
HYiCZsfSRpCHxBwFP9KOqW7jtujGRKdQ6CbwqnON5AWZBjt5+BZOy6wQj4TCCi/G
5WzRqepMhz5VCZm3RosLMNF8I1fNUYFfAhYeHeHx9TDn8PLl0FYrjd4Dp3siog1D
8CehgZsKGUaGb2mDTuX4T+3IR8cxF2zn875KYEadYB1S8WWHcs3kbvPvhnYi694e
eKgJzAXRNOUz1UCPSVse4Z2B4/VobNNgLZCq0txNjFzyN9GB0aQ+O2WacEH/uw7w
zkj8X7+yBWY8zBSQhrr5DDJ3I69v1CIadx4JW7j6SNjKC+N5WTvCBTd5O8/fMqsQ
8/wqcEv5vkkHJZMTRU2hbAW+omSBqu7T6zA15earmNaU3kaOW10kEXLCXYwusJip
VcblUW8JaWP5UYQzKG8SukHx80PeoDPEJ9DVbbxWQcH8eCfVuf3Ypdv+FVhYb914
B3+fPzjTVLtlsvdosuFhyT2Ins2/uKLJIw1SU5UlFI5+ZUiN5Sw/IfH7VR0Bpf5w
apMWdqs1g86MDH5LN8a0yxDW6fFHZ+ilQD2KLAcbbEy8V5DG6LZUDKxnl3/eH35V
thGyZM9du5SY8zPfH7rK
=MEOQ
-----END PGP SIGNATURE-----

--icsXL8FABjDeMLkQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
