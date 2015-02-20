From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 4/4] phy: add phy-hi6220-usb
Date: Thu, 19 Feb 2015 22:38:05 -0600
Message-ID: <20150220043805.GA22128@saruman.tx.rr.com>
References: <1423726646-30336-1-git-send-email-zhangfei.gao@linaro.org>
 <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org>
 <54E4249C.9050404@ti.com>
 <54E426B5.4070206@linaro.org>
 <20150218143546.GD3651@saruman.tx.rr.com>
 <54E6A4E9.4030401@linaro.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54E6A4E9.4030401-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2015 at 11:07:21AM +0800, zhangfei wrote:
> Hi, Balbi
>=20
> On 02/18/2015 10:35 PM, Felipe Balbi wrote:
> >On Wed, Feb 18, 2015 at 01:44:21PM +0800, zhangfei wrote:
> >>Hi, Kishon
> >>
> >>On 02/18/2015 01:35 PM, Kishon Vijay Abraham I wrote:
> >>>Hi,
> >>>
> >>>On Thursday 12 February 2015 01:07 PM, Zhangfei Gao wrote:
> >>>>Add usb phy controller for hi6220 platform
> >>>>
> >>>>Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>>>---
> >>>>  drivers/phy/Kconfig          |   9 ++
> >>>>  drivers/phy/Makefile         |   1 +
> >>>>  drivers/phy/phy-hi6220-usb.c | 306
> >>>>+++++++++++++++++++++++++++++++++++++++++++
> >>>>  3 files changed, 316 insertions(+)
> >>>>  create mode 100644 drivers/phy/phy-hi6220-usb.c
> >>>
> >>>why is this driver in drivers/phy when it doesn't use the generic PHY
> >>>framework at all?
> >>>
> >>
> >>Balbi recommended "new drivers only on drivers/phy/", including usb
> >>phy.
> >
> >but it should use the API too. It's not only about a directory, you need
> >to use the new API.
> >
> >>So Move drivers/usb/phy/phy-hi6220-usb.c to
> >>drivers/phy/phy-hi6220-usb.c, required by Balbi.
> >
> >you're reading what I stated the way you like.
>=20
> Sorry for my bad understanding.
>=20
> Still not clear about the otg_set_peripheral, which is required in
> phy-hi6220-usb.c
>=20
> 1. drivers/usb/dwc2/gadget.c use
> otg_set_peripheral(hsotg->uphy->otg, &hsotg->gadget);
>=20
> 2. include/linux/phy/phy.h
> struct phy do not have member otg, while struct usb_phy has.
>=20
> Could you give more hints?

your set_peripheral doesn't do anything, just holds a pointer. Might as
well not implement it. I'll review your driver more fully tomorrow.

There a few things which must be changed.

--=20
balbi

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU5rotAAoJEIaOsuA1yqREYOcQAJael/tbL9dYQp4QvdMxvYLp
M0OWQ95ZXukmFxS3+AROR7sYyWT9OUpsc8jjOuhkp8bUtQ9uz3tA01RnxVpX9yMI
Us9PgV/yvyiDzWQqS6qsCdRx3vijy9xzNxgiZoT8WOXr9F6H1CurGjTkkhEXvpZR
wkuFsc4XVQKoSKHGKh06JFLmMfXjq6TCJs97c71i5hVMFk+3G0LZsoQ7ARjTtzdp
KPLjNnhYyHlbDN0HAeIUEV7XIZxHy18Xjw4wUEbzErTMykoqs7ci7DHbp7x3oJQX
psGxN4lMen9lDVrbDPKnDY84gBhXqw0WrIE88ib3qhnug8wMeEbGRigw5C7GkHnN
5dge4hXzveILq2yGfZfouoVQnyQ6eIHKnVSjNfCiJSRzQsUgUP/Bd0EPlsiKGBm5
Qg0IkCMwBtHzJj73pq/kBITgodUHwPkTPcr8kQ4uMVPmspz51EjjZZ83y8mnnsHD
A7uWxziECeN6EFJDI4mwM0tPNUzEblns7v7Y/VYo4UKPY8QEYumcpei0h9zWgt1T
MiY60+bR7PM1q4Ag2j+OsXK6E1tzECpz48k23vIEDYBxeIKR4bEkCFbYTsmtRL43
wem8whBKr9W241dB/McPqcZjzvJUTL+Fd6ONfJszdECQdx6Ygu0XSJtS2T+QL49R
Kb/2i2r/01tPnXoB5WAh
=rI2r
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
