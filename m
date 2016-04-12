From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] support control with using GPIO lines
Date: Tue, 12 Apr 2016 02:25:18 +0100
Message-ID: <20160412012518.GQ3351@sirena.org.uk>
References: <1460300366-25248-1-git-send-email-akinobu.mita@gmail.com>
 <20160410151237.GD5377@piout.net>
 <1460301781.17404.171.camel@gmail.com>
 <20160410153855.GG5377@piout.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FcSpk3Icpd/Pbul4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160410153855.GG5377-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--FcSpk3Icpd/Pbul4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 10, 2016 at 05:38:55PM +0200, Alexandre Belloni wrote:
> On 10/04/2016 at 18:23:01 +0300, Sergei Ianovich wrote :

> > No, unfortunately. I've investigated this possibility for my platform.
> > spi-gpio doesn't support LSB-first and 3-wire options. Adding support
> > there is a very big change. The best way to add GPIO support is to
> > create spi-gpio-3wire with LSB-first support.

> Mark, do you have nay opinion on that?

Three wire doesn't seem like it should be invasive, LSB is going to be a
lot more invasive though it seems reasonable to just do the reversal in
the driver for whatever device this is and let the SPI controller run
normally.  Or we could do that in the core with a pass over the data.

--FcSpk3Icpd/Pbul4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXDE59AAoJECTWi3JdVIfQiT4H/jOMfyK1geaFwemu0XwrIyNx
mU081BmWCFGVjCRTCRbFBLfdWSEjznChfYE3UJhf81ZbTW/eSCSQPWF8u6sxS4+W
WcLT4EPrpXFX60I6BYLA4FcLpA9VbxVqKKD4nezykYhEwAQuYKMw04viWcjWukpe
rcC1toWWFAynKCZvsoOJvtYAluL5q9monZH5wkAmaqeeo8QzRJlhndoFAK/q68oA
5QMBAaZPASJqft7X5CBnoSsvqsuT5Q9jU+J7yPGYTdSOd7VeuPtoqxLzLMW2yW0R
HStlcj9N9WrwTDMJzCq56Pqakx4wJ8c9ryqe9L0neBHrCbzPenyGRJNx1yxvlg8=
=xrSK
-----END PGP SIGNATURE-----

--FcSpk3Icpd/Pbul4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
