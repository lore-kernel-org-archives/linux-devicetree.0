From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] video: mxsfb: get supply regulator optionally
Date: Tue, 13 Sep 2016 00:47:58 +0100
Message-ID: <20160912234758.GM27946@sirena.org.uk>
References: <20160904042627.30182-1-stefan@agner.ch>
 <f8368040-bb5a-91e0-7511-df462719b949@ti.com>
 <4b3a7bda2202a536efaf4a693234c273@agner.ch>
 <1812b2bf-bd66-3553-4c2d-3d2b08603ca0@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ByWDhVrfOLxO82cA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1812b2bf-bd66-3553-4c2d-3d2b08603ca0-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ByWDhVrfOLxO82cA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 07, 2016 at 10:20:25AM +0300, Tomi Valkeinen wrote:

> I'm fine with the _optional version, that's the easiest cleanup here.
> And, I guess, it could be even argued that it's correct in some cases,
> as the fb output could go outside the board, to some externally powered
> display.

I'd *prefer* to see the supplies being specified, if only for the
encouragement of the others.  But if you want to do the optional thing
anyway...

--ByWDhVrfOLxO82cA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX1z6sAAoJECTWi3JdVIfQPx0H/Rob1teZTAdgg2Rq1R0+QqN8
6jstfiwLPXQd2SOvX1JREjAmt7oDxF0whT+vNgTKBtHETom9ROXqXh7qYPqjWQD9
r6Mi+3da4GQoR5DTacRffbeO0zT9WMHmWmUTJau1jhs6BLxQQq8BspBmN9cz6YoT
JvEd0QoYXlBp8F55VOmT73aIzrFtMm6QviubhChzSh1tdJ02qXEKRC7+0mefHdvd
gYwTXImWNg7QnxcWwGj4Pe5GmMY8R+TdINVF9nUGwPDY0KpjcLxnP6cQZGeOyoFs
4MSq3DsnOqyIMX9JeCbArbhjY32uXWFzRwwzuotH4a/zkVo11Y3IVWeAGku3dZM=
=ZoSB
-----END PGP SIGNATURE-----

--ByWDhVrfOLxO82cA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
