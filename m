From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH v3 1/2] dt-bindings: add hym8563 binding
Date: Mon, 9 Dec 2013 11:14:21 +0000
Message-ID: <20131209111421.GP29268@sirena.org.uk>
References: <201312012047.02299.heiko@sntech.de>
 <201312012047.42669.heiko@sntech.de>
 <20131202134110.GH27568@sirena.org.uk>
 <201312071446.11997.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kM4gEFU/49KOGupy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201312071446.11997.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kM4gEFU/49KOGupy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 07, 2013 at 02:46:11PM +0100, Heiko St=FCbner wrote:
> Am Montag, 2. Dezember 2013, 14:41:10 schrieb Mark Brown:
> > On Sun, Dec 01, 2013 at 08:47:42PM +0100, Heiko St=FCbner wrote:

> > > +Required properties:
> > > +- compatible: should be: "haoyu,hym8563"
> > > +- reg: i2c address
> > > +- gpios: alarm interrupt gpio

> > Why is this specified as a GPIO and not as an interrupt?
>=20
> sorry for the late reply, but it seems I got somehow droppen from your=20
> recipient list, so just found this mail on the mailinglist.

Your mail had reply to set on it.

> In v1 I specified the interrupt and the gpio. Apart from the resulting=20
> duplication of information this also resulted in the gpio only being requ=
ested=20
> but never used itself, which Mark Rutland did not seem to like this much =
:-) .
>=20
> As I'd like to keep the sanity check that really requesting the interrupt=
 gpio=20
> always provided thru a gpio. As there are other drivers going this route =
it=20
> looked like an ok way to go.

> So what would be the real way to go? Specify only the interrupt, only the=
 gpio=20
> or both?

Specify only the interrupt if it's genuinely an interrupt - requiring a
GPIO is broken as not all interrupt controllers are also GPIOs.  There
are some OMAP drivers that are broken in this regard but they shouldn't
be doing that.  Only use a GPIO specifier if it's used as a GPIO.

--kM4gEFU/49KOGupy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpaYKAAoJELSic+t+oim9OIoP/Rfqhqd5fwaEliUVkx7Nl9t2
RWMfysT/7JaHWrFEDGitE2LSMgl3rFvPLa1K+nM342kUN7gHbZjB13NVz2RswNmJ
wdgh8+ILesD+YqYrltsvggrhwW4lyvpYIoYvs6Df4H5xTITvR8ba2T+F9ymQEZh5
xvlTkDSR+rISFj9MwV7633DFZIrHCB+bgbwkJb+2fv/Rvs83MOtzxpyaF/L4uH5n
XInu83ika15gtnNqo8CHK5JjbCBhFkfohVr4m/LYtxyYi/m5gDtsbfOrxAm4E/SM
AplmaSjcGy1hgLJyMkQog8qDhVglQvc+MTMJ9GPZcZkXT2l4oaJmdJntxMY8PACJ
xy6mYIKVrldk0Kad6cixsdNRNFMWO6en0+xSlkGjnE9OStYp0abRcu3ag8GG+ljB
prybSlyEGw3R4IqShm7TfXcUsa6+pSGAG+6vvIDJ4L8aX40oNcuVPIe+dh7jHvRs
NDGkIbmRE3olhQkIzO3IHMZIJvLp+kx9QVlYjjU/P7bxqMrTF7kPyOCqRrN9KD83
OJcbGWd576/VBQjhDiJPCs+g4Wnu9ep1HmTnkXaDWj134nmBTPk5404aR/R7aJuF
4rR/zJyfZzlmw2hjs8Z1/SXWSK6byJSIPU/544bJjerac4B/EOTx9pkG8d1PdXoT
TODwuNBM5RI34Ez5N27R
=wRe1
-----END PGP SIGNATURE-----

--kM4gEFU/49KOGupy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
