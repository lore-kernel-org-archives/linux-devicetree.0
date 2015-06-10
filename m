From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] ARM: dts: vfxxx: Add OCOTP and OCROM nodes
Date: Wed, 10 Jun 2015 18:16:08 +0200
Message-ID: <20150610161608.GC19653@lukather>
References: <cover.1433494491.git.maitysanchayan@gmail.com>
 <fd4fcd83d901b2563ddbce84b339f42778c71260.1433494491.git.maitysanchayan@gmail.com>
 <20150606115833.GP23777@lukather>
 <20150608043753.GA3497@Sanchayan-Arch.toradex.int>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150608043753.GA3497-2b/appYahYAQpivJYWJ5AnfHJb42ZiuNiBNltiLz+yw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 08, 2015 at 10:07:53AM +0530, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > > Add a device tree node for the On-Chip One Time Programmable
> > > Controller (OCOTP) and the On-Chip ROM.
> > >=20
> > > Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/vfxxx.dtsi | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.d=
tsi
> > > index 2f4b04d..ed9b6b8 100644
> > > --- a/arch/arm/boot/dts/vfxxx.dtsi
> > > +++ b/arch/arm/boot/dts/vfxxx.dtsi
> > > @@ -56,6 +56,13 @@
> > >  		compatible =3D "simple-bus";
> > >  		interrupt-parent =3D <&mscm_ir>;
> > >  		ranges;
> > > +		ocotp-cfg =3D <&ocotp 0x410 0x420>;
> > > +		rom-revision =3D <&ocrom 0x80>;
> > > +
> > > +		ocrom: ocrom {
> > > +			compatible =3D "fsl,vf610-ocrom", "syscon";
> > > +			reg =3D <0x00000000 0x18000>;
> > > +		};
> >=20
> > Shouldn't that use the new nvmem framework currently being discussed,
> > instead of defining custom bindings?
>=20
> I am aware of those nvmem framework patches by Srinivas, however from what
> I can see that framework has not been merged yet atleast from the mail
> chain that I see for v5 of the patchset so I have not properly looked into
> that. Mark Brown did apply the regmap patches to his tree, but has the re=
st
> of the framework been merged or is it expected to be merged?

Yeah, obviously the plan is to get it merged, and there's some effort
toward that, with the amount of review that seem to slow down, so I
guess it's closer to its merge than to its first submission.

> If it is expected to be merged and if that framework is a fit for what we
> are trying to do here and it seems so on a quick glance, then I can go wi=
th
> that. However I still did like to hear from Arnd or have some more commen=
ts
> before I go for that approach with the next respin.

If it doesn't fit, don't hesitate to mention your concern on the
thread. What you're trying to do should definitely be covered by that
framework.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVeGLIAAoJEBx+YmzsjxAggH0P/ibP4U9nAG5WIvw5nAMEM+Ak
sG3+FoH5BaocgG9IDK5vNKkr708GEfvR30k8kSB2dMe4ACgQkEaCUlv/RgReRDJG
6UuRhZYZmxSyEg3GAMA424jcqlGNjGtbg4yrHiHDKjYYArkk8JEa3lVRHofPuy7I
sTD5CEh7sMya3gvi8ECfwHfcVKIx4stKY4L2IAEYaFLu2wEHi4Pk3ybJ+iX8Nzmo
l2L6oLbgOcIk0zdtLObXFu0g6SdOT1ECBnmnO9OP1P2cwYS4mPOG7Ltwd9Xw6Jkg
cJOYEovdwGSPe9ExRkXPril8tusOnE2jWKRpt/cVaBIkl1mZ20N/Xg72sCatC3O8
N55z6ZKBlYOawUAfk+Dy0eYByAsNssnUqV9m0xKXDPYlBy+Px8ZpWzK+aaq1G+2h
tcBbtmVgpUm+Y/ndKKWxJ8nudwRDoOqrjAcuPW4plSykPHgUq9M8wwou35VSmyav
SuaiCJGUCL7BIE04IUWXWck3yZxwNBhjhcPA7CDzXR4ldi1JWGUXbojnIXb3in2R
hdejslRLo/FiTSnxD4bBQr/q87qGVGSTdE9M0JAfhQjyJpFlbu9rhyKthBbDOxOr
faUTXOV1KN1tUll7184lSCKpnpshYJSqY9XHi3HX+eA6UdWAFu5CHXA9tbHiFrDr
JLxzE8b0+g/10RodTNzC
=Fwau
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
