From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 10:47:41 -0700
Message-ID: <20160331174741.GO2350@sirena.org.uk>
References: <56D65F7E.3090907@nvidia.com>
 <20160302043506.GC18327@sirena.org.uk>
 <56E81103.8010903@nvidia.com>
 <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com>
 <56ED0F58.7060005@nvidia.com>
 <56FBD4A3.7080208@nvidia.com>
 <20160330181623.GQ2350@sirena.org.uk>
 <56FCCC60.3080303@nvidia.com>
 <20160331165145.GF2350@sirena.org.uk>
 <56FD5A9F.5050001@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MCBkylF/aX/f/TlX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FD5A9F.5050001-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--MCBkylF/aX/f/TlX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 10:43:03PM +0530, Laxman Dewangan wrote:

> We need two properties, one what we measured in platform and second one f=
or
> what we want to program PMIC. This is for the case where vendor advertised
> ramp delay is not same as measured due to platform design.

What makes you say that we need two properties? =20

> Based on discussion, regulator-ramp-delay is for measured ramp delay in
> platform. So we will need another property for configuring PMIC.

So as well as delaying in the kernel to cover the ramp time you want to
configure something in the PMIC?  What are you trying to configure in
the PMIC?  How will the PMIC driver meaningfully interpret a generic
property given that the whole point here is that the PMIC is unable to
deliver in spec behaviour?

--MCBkylF/aX/f/TlX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/WK7AAoJECTWi3JdVIfQVsQH/3oftUkvejVMiQz13a1mjFYB
5ehDacey9SE2SIEWNFVs9UNy2yUhz3vuS8z3KpRZcrXcCPbWl+3WWyMge3a8XJKN
my72cZyn4qvXbzCcO1VKV79TV5HPX6g7bKVgWn9x0QAY8NEZUJ6/DIrhL5nd37lE
WOu/fmqar76RA9hnspsIyZ2UpUBGKO8mReZlzUQ598s4AlB6TuLTwE+yICNFJP8x
8w0aVUdDes5zpVjjKNYYrHbZRQdlzBRLB5DSJT8xO9v2I1bFDRIwd3/YcXYbt7Ha
oARAws0VMjfpHbF5ibk2BMMw0r4oIX1OYO0PAYjsluvUu4IP7uTTAAUIhrR7Fsk=
=5uvR
-----END PGP SIGNATURE-----

--MCBkylF/aX/f/TlX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
