From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [resend PATCH v3 4/4] usb: phy: add phy-hi6220-usb
Date: Tue, 10 Feb 2015 08:48:07 -0600
Message-ID: <20150210144807.GC16711@saruman.tx.rr.com>
References: <1423559404-13058-1-git-send-email-zhangfei.gao@linaro.org>
 <1423559404-13058-5-git-send-email-zhangfei.gao@linaro.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1423559404-13058-5-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2015 at 05:10:04PM +0800, Zhangfei Gao wrote:
> Add usb phy controller for hi6220 platform
>=20
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/usb/phy/Kconfig          |   9 ++
>  drivers/usb/phy/Makefile         |   1 +
>  drivers/usb/phy/phy-hi6220-usb.c | 306 +++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 316 insertions(+)
>  create mode 100644 drivers/usb/phy/phy-hi6220-usb.c
>=20
> diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> index c6d0c8e..405a3d0 100644
> --- a/drivers/usb/phy/Kconfig
> +++ b/drivers/usb/phy/Kconfig
> @@ -173,6 +173,15 @@ config USB_MXS_PHY
> =20
>  	  MXS Phy is used by some of the i.MX SoCs, for example imx23/28/6x.
> =20
> +config USB_HI6220_PHY
> +	tristate "hi6220 USB PHY support"
> +	select USB_PHY
> +	select MFD_SYSCON
> +	help
> +	  Enable this to support the HISILICON HI6220 USB PHY.
> +
> +	  To compile this driver as a module, choose M here.
> +
>  config USB_RCAR_PHY
>  	tristate "Renesas R-Car USB PHY support"
>  	depends on USB || USB_GADGET
> diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
> index 75f2bba..00172d3 100644
> --- a/drivers/usb/phy/Makefile
> +++ b/drivers/usb/phy/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_SAMSUNG_USBPHY)		+=3D phy-samsung-usb.o
>  obj-$(CONFIG_TWL6030_USB)		+=3D phy-twl6030-usb.o
>  obj-$(CONFIG_USB_EHCI_TEGRA)		+=3D phy-tegra-usb.o
>  obj-$(CONFIG_USB_GPIO_VBUS)		+=3D phy-gpio-vbus-usb.o
> +obj-$(CONFIG_USB_HI6220_PHY)		+=3D phy-hi6220-usb.o

new drivers only on drivers/phy/, sorry.

--=20
balbi

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU2honAAoJEIaOsuA1yqRE2/YP/3z2Gotq03+VFCei0IOVKfap
nrx5xsIesVDDAihGbkxgsbtCZ5CNkZ9ZZk2CkwqjSLqBl2OuwhKdRNt2dT+WYqN0
zvluJceOdCBBtpao4VE28WVnVC5oHopgd0DffV2f1SuF6jR9vXLH/wrdxjw2PTqO
mAP5FF3kJV/XJTyNV2wPCxyDG1WI76fHcHa/tTAWqY+B8+aaoIBGIxhOepPaOazX
m2rCYHFqPDNIBmEnqXVzSOUpLZ4kzM6IKiDxlmJtqlN4m190z52w7iNNHeFrrGwc
B90yjEAR4CgpMpIxVHscOxZNTlWNRuNZzfF8OKHor3IX91QQYGdTZl0UzW27nX9k
zgW/WTiSTpffqA5KxUQLsSZEp8d4Eiox9TRchM2VNienqvs4Hi0lyGDTOWiTcJB2
0L43NFmD5WRYh3kR51ZEoonqcOvfbAmqNCmdGnJXoN9IWEig1dmVNJRVm6ciKyMQ
Pt/HbCJY3JTEGtxRaZ4ACIV37xNm/Ky30lMqP0Gh+QpkG45btwQGfYCXdBoCiuEf
2gTQlv0H7YYb+cEYl1WEJ4wzsHoLtn2UEnD4Qd4s6MIqF63DqYd5zvMsvzYSoZvG
Q5mCZrciGhkV9+43QqiBy/iZ/VfE/MzefCscyH9JXtJg3w8EMCo3sYeEuFm2STNs
OvwasvUO01SP5exVHlHK
=9Wcp
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
