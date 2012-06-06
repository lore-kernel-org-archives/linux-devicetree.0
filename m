From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 00/12] add imx usb driver for mx28/6x
Date: Wed, 6 Jun 2012 09:03:50 +0300
Message-ID: <20120606060348.GD32345@arwen.pp.htv.fi>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
 <20120605150209.GZ28631@arwen.pp.htv.fi>
 <20120606022714.GA2667@S2101-09.ap.freescale.net>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120606022714.GA2667-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2012 at 10:27:22AM +0800, Shawn Guo wrote:
> On Tue, Jun 05, 2012 at 06:02:13PM +0300, Felipe Balbi wrote:
> > Hi,
> >=20
> > On Fri, May 25, 2012 at 10:24:13AM +0800, Richard Zhao wrote:
> > > The work is based on  ci13xxx rework done by Alexander Shishkin.
> > >=20
> > > Status:
> > >   - this version only support host
> > >   - usbotg controler works at host role
> > >=20
> > > Changes since V2:
> > >   - Rebase to Alex's tree
> > >   - Use regulator to control vbus power
> > >   - Remove ARCH check in Kconfig, but add OF_DEV check.
> > >   - Other changes according laster version comments.
> > >=20
> > > Richard Zhao (12):
> > >   usb: otg: add notify_connect/notify_disconnect callback
> > >   usb: chipidea: permit driver bindings pass phy pointer
> > >   usb: ehci-hcd: notify phy when connect change
> > >   usb: otg: add basic mxs phy driver support
> > >   usb: chipidea: add imx platform driver
> > >   ARM: imx6q: correct device name of usbphy and usb controller clock
> > >     export
> > >   ARM: imx6q: add config-on-boot gpios
> > >   ARM: imx6q: add usbphy clocks
> > >   ARM: imx6q: disable usb charger detector
> > >   ARM: dts: imx6q-sabrelite: add usb devices
> > >   ARM: mxs: clk_register_clkdev mx28 usb clocks
> > >   ARM: dts: imx28-evk: add usb devices
> >=20
> > how are we going to handle these series ? drivers/usb/otg/* parts are
> > mostly ok (I need to look deeper) but if I take drivers/usb/otg/* we
> > will have to delay drivers/usb/chipidea I guess...
> >=20
> > So someone would have to take the whole series ? Who will be that
> > person? Alex, will it be you ?
> >=20
> I'm unsure about drivers/usb part, but arch/arm part should go via
> arm-soc tree.

Yes, sure but the whole series is very "coupled" together... Maybe
Richard could try to split this series into things that can go through
arm-soc with no dependency on the other part and things that depend on
drivers/usb/*

Richard, can you do that ?

--=20
balbi

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPzvLEAAoJEIaOsuA1yqREvmoP/0K3sEjLEvZ7DWo1gGbAqQ82
8iErdWfwUx5ymGwZhuYeCJuQeo4Ob3LEAXQUU4lhnxD4Hpyy7DIdqL32QgCE68xJ
TrXitVuTPFyD2FKrQFtJmQEtUuK4qCVSKVCGndWdhf7Hpm7O13hI8R80ecM1xmT9
3kz0mbfCxrQ81XcaTdRx3n0Sdw4ZPTIxdQaEC+UtAH16LFeAPqe5GyYq1RU4V620
eHT0Kxgrs6oKDxQZQQXwx8ldLNSLLJ4fjqqAOa0SuxSr0+7Xf0bZErd9ldrH13BK
vuHUYW466dydbBHVWKoNXvlcc+ZlIsuVr31J3LYGrEJGQ6lIDgxti23Zd3ufIEDW
y0/GFbL5k6K0caLl691YUjpGWnvHJG+TNbV9vLgF/gHe3uQvP0omywxA9wi3axcm
xylyLuFiwThPZCpSPYEDMYgEFexH0vchUws5mYDsSFP5UjCGrGz4kQTkiMRwR+FK
atbDiId1+gSnex06t+8DDqb4+C6KKO3wmITpCeicXTqiVPzphMBZj5jdV40I2l6G
+J2obkUOa6wyC67p8PRiL7jlUxnzCxJeZHvO17F+qijPHIlt8v6GE+FGqSLFF7KC
ZvtZF6uwILo27wVooAK9XjV/hRaanAs+0Lki10MZg2tdxbIYbTwY2I21oSqkWhJl
BNmsdRq5drqywlzqOq2S
=vdnj
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
