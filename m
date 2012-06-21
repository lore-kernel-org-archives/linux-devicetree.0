From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v6 12/14] usb: chipidea: permit driver bindings pass phy
 pointer
Date: Thu, 21 Jun 2012 09:18:22 +0200
Message-ID: <4FE2CABE.7050708@pengutronix.de>
References: <1340260875-21934-1-git-send-email-richard.zhao@freescale.com> <1340260875-21934-13-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig620D4F554A9D585D040C566E"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340260875-21934-13-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig620D4F554A9D585D040C566E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/21/2012 08:41 AM, Richard Zhao wrote:
> Sometimes, the driver bindings may know what phy they use.
> For example, when using device tree, the usb controller may have a
> phandler pointing to usb phy.
>=20
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>

[...]

> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1684,7 +1684,8 @@ static int udc_start(struct ci13xxx *ci)
> =20
>  	ci->gadget.ep0 =3D &ci->ep0in->ep;
> =20
> -	ci->transceiver =3D usb_get_transceiver();
> +	if (ci->global_phy) {
                           ^^^

This doesn't compile, closing curly brackets are missing.

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
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.=
h
> index be078f0..544825d 100644

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig620D4F554A9D585D040C566E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/iyr4ACgkQjTAFq1RaXHPG1QCfU6cxyLIIcQ5+oa6PkaopsASr
3x0An3f23G+yU84h6E1OHNcFl005U2J8
=C2hz
-----END PGP SIGNATURE-----

--------------enig620D4F554A9D585D040C566E--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
