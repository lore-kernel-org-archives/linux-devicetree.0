From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/16] FSI device driver introduction
Date: Wed, 7 Dec 2016 02:52:06 +0100
Message-ID: <20161207015206.5ar7exbfs353aram@earth>
References: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mnsomr5zyqmmrk5a"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481069677-53660-1-git-send-email-christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mnsomr5zyqmmrk5a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi.

On Tue, Dec 06, 2016 at 06:14:21PM -0600, Chris Bostic wrote:
> [...]
>
> Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
> driver. FSI is a high fan out serial bus consisting of a clock and a seri=
al
> data line capable of running at speeds up to 166 MHz.
>=20
> [...]

I would expect, that this information is added to Documentation/
and there should be Documentation/ABI/<stable or testing>/sysfs-bus-fsi

P.S.: I'm not sure, why I'm Cc'd.

-- Sebastian

--mnsomr5zyqmmrk5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlhHa0MACgkQ2O7X88g7
+pr8wg/+IATxBcKjVdxaOiz5C2hAZwhLuqaA4T80ReQjYOCog13yNMOrFhezErPy
2+LTxp6JnWk+0xs5z+oWwg3h1T8ItQKI89aDAudzbhTByXmZvryPmIY9FsyIJrNs
R/KtYQDjp8VAbSwdUsxfkeiMUZsqcMylOLM7lY0LOp8d/ja/Qf2z9FrwVEdefU09
IWSps0Ui6q3+cpz+CF8VqPCrTSZB2wg9Ho+crZcWd3poUaQTZjO/cMwzmMxXeXrE
4WnFYMlB5H4ZOd9U13O8oaF/A13Ts9XWKEc1D67jA2wg7ufEiWv21ntCrAUYfcex
0FPNHsXluqRT1OZ/ahD4TGFFbAbAA51X8Je+oKDPNAe8uN0Im2rIG35aHKSdKyzQ
BdREzJLkRp281eU8l86SMUq5eqOWPZ2/DznGSRWhRgq/dAWNjh3srM46fxpJuV1e
kJL4i6EyHblwTahPqPcGEqCvqZHl3+8ADX/fOt4GGnQn6HZWQKomm1m43XzNUcPv
iUsjHipYCwHaRZMjhUHxqwtJMKEk8Kq56qzxqx0K4XUQs4nXZGRTXvaF7j8HvduT
rBzP2bbK3MGVwUEb5apOy5uLw2uaCoxz9Oi6F2/DIsOvIDcu7uHssAplmZ4il/o5
LTI0K8gQfiOkxQLBKyVEP7Rie2zmAmUSa17z+EbNKJTB1UTsZTE=
=VYB+
-----END PGP SIGNATURE-----

--mnsomr5zyqmmrk5a--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
