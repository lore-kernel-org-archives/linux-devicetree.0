From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 02/15] usb: phy-mxs: Add platform judgement code
Date: Thu, 12 Dec 2013 22:19:19 -0600
Message-ID: <20131213041918.GC867@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-3-git-send-email-peter.chen@freescale.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0801035612769898739=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386897825-6130-3-git-send-email-peter.chen@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <peter.chen@freescale.com>
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rob.herring@calxeda.com, balbi@ti.com, kernel@pengutronix.de, grant.likely@linaro.org, shawn.guo@linaro.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0801035612769898739==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline

--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 09:23:32AM +0800, Peter Chen wrote:
> The mxs-phy has several bugs and features at different
> versions, the driver code can get it through of_device_id.data.
>=20
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   58 ++++++++++++++++++++++++++++++++++-=
-----
>  1 files changed, 49 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 545844b..6d49040 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2012-2013 Freescale Semiconductor, Inc.
>   * Copyright (C) 2012 Marek Vasut <marex@denx.de>
>   * on behalf of DENX Software Engineering GmbH
>   *
> @@ -20,6 +20,7 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/of_device.h>
> =20
>  #define DRIVER_NAME "mxs_phy"
> =20
> @@ -34,13 +35,55 @@
>  #define BM_USBPHY_CTRL_ENUTMILEVEL2		BIT(14)
>  #define BM_USBPHY_CTRL_ENHOSTDISCONDETECT	BIT(1)
> =20
> +#define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)

defined, but never used.

--=20
balbi

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqorGAAoJEIaOsuA1yqREX5EQAKy0SSZXQvn1p3NmEHkDe2tU
bp9A/GA6hmu1mtZoJJjErwmRAOY8hPQG3RN5kOEq9r1gqCDmoqMSt0yVDiAQgHLt
c4X5LFuUXWrpenPvxexj/cPVrglwsnM6cT6YYQq5ObHuGdqj9jvoXsPxgc0N5r1y
4Ko4UaNAj8Tol83+EqXOolTLJENVVJHk3grgDOE/JtRSq+VJ+J0WVjEEjJtNIQie
LKKvUqL/Wf7oRpbohPcNuhrpcH7uofyHntXfqBMdwcplPrF22EJwQdzHZT8CDAgX
rjqri2bi3nwLdBhnfWpF6PLTuGgwJcOhOQzZTHQOb6vgaBjn6FlhsFQ2OE/kFIez
EuaJbmOY3jjEHVVN0h9G0i2RD1kZad3JzR53UKonOPHSPQLZK1PSUH3czxdMiuc5
ezEzq3DYd2+4zT/2vlvDE0FcPoaF+8wbDKkX10Fc8ghhOC9fbOSfnOgBA2YLG7AL
kMJLcocye50YvLvXcaULkZVYb3h+M6qQN35RtqfEM+mjIz2l6DMMZKzwTiuFSAN8
W4u7xeO6qfpkZJ8CxJaaUKxX8oz7cIESqk8Fm4uEYt2lKcZeHALIJyp4e7nOFApW
h00A9AhE7289fNIE+33l1lblANvkj0I6al2f9RX/zC91CWpQq01u5vbVDg5EpMfd
lDYRmNto6/3yLZVT9D+L
=we84
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--


--===============0801035612769898739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0801035612769898739==--
