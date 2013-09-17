From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Tue, 17 Sep 2013 11:51:42 +0100
Message-ID: <20130917105142.GO21013@sirena.org.uk>
References: <1378999322.4210.95.camel@i7.infradead.org>
 <20130913041208.GD3051@gmail.com>
 <20130912205644.GW29403@sirena.org.uk>
 <52329AD3.2050608@freescale.com>
 <20130913102127.GD29403@sirena.org.uk>
 <52366F97.5030402@freescale.com>
 <20130916101912.GY29403@sirena.org.uk>
 <5236DD17.5090203@freescale.com>
 <20130916110634.GC29403@sirena.org.uk>
 <5237BB01.3080700@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ugCSa1rMkiCAmd9S"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5237BB01.3080700-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>, "thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org" <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ugCSa1rMkiCAmd9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2013 at 10:14:25AM +0800, Huang Shijie wrote:

> The dummy is just a delay in a command sequence.
> The dummy maybe only several clock cycles, less then 8 bit.

This is what the delay_usecs field in the spi_transfer struct is for,
the flash code should be using that to ensure that the minimum delay
requirement is met.

--ugCSa1rMkiCAmd9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSODQ7AAoJELSic+t+oim9GmgP/210toLwtzpyb8/xaQRfHD+t
qNl9Aq74IbXzOWhZtKencQnETIIMIoXnaoQ+QMmXBqxrVUZo1dOW3YLSiQmj1f+C
r/sr3jgVPhfC2O5chk22xWEDFm+46xlJOeXbeHRVt4j29ljjsPpydiPVpEa4t6fI
epCKpd6rqfh3q+wzjKss02etd7ELbYM21Lb/vXMaCNiIrGlOF2rm4F/sDoJuH+Mf
9BALxvs+XUZ6PDU3leDAvDWHuKqirHHJwmCm7Ejti/wqq25Xk8eGQRVHY22k3QfA
K7q4xPLjmIsW6tkOEPv8Iw7akMSw1HaVhA9eKpvw2PMKAjnEeTBPkdsenXHJyTKs
7bXpXJj/jJU36Fgbew42pihkvTy1WB2B/YOMOOFy3dIhbZR4IYNLBmSQfeAp6sTo
qxEVhI4kCYB37V1c0UejRFrqaEM6dmrFGjir5fLAR4S/Y68OJPY32l+oN4SqpkMv
bbnm/Xsr7B5mB2llYMsSCOoJkDLqojS2V69d63wxj21WtGRopy7xudjNAEBFDAUe
MC+6iw2uJwY+X424mDar4wAIcHYKcM6XAeSyB00ITRjBoaDHKc7dx2+GWCT1rAMJ
kl/b3aOhOLZd5mndxCtNMQMvX/jfkgrNT/f4p5yf4M4bGZw9tkgTWphXnGb2Buuj
uByzUplWsZifTHtxlg2Y
=KVyf
-----END PGP SIGNATURE-----

--ugCSa1rMkiCAmd9S--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
