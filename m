From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: add devicetree bindings for st-pwm
 regulator
Date: Wed, 17 Sep 2014 11:35:13 -0700
Message-ID: <20140917183513.GS7960@sirena.org.uk>
References: <1410959280-29662-1-git-send-email-zyw@rock-chips.com>
 <1410959280-29662-3-git-send-email-zyw@rock-chips.com>
 <CAD=FV=WCQ4oU1O9JcZ9SuwWJ7g+GLsUiE=wmQQoWvL41o24eWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MhDS85o8hQkNlKhq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WCQ4oU1O9JcZ9SuwWJ7g+GLsUiE=wmQQoWvL41o24eWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--MhDS85o8hQkNlKhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2014 at 11:16:23AM -0700, Doug Anderson wrote:

> I _think_ that the "regulators" subnode and the "pwm-regulator"
> subnode are not needed at all and should be removed.  Other instances
> of devices that are "just" regulators don't have it (like
> fixed-regulator, gpio-regulator, etc).
>=20
> I think your final example should be:

Yes, please.

--MhDS85o8hQkNlKhq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUGdRhAAoJECTWi3JdVIfQOfEH/2hWOhknUcktMz6EOsYsnngU
1Gk3nXDFriOnIUyq0DiIXnyGL9EbUTEAb1PbM1DQilS+W3IjTdXKCO185n+w+BIc
6iZJCdl6jdqR5cPZUfqNA68Whdk8+Zvl2y7PF/I3GgNXZnvxFf1cWAdGUHQyEF14
hPjCEQnxZiwFT62bfp0A7SQfQn6IUyRgAOJWtnD1b7In6Cl6pCoSUyoKjwjmWDZ2
Xtidc1UHUmuCbMGq+MjmGik8oxhsO8G99fBuULcKGk39xZIkoAAII50PbWNlxqku
iNHI+ZbmK6ysZCZ8LvniBzNELHe2c0cRMfjrvOuob7ssehVYJfyUHdSpCHWKhG0=
=WHIV
-----END PGP SIGNATURE-----

--MhDS85o8hQkNlKhq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
