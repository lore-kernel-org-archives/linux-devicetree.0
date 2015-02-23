From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [resend PATCH v3 4/4] usb: phy: add phy-hi6220-usb
Date: Mon, 23 Feb 2015 09:29:18 -0600
Message-ID: <20150223152918.GC32701@saruman.tx.rr.com>
References: <1423559404-13058-1-git-send-email-zhangfei.gao@linaro.org>
 <1423559404-13058-5-git-send-email-zhangfei.gao@linaro.org>
 <20150210144807.GC16711@saruman.tx.rr.com>
 <54DA1B63.5070007@linaro.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54DA1B63.5070007-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2015 at 10:53:23PM +0800, zhangfei wrote:
>=20
>=20
> On 02/10/2015 10:48 PM, Felipe Balbi wrote:
> >On Tue, Feb 10, 2015 at 05:10:04PM +0800, Zhangfei Gao wrote:
> >>Add usb phy controller for hi6220 platform
> >>
> >>Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>---
> >>  drivers/usb/phy/Kconfig          |   9 ++
> >>  drivers/usb/phy/Makefile         |   1 +
> >>  drivers/usb/phy/phy-hi6220-usb.c | 306 ++++++++++++++++++++++++++++++=
+++++++++
> >>  3 files changed, 316 insertions(+)
> >>  create mode 100644 drivers/usb/phy/phy-hi6220-usb.c
> >>
> >>diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> >>index c6d0c8e..405a3d0 100644
> >>--- a/drivers/usb/phy/Kconfig
> >>+++ b/drivers/usb/phy/Kconfig
> >>@@ -173,6 +173,15 @@ config USB_MXS_PHY
> >>
> >>  	  MXS Phy is used by some of the i.MX SoCs, for example imx23/28/6x.
> >>
> >>+config USB_HI6220_PHY
> >>+	tristate "hi6220 USB PHY support"
> >>+	select USB_PHY
> >>+	select MFD_SYSCON
> >>+	help
> >>+	  Enable this to support the HISILICON HI6220 USB PHY.
> >>+
> >>+	  To compile this driver as a module, choose M here.
> >>+
> >>  config USB_RCAR_PHY
> >>  	tristate "Renesas R-Car USB PHY support"
> >>  	depends on USB || USB_GADGET
> >>diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
> >>index 75f2bba..00172d3 100644
> >>--- a/drivers/usb/phy/Makefile
> >>+++ b/drivers/usb/phy/Makefile
> >>@@ -18,6 +18,7 @@ obj-$(CONFIG_SAMSUNG_USBPHY)		+=3D phy-samsung-usb.o
> >>  obj-$(CONFIG_TWL6030_USB)		+=3D phy-twl6030-usb.o
> >>  obj-$(CONFIG_USB_EHCI_TEGRA)		+=3D phy-tegra-usb.o
> >>  obj-$(CONFIG_USB_GPIO_VBUS)		+=3D phy-gpio-vbus-usb.o
> >>+obj-$(CONFIG_USB_HI6220_PHY)		+=3D phy-hi6220-usb.o
> >
> >new drivers only on drivers/phy/, sorry.
> >
> OK, thanks for the info, I don't know this at all.
> So even usb phy should be put under drivers/phy/.
>=20
> Will change that.

yes, thank you

--=20
balbi

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU60dOAAoJEIaOsuA1yqRE3acP/1RmyfBl7ZoTQO7ENYeXFtZq
yiFLFPqxslMcvJfWBIAxs/tmrqFiREF19sUwq47kEf0tYqZ5f4I4Z0hFe1IBEolv
6Wf+K46i9bHQ09l+RdGUAyq7Ivtfmp5jytpUx8dnWZr0wJuGcaHASX2YaCEcQdG9
hNPuD3TKj7sVX+xA8HHxQngbC4TkoqZjMLZ6AvTHMdL4HfNnY6WWeFv0cKXWFnv4
OfCXw/aBYzHPDjZtnFGiOLUdd50wixzMUF9wtVDXjS/PZMcAWkoGNPERxZBfG8Qi
cMVI/nKEcKrrqWIMBfcv8iHRXVP8JErcXNCbqhKLJjlrX33R5gDj/xcVXWJOn0qT
ANMIx/OtTsULpnYs4NKNqzCOhsSM3EaBZh5uHGgNsh3r98JIyX/lnot/4KXqzHh5
1AUgPZPBUkBz4ZqoZKjdc8hwPbHRrt/zGTLNJ0loB1WqeZygY9B/zUFNVLrh2dyx
u45Y3/qvZNKfCrsUC8gYIByKL6/mbQJkJ6OHWhzV8xj4w+PLkYZ+2HmvTHo17YSY
xk8+HmugpVIHpSdFI574K/L+/VhwzwyvWclt2mUxPtpGyrC1TaBph0zZrdoheQZn
v3iKj5yyIk+KbfmsJ1abP1R4aS/M24spqlTRDb5DpuSNVSg2nY0jXSXzQvRvLdZj
LFTMrgUCV5O5O8/OPKW+
=vP+1
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
