From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] support control with using GPIO lines
Date: Wed, 27 Apr 2016 14:50:12 +0100
Message-ID: <20160427135012.GP3217@sirena.org.uk>
References: <1460300366-25248-1-git-send-email-akinobu.mita@gmail.com>
 <20160410151237.GD5377@piout.net>
 <1460301781.17404.171.camel@gmail.com>
 <20160410153855.GG5377@piout.net>
 <20160412012518.GQ3351@sirena.org.uk>
 <CAC5umyguFq7vBenkJYM8AWCNJ3oGBKzKAMHHMsO=+OFHtE4b0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2NUUivEUh6/D4/qT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAC5umyguFq7vBenkJYM8AWCNJ3oGBKzKAMHHMsO=+OFHtE4b0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2NUUivEUh6/D4/qT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2016 at 04:53:18AM +0900, Akinobu Mita wrote:

> For the read data transfer, the address/command byte is sent on the
> rising edge of the first eight SCLK cycles and the read data byte is
> transmitted on the falling edge of the next eight SCL cycles.

That's an innovative and exciting hardware design :/  Definitely doesn't
seem to correspond too closely to any SPI mode I can think of.

--2NUUivEUh6/D4/qT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIMOUAAoJECTWi3JdVIfQSdUH/jFLq+UE3JQuAprUW68kzyK6
7apF+0wyC5vc+5HGoJqhHrqqTEFh9bMfMbmEUrsNAz3pj5hV7gDmw8D3QKBE3JAN
ZMHAZFInMZ0v5iOBhU5bAlsmj24krdTjUwSN4+ApQNEAJ/AJSnr514WThUxNiXP0
sUV4fKM06FYWiM4t4pZnvR0ksUgL7aASKdwoQfkLOfi6kGrCtliAjBJhNRk2waxF
/OD+8+DGniJ6RA2Y53DXyKtAt7Fqov9fNtBrqGDc8UlMV/VP9RZSpjGeJAx3L7dB
E7Kq1Zw1oFdCE+sMmPgXVv3lJVobaqsL/SvETgmqKRS8I1bZ7Nt3K2UufDe4hM8=
=2PZU
-----END PGP SIGNATURE-----

--2NUUivEUh6/D4/qT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
