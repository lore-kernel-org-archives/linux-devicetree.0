From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/12] usb: chipidea: add imx driver binding
Date: Tue, 22 May 2012 13:06:26 +0300
Message-ID: <20120522100624.GP30559@arwen.pp.htv.fi>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-6-git-send-email-richard.zhao@freescale.com>
 <201205220630.57007.marex@denx.de>
 <20120522045120.GL6206@b20223-02.ap.freescale.net>
 <87fwasbkt7.fsf@ashishki-desk.ger.corp.intel.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZMy3ZKywLyoHonN"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87fwasbkt7.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7ZMy3ZKywLyoHonN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 22, 2012 at 12:56:52PM +0300, Alexander Shishkin wrote:
> > Do you think it's a good idea to let user select binding driver directly
> > and the binding driver config depends on chipidea config?
>=20
> I don't have a strong opinion on this, although I prefer it the way it
> is now, because, imo:
>=20
>   * in case of =3Dm (and that's the only sane way of compiling it anyway),
>     these all are compiled as modules, which you simply don't install if
>     you don't want them;
>   * all of them get compile-tested every time you change something in
>     the driver, which is a good thing;

only true for $(ARCH) builds. I would like to see these drivers being
compile tested on linux-next on all arches. Thus the patches I just
sent.

--=20
balbi

--7ZMy3ZKywLyoHonN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPu2UgAAoJEIaOsuA1yqREf04P+wY/ROqZpcPNvddMXU5WreIc
yh1t0SdNf2Dg9vBklXeInkanq0QSFUh0S+Ct4ciX2K3sR5Wd/HNkvcijYJGAq1DX
4CgeDUwGGotrfySuS7shJp7mfc0MW5eBmeUqpLwNp5vXfmuvd4Dui3iLj1Qs6csg
tV4hsoTOfYoODIkNe/1XPAxua9Q49dG6oUpoqYhtZV4GNwb10Z1Snx1xUj4N6ntK
qReQDzxKJ6S6u3ZDzOlnaPLwTWjvfrhcczwDA58iGibBlzg2uQKtcveqm0SJGh/2
GMVouY2l4OPOdVxx9iwdZ0MtMsdYK774NphytgzIf8FdX8JcU+q+XmbN5GfoJULR
E6hjbRGMlEOTGMCu4gb4TbeoWKZl+sihJDNkBEafFU4z06KecToDQ94M+QjpDbwD
TCfrszs/gLpCvlrBvYK8n/oUsywvgti/dUGkpzBK8AEQaF003mVomTXks8kHUkyW
glNLwdxOgGN5YuNV9aJSepu6bDNIS785wsRm3roe4xtDKVbJbVC2zo8ybg4PpSN0
9CVRXwbKOWuJU2SEgbvHBw52TD+bWWKzhIgWuQRZXo+KHLSsVW8PNWGwxeuHNiq9
HunyRdkTwLCh/dgAk9GaCcYUyLW0b6EnzGO4x7mlf4Ia3zlf0dAyuY67tqBm/dc+
rFxqm7uhNmpvYd+a0XGE
=MM2v
-----END PGP SIGNATURE-----

--7ZMy3ZKywLyoHonN--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
