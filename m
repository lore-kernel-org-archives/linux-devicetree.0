From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH v3 1/2] dt-bindings: add hym8563 binding
Date: Mon, 2 Dec 2013 13:41:10 +0000
Message-ID: <20131202134110.GH27568@sirena.org.uk>
References: <201312012047.02299.heiko@sntech.de>
 <201312012047.42669.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cjNfFEtZoUGcCUIb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201312012047.42669.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cjNfFEtZoUGcCUIb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2013 at 08:47:42PM +0100, Heiko St=FCbner wrote:

> +Required properties:
> +- compatible: should be: "haoyu,hym8563"
> +- reg: i2c address
> +- gpios: alarm interrupt gpio

Why is this specified as a GPIO and not as an interrupt?

--cjNfFEtZoUGcCUIb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnI3zAAoJELSic+t+oim9mJMP/jV7/3NN0h1XZsWJouY0MDpn
yR0rv4J1AirhVArU4fDUJiDHVBIRyTIQCB5kWYq/0ztjrIFFj3IaCLXI52v8EYv1
BVuW+YPvmjFD+HRRslOkT4YfiBEFEd8qi6VFzjSKgNNHCXzzaaZTapx0YWXmNcBc
RN4kBWbBKo5/GHjH25YxnhphF38k6k0fPIFhnUGthpywgFCPPbjpBE7SVcxDlzqD
2buqRrSkh0q8jr1FrAGRda7MEpTn4rL5tAxQANP1GyCUpXOIyAVR5w+ExWNjK1/Q
wsasWShU3QfVp2w+FDw4ETO/6KPaM2qtknStvH4wTkH7zQHIyHzhc3+i2gqWKk6M
pcFyFIroLB6ZLy0yBK33B4F9Df7r20Aj0P6LEHYQn01RJ7BcgEAR3CEusezXwWL5
CpDT0KbSgfzuesYqfVKyEr7wABKWXR4ijc0fuvXC9VLEhpCEN9YcgMpxCrRq90yn
+RjIIwAdagmFwi3X3EVFIdZTD729l9dnFpo7epjyE4fuBnEFmeBGey3VVhDEmn6d
LzuzfRMq1jNJQBnJ8jVjSiseONgcBYNMX3tT6qi1Z5vmiawtoUu10UIru87Qtx0d
VBtb/u9+YVblsnCdbIB/oEGSE5snTHbgW5b6yNDOJljil9InetBov8XQ1LawwlqY
j7b3RCD9HTjFC4utsPW3
=6n80
-----END PGP SIGNATURE-----

--cjNfFEtZoUGcCUIb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
