From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [resend PATCH v3 4/4] usb: phy: add phy-hi6220-usb
Date: Mon, 23 Feb 2015 09:29:48 -0600
Message-ID: <20150223152948.GD32701@saruman.tx.rr.com>
References: <1423559404-13058-1-git-send-email-zhangfei.gao@linaro.org>
 <1423559404-13058-5-git-send-email-zhangfei.gao@linaro.org>
 <20150210144807.GC16711@saruman.tx.rr.com>
 <BN3PR0301MB0849FB28B1DAF7BEB5F3BE7881250@BN3PR0301MB0849.namprd03.prod.outlook.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BN3PR0301MB0849FB28B1DAF7BEB5F3BE7881250-CEkquS/Gb83prP92dyGgc5wN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2015 at 01:30:53AM +0000, Peter Chen wrote:
> =20
> > > Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  drivers/usb/phy/Kconfig          |   9 ++
> > >  drivers/usb/phy/Makefile         |   1 +
> > >  drivers/usb/phy/phy-hi6220-usb.c | 306
> > > +++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 316 insertions(+)
> > >  create mode 100644 drivers/usb/phy/phy-hi6220-usb.c
> > >
> > > diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig index
> > > c6d0c8e..405a3d0 100644
> > > --- a/drivers/usb/phy/Kconfig
> > > +++ b/drivers/usb/phy/Kconfig
> > > @@ -173,6 +173,15 @@ config USB_MXS_PHY
> > >
> > >  	  MXS Phy is used by some of the i.MX SoCs, for example imx23/28/6x.
> > >
> > > +config USB_HI6220_PHY
> > > +	tristate "hi6220 USB PHY support"
> > > +	select USB_PHY
> > > +	select MFD_SYSCON
> > > +	help
> > > +	  Enable this to support the HISILICON HI6220 USB PHY.
> > > +
> > > +	  To compile this driver as a module, choose M here.
> > > +
> > >  config USB_RCAR_PHY
> > >  	tristate "Renesas R-Car USB PHY support"
> > >  	depends on USB || USB_GADGET
> > > diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile index
> > > 75f2bba..00172d3 100644
> > > --- a/drivers/usb/phy/Makefile
> > > +++ b/drivers/usb/phy/Makefile
> > > @@ -18,6 +18,7 @@ obj-$(CONFIG_SAMSUNG_USBPHY)		+=3D phy-
> > samsung-usb.o
> > >  obj-$(CONFIG_TWL6030_USB)		+=3D phy-twl6030-usb.o
> > >  obj-$(CONFIG_USB_EHCI_TEGRA)		+=3D phy-tegra-usb.o
> > >  obj-$(CONFIG_USB_GPIO_VBUS)		+=3D phy-gpio-vbus-usb.o
> > > +obj-$(CONFIG_USB_HI6220_PHY)		+=3D phy-hi6220-usb.o
> >=20
> > new drivers only on drivers/phy/, sorry.
> >=20
>=20
> This driver has many USB dependencies, like otg, gadget. I don't know it
> can use generic phy currently.

then we improve generic phy framework. It's about time we moved
everything to that anyway.

--=20
balbi

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU60dsAAoJEIaOsuA1yqRESFcP/idQZ/qkeD4s69cIW/hio+yM
CUzsJch4sch72GaRJiaxJE5fnWVv+tnO3lrSvZYQfzMHoTRGJxkXggEkMVWyjVne
pOOOBj+UbyP8YWx9wHAiWXAwoR2ZN1LR08unNSSAQ5SZSwWI5chkGpgBtYv0vIzE
zXuzS/LfvMkqGBoQS4iT/WHEj8hO4azxGfTgUS8B9x62DA7juZ45tZZBt5bkVAPp
cPq0R/0vKMeFb6r5/yI0MliOVQgdELRhtjQ1qtbEi253Pkyb66U/laUsLoRErIzV
sjk2Ku4jyWBGCjW4yUauKnd/MftiJv5Qqi6cm6/niTSiztYTNrwqkpY29zCaFksy
88iUy4RBWxFkjt7S+AThyWdo2L2PGAK656uASx25H/8Dn+cMOOKnAkufPvs0XYkT
jdyxdfM6T+x4kLzBhv/kIVQBffMLSk2tLmfBivf3w29vgqW1YiQfpk+/GeQkTJUb
gqzU2fjyZ7zcw2ZrdET2rzpmSVlyCk4ww3KiZ+KDm3/HOwdUnGwoHbqMz8zKZc6n
G/lcwN0deXTaRk+H43RREVQVfjbFRwzTlGRvYPqE52XwBm7ywW8hpWX3hf+Id8rr
nPWYep5lL4OLC+CIfTmXuWq01UwB7/MUTEHVucwO4y4Tt0X73JmRw+nBEZbIQhk7
PBqm3qG/c007WPGsf646
=LZPc
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
