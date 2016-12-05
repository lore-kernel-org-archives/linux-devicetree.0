From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Add num-cs for A20 spi nodes
Date: Mon, 5 Dec 2016 10:28:21 +0100
Message-ID: <20161205092821.m2fmqxnzalcignly@lukather>
References: <20161122170616.29557-1-manu@bidouilliste.com>
 <20161124195517.qrq7briu3pwjnp4n@lukather>
 <20161124210509.be743aae84c26c6c2e666c6e@bidouilliste.com>
 <20161125152047.oadxi2xbgm4kdd7q@lukather>
 <20161125220752.c989c85e01ed202be0485c78@bidouilliste.com>
 <20161201092150.rlo5skxd6elovlgq@lukather>
 <20161201112414.62f9b351186115f62c8998a9@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bcptdv7tv3e5gopa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161201112414.62f9b351186115f62c8998a9@bidouilliste.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--bcptdv7tv3e5gopa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2016 at 11:24:14AM +0100, Emmanuel Vadot wrote:
> > > > >  If num-cs isn't present nothing prevent to start a transfer
> > > > > with a non-valid CS pin, resulting in an error.  num-cs are
> > > > > default property especially made for this and a SPI driver
> > > > > should try to get the property at probe/attach time.
> > > >=20
> > > > Yes, but as far as I know, our driver doesn't. I'm all in for
> > > > having support for that in our driver, but without it, that
> > > > patch is kind of useless.
> > >=20
> > >  Yes the Linux driver doesn't use it but my upcoming one for FreeBSD
> > > uses it. So it is not useless for downstream user of DTS.
> >=20
> > Ah, I didn't know this was for FreeBSD. So you started to use our DTs,
> > or do you have some modifications to it? How does that work?
>=20
> Yes we use the DTS from linux from quite some times now. We're
> currently synced with 4.7-ish.  We either use them directly or
> modify them according to our needs and driver support.

Do you have a link to those modifications?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bcptdv7tv3e5gopa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRTMwAAoJEBx+YmzsjxAgjdwP/jc5Va94qR3riJY6u7G9PbY8
06NHPSGzmYTytEtM0bk3h5fbHoGkyKI9srUubyJpyKIBamiVDLe10qNvl/tTE771
KM8af14HGNq7RyW7n08OUDjXguNxPrn566VHITSoeIKpMjPU9fu73lvZP2B2Pa28
ZXnVn/n+XzcbndD0XV/nsP4i0iEs7rCVpTNcqwnKgYE9NWFoc27SP7mANuDNHVJb
vfs+jqLcNuDLMScsx9pem9IS1+jqNNYjB4vyEWMnMKdwCCk4LC0rXYLerbvZDv3+
Lgj08OyiLlRYV7psVuBhEZKf4t21Hgtb4tUsw8YD7YsizQN4dVxcVZAbFjOLAs7L
SzBPrwJ+il2tDj4hJiSW4mapzaz8ckYHYffcyjBL//XejcKcGuOBqtZJnG9k8p0I
FYWKKfM2Hq/5PkOB5QN3ux4HT4sUxCgEsDPEfrxhEHzuqJNTvnQSY+hZfOk8jGVU
8Kgi97s2tVeel5senEb2bZUcRumtBOtsxY4FN+ZMb7zC20O27jIn1RmnuNwDWTIw
YkINK/c9SAWJgKHobAOdIkcCuFtbKr0Ztqy7e5//gQz8VCx1tA9BPUYPlvCJTF0v
XEtiSgWSkLZHC3Krefb/t7rDOjC2slrGjcVyjI2ozRh3qa1yJ9KhAzW7FjITSew5
1WFfPebdTPoTdqaKtxCU
=HvAx
-----END PGP SIGNATURE-----

--bcptdv7tv3e5gopa--
