From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 00/12] add imx usb driver for mx28/6x
Date: Tue, 5 Jun 2012 18:02:13 +0300
Message-ID: <20120605150209.GZ28631@arwen.pp.htv.fi>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r3RYAYa9cXQlbOHD"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337912665-16615-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--r3RYAYa9cXQlbOHD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 25, 2012 at 10:24:13AM +0800, Richard Zhao wrote:
> The work is based on  ci13xxx rework done by Alexander Shishkin.
>=20
> Status:
>   - this version only support host
>   - usbotg controler works at host role
>=20
> Changes since V2:
>   - Rebase to Alex's tree
>   - Use regulator to control vbus power
>   - Remove ARCH check in Kconfig, but add OF_DEV check.
>   - Other changes according laster version comments.
>=20
> Richard Zhao (12):
>   usb: otg: add notify_connect/notify_disconnect callback
>   usb: chipidea: permit driver bindings pass phy pointer
>   usb: ehci-hcd: notify phy when connect change
>   usb: otg: add basic mxs phy driver support
>   usb: chipidea: add imx platform driver
>   ARM: imx6q: correct device name of usbphy and usb controller clock
>     export
>   ARM: imx6q: add config-on-boot gpios
>   ARM: imx6q: add usbphy clocks
>   ARM: imx6q: disable usb charger detector
>   ARM: dts: imx6q-sabrelite: add usb devices
>   ARM: mxs: clk_register_clkdev mx28 usb clocks
>   ARM: dts: imx28-evk: add usb devices

how are we going to handle these series ? drivers/usb/otg/* parts are
mostly ok (I need to look deeper) but if I take drivers/usb/otg/* we
will have to delay drivers/usb/chipidea I guess...

So someone would have to take the whole series ? Who will be that
person? Alex, will it be you ?

--=20
balbi

--r3RYAYa9cXQlbOHD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPzh9xAAoJEIaOsuA1yqREWwUQAKg4eKZh+xTKeFznIq/c15fE
PTuZ3ceTGQc7Qwx1ib6/XTYrg9SLe0Sa8f3cUdKgy8TIUxk1J9+rwrBwTxh44tzM
6XdMh8yicYGfNwY6+RtCRwPLr38dEKD37uF/qmBtR0GOA3hxw7/2QYFem5hhtp5i
8Za0QDfii6y7/+um9hzcwZaZbzV2x4Es6/o7v5UePaJXvF7NXJNs4esrAUuIJd+l
aT49q6qFNITYFSCaL/iKU7C0o22DcMOStSDeNTKO0t5arQJKjIClmZHPl4CHv/SE
c/UVWN5SoTLtJq+w4oKd7NCGBR47WNBbyf8uMQn3jCwp1vC7jcSsNKTe/x6Ei8VH
ME2+REE2WTSpsEFBb4kKRagVs/ND2MvU0IGg7Bg/MEwo41d4vMDeuseiez/Sg+/N
uYMYZtBa6QEZQ45Y++4XW0h2wqQMwmkTQURo3kF0vcAxo9mOb4SUcLr2SG9csnCB
OXY+TZJhmZselQQnHHn+93ne7OZSkEkwpO1O4Km7CHeVU0TxRC9Tp/yfjPoJhAkI
OhWmV0+f9etm1oGcupnukpvhmIM9XZpOXYztY8x2bxvslHtdWTiqRe/MttNHNV3n
f/mVPpB8c8npVDdr1eaFHvA0LwVs6HAEyUAjIZzvw8sOCJsGVnVWEovD9STcSzgB
915oEhWLYSMYnHA10IG5
=nCgt
-----END PGP SIGNATURE-----

--r3RYAYa9cXQlbOHD--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
