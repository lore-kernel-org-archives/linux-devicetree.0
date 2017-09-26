From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 00/14] ARM: dts: sunxi: Fix DT build warnings
Date: Tue, 26 Sep 2017 10:58:55 +0200
Message-ID: <20170926085855.7yn6zdx3sfuwwxyj@flea>
References: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
 <CAGb2v64AK-xifjcowUk1mp4TRwHFPOqjZR58Bd5w7Bei52T06g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ednxqi4tbf6flagf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64AK-xifjcowUk1mp4TRwHFPOqjZR58Bd5w7Bei52T06g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ednxqi4tbf6flagf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 07:48:17AM +0000, Chen-Yu Tsai wrote:
> On Tue, Sep 26, 2017 at 3:22 PM, Corentin Labbe
> <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hello
> >
> > The goal of this patch series is to have a clean DT build with W=3D1.
> >
> > Regards
> >
> > Changes since v1:
> > - moved i2c2 unit address change from patch #2 in patch #1
> >
> > Changes since v2
> > - added two patch for fixing pin names
>=20
> The first twelve patches are good. Maxime, I think we can go ahead and
> merge them, instead of having them resent again in v3?

Yep, that works for me. Can you push them?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ednxqi4tbf6flagf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyhbPAAoJEBx+YmzsjxAgl5cP/1x1BAwhv/bmy5CXOY2+5mPp
XIN5fBahSFySSeCaevRV3/HnJZU82vXn2oGax7yOfvGTSBo5pVzxtoz04CFr3fVK
BlDeNA4QIKP8SjNIXhUweAkZR+8ClT88Z/lwl6yEI7gsprJ3OWr0cy4fIAigzzBL
vOxnI5RFg+/8lCn1qa4zrmCjSd3MP4QS1fYeu3ORvTZLzWWtlDPs9LbIy3jB8Nxu
G8gCclS1nQvMXtj9GjALzSpN2Tvs8BJRNP77Rl9B6JEUJIVlW9hyxCPqtkJwt5po
O3WSD9e5Um/n+Hd+Wcj249134nUNo30okW/Z0CZggxC4H3Js2GC8EHamtrmUv6vz
BKTila7ZeVAwyHU8dayDX5a8mLJztspcAelkrMbubv2NwVEjF/B1GJ1Jtua0eS0w
6dyCRjwxFt5FFFxaaWanUy9w21Ux36A/fFPs/uPTmOkxxUU1nt6tGizNVjBJ+ls0
KVYnp5qU6lW0cD4AjML+veikoB3EzNFLzEI7FPSOIl+9qrTIXnr3iBDLvgbgy1KP
KWZSJR/QIZZYcw1XHcFpe0nqgexONqeSyaZuHLazCV3mF0f3OaBWM9yWvEtZeAef
P/eUL8TcWgt4SA1QbvcrXhwCAHU+N7GHu/ME3e0C2KHZrZMv9com7wq2CP7e5jvw
Q06lnEHY5JOSY+Q8P9PN
=7bEA
-----END PGP SIGNATURE-----

--ednxqi4tbf6flagf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
