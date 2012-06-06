From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 02/12] usb: chipidea: permit driver bindings pass phy
 pointer
Date: Wed, 6 Jun 2012 11:50:22 +0300
Message-ID: <20120606085020.GB15368@arwen.pp.htv.fi>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
 <1337912665-16615-3-git-send-email-richard.zhao@freescale.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337912665-16615-3-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2012 at 10:24:15AM +0800, Richard Zhao wrote:
> Sometimes, the driver bindings may know what phy they use.
> For example, when using device tree, the usb controller may have a
> phandler pointing to usb phy.
>=20
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

> ---
>  drivers/usb/chipidea/ci.h    |    2 ++
>  drivers/usb/chipidea/core.c  |    4 ++++
>  drivers/usb/chipidea/host.c  |    1 +
>  drivers/usb/chipidea/udc.c   |   11 +++++++----
>  include/linux/usb/chipidea.h |    3 +++
>  5 files changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 9655e35..d738603 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -160,6 +160,8 @@ struct ci13xxx {
> =20
>  	struct ci13xxx_platform_data	*platdata;
>  	int				vbus_active;
> +	/* FIXME: some day, we'll not use global phy */
> +	bool				global_phy;
>  	struct usb_phy			*transceiver;
>  	struct usb_hcd			*hcd;
>  };
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index c14ce2b..21407e7 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -419,6 +419,10 @@ static int __devinit ci_hdrc_probe(struct platform_d=
evice *pdev)
> =20
>  	ci->dev =3D dev;
>  	ci->platdata =3D dev->platform_data;
> +	if (ci->platdata->phy)
> +		ci->transceiver =3D ci->platdata->phy;
> +	else
> +		ci->global_phy =3D true;
> =20
>  	ret =3D hw_device_init(ci, base);
>  	if (ret < 0) {
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index 4a4fdb8..4479f5a 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -121,6 +121,7 @@ static int host_start(struct ci13xxx *ci)
>  	ehci =3D hcd_to_ehci(hcd);
>  	ehci->caps =3D ci->hw_bank.cap;
>  	ehci->has_hostpc =3D ci->hw_bank.lpm;
> +	ehci->transceiver =3D ci->transceiver;
> =20
>  	ret =3D usb_add_hcd(hcd, 0, 0);
>  	if (ret)
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index ca9b387..b43b29c 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1684,7 +1684,8 @@ static int udc_start(struct ci13xxx *ci)
> =20
>  	ci->gadget.ep0 =3D &ci->ep0in->ep;
> =20
> -	ci->transceiver =3D usb_get_transceiver();
> +	if (ci->global_phy) {
> +		ci->transceiver =3D usb_get_transceiver();
> =20
>  	if (ci->platdata->flags & CI13XXX_REQUIRE_TRANSCEIVER) {
>  		if (ci->transceiver =3D=3D NULL) {
> @@ -1728,7 +1729,8 @@ static int udc_start(struct ci13xxx *ci)
>  remove_trans:
>  	if (ci->transceiver) {
>  		otg_set_peripheral(ci->transceiver->otg, &ci->gadget);
> -		usb_put_transceiver(ci->transceiver);
> +		if (ci->global_phy)
> +			usb_put_transceiver(ci->transceiver);
>  	}
> =20
>  	dev_err(dev, "error =3D %i\n", retval);
> @@ -1737,7 +1739,7 @@ remove_dbg:
>  unreg_device:
>  	device_unregister(&ci->gadget.dev);
>  put_transceiver:
> -	if (ci->transceiver)
> +	if (ci->transceiver && ci->global_phy)
>  		usb_put_transceiver(ci->transceiver);
>  free_pools:
>  	dma_pool_destroy(ci->td_pool);
> @@ -1771,7 +1773,8 @@ static void udc_stop(struct ci13xxx *ci)
> =20
>  	if (ci->transceiver) {
>  		otg_set_peripheral(ci->transceiver->otg, NULL);
> -		usb_put_transceiver(ci->transceiver);
> +		if (ci->global_phy)
> +			usb_put_transceiver(ci->transceiver);
>  	}
>  	dbg_remove_files(&ci->gadget.dev);
>  	device_unregister(&ci->gadget.dev);
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index be078f0..544825d 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -5,12 +5,15 @@
>  #ifndef __LINUX_USB_CHIPIDEA_H
>  #define __LINUX_USB_CHIPIDEA_H
> =20
> +#include <linux/usb/otg.h>
> +
>  struct ci13xxx;
>  struct ci13xxx_platform_data {
>  	const char	*name;
>  	/* offset of the capability registers */
>  	uintptr_t	 capoffset;
>  	unsigned	 power_budget;
> +	struct usb_phy	*phy;
>  	unsigned long	 flags;
>  #define CI13XXX_REGS_SHARED		BIT(0)
>  #define CI13XXX_REQUIRE_TRANSCEIVER	BIT(1)
> --=20
> 1.7.5.4
>=20
>=20

--=20
balbi

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPzxnMAAoJEIaOsuA1yqREnPAP/jLAt+bxqNhuXrXR1FkaILIC
RDM5yp7AuSiLlyiYYUmJK9oMIIahkYspZ3p8dCcKzHE3q4noJUGC/H+lMDQyVrIQ
O9xI7R5yUIirAhndQeZlnJQxCVfr+kLfo6nXyoMeFm+U1OHPmtUvIEicIwqS4o63
BPlW0Z4bk/hfTRnkv0dTiDrr8IOEJ/14FYk12cq4SNBtep8khqwhypPi+l+eNH1M
9IQYF8CuVltoH2DmCdbIpv3T00QFIPlvoMc8Y5mpMCS3NF7M0TEIJChBO0n6odQW
9KVK1SY433dpnyQdFyL8Cht3O/ZfaCxTjUCgZi4oRGhG/AiUwPinduOhj6jZ/Zr7
Buzy5L0+R+9aZxDGbAPbSg2acfCbw8lEQ3FFT8sSw6uS1+iJq6HF0Gcxib1sY7f5
qG/XS0L54M2rFUMPatjxCtrTN4s0IHSumrV600lAAnMeaW7Fb7+jlUIgSb28ikOi
6cIquzj6ELihrbiNweF+5+3R1EeEUuXQf46+FPAYGrmnD+t1kyoEDUF3ZACR+Lz+
8vFm7HPdndce38rTWCD8QlAEkvGH2vW41b4Gnu/xwKM1pIlGlLpPn5adMXEW9A4c
KlAxKdQHzob/ZJyPyO0n9iCJcDHmxRhBU3658fbnIOlOPF1RtXg4dRiT68w4p0uy
4FlOQ+2+YbjjVbj6nhAD
=pWoV
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
