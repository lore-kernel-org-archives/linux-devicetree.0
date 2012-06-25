From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 14/14] usb: chipidea: add imx platform driver
Date: Mon, 25 Jun 2012 12:33:58 +0200
Message-ID: <4FE83E96.5090004@pengutronix.de>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com> <1340607391-16380-15-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig09E2B38467243D29C3EA0C54"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340607391-16380-15-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig09E2B38467243D29C3EA0C54
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/25/2012 08:56 AM, Richard Zhao wrote:
> This patch supports only the host-mode functionality so far.
>=20
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ci13xxx-imx.txt        |   20 ++
>  drivers/usb/chipidea/Makefile                      |    3 +
>  drivers/usb/chipidea/ci13xxx_imx.c                 |  197 ++++++++++++=
++++++++
>  3 files changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.t=
xt
>  create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Do=
cumentation/devicetree/bindings/usb/ci13xxx-imx.txt
> new file mode 100644
> index 0000000..8bcd071
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> @@ -0,0 +1,20 @@
> +* Freescale i.MX ci13xxx usb controllers
> +
> +Required properties:
> +- compatible: Should be "fsl,imx27-usb"
> +- reg: Should contain registers location and length
> +- interrupts: Should contain controller interrupt
> +
> +Optional properties:
> +- fsl,usbphy: phandler of usb phy that connects to the only one port

> +- fsl,hub-reset-gpios: gpio used to reset on-board usb hub
> +- fsl,vbus-power-gpios: gpio used to set vbus power of the only one po=
rt

These two properties are not implemented, are they?
vbus is handled via a fixed regulator.

Further I'm looking into the phy and otg implementation. I think the
handling of the regulator should go into mxs-phy.c, not into the
ci13xxx_imx.c

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |




--------------enig09E2B38467243D29C3EA0C54
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/oPpYACgkQjTAFq1RaXHMsZACffrxd9/bVeD/69xzQmULyKC4M
bhAAn2l/N6uRYlSpPWfJJcmDae0rfSmv
=oCv8
-----END PGP SIGNATURE-----

--------------enig09E2B38467243D29C3EA0C54--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
