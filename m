From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 08/14] USB: Chipidea: add ci13xxx device id management
Date: Wed, 27 Jun 2012 14:02:57 +0200
Message-ID: <4FEAF671.80508@pengutronix.de>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com> <4FE83AA9.6030507@pengutronix.de> <20120627054231.GA21750@b20223-02.ap.freescale.net> <201206271349.45641.marex@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig6599C67FD9326CF03183DFF8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201206271349.45641.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig6599C67FD9326CF03183DFF8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/27/2012 01:49 PM, Marek Vasut wrote:
> Dear Richard Zhao,
>=20
>> On Mon, Jun 25, 2012 at 12:17:13PM +0200, Marc Kleine-Budde wrote:
>>> On 06/25/2012 12:03 PM, Richard Zhao wrote:
>>>> Could you use my USB test branch?
>>>
>>> Same result:
>>>
>>> ci_hdrc ci_hdrc.0: remove, state 1
>>> usb usb1: USB disconnect, device number 1
>>> ci_hdrc ci_hdrc.0: USB bus 1 deregistered
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>> 0000006c pgd =3D c6ba4000
>>> [0000006c] *pgd=3D46a68831, *pte=3D00000000, *ppte=3D00000000
>>> Internal error: Oops: 17 [#1] PREEMPT ARM
>>> Modules linked in: ci13xxx_imx(-) ci_hdrc imx_usbmisc
>>> CPU: 0    Not tainted  (3.5.0-rc4-00058-g01710ef #85)
>=20
> Dumb question -- you use the same base revision of kernel, right?

Yes, I used v3.5-rc4 as baseline, add some mx28 specific patches (nand,
etc...), then I merged in Richard's use tree. In the above oops, as the
asked, the USB test branch.

In original oops I used
https://github.com/riczhao/kernel-imx/commits/topics/usb-driver

Maybe it's some other part of the system that confuses the ida_* stuff.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig6599C67FD9326CF03183DFF8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/q9nEACgkQjTAFq1RaXHMtjACfUG8Myba1edu3mMj4/iEWKT2j
+OIAn1W3zLNVhUmqWB6klaqQShyRFb5S
=GYiZ
-----END PGP SIGNATURE-----

--------------enig6599C67FD9326CF03183DFF8--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
