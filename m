From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/3] spi: mpc52xx_psc_spi: fix section mismatch warning
Date: Thu, 16 Dec 2010 10:23:40 -0700
Message-ID: <AANLkTi=hKvEDd7+e9hoFxF-VP-Fy648OEX7ha1gBLkKz@mail.gmail.com>
References: <1292519639-21859-1-git-send-email-w.sang@pengutronix.de> <1292519639-21859-3-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1292519639-21859-3-git-send-email-w.sang@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: devicetree-discuss@ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 16, 2010 at 10:13 AM, Wolfram Sang <w.sang@pengutronix.de> =
wrote:
> Done by using of_probe_platform_driver() instead of
> of_register_platform_driver().
>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Move the probe hook to the __devinit section instead.

g.

> ---
> =A0drivers/spi/mpc52xx_psc_spi.c | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/spi/mpc52xx_psc_spi.c b/drivers/spi/mpc52xx_psc_=
spi.c
> index 983fbbf..4bf6d37 100644
> --- a/drivers/spi/mpc52xx_psc_spi.c
> +++ b/drivers/spi/mpc52xx_psc_spi.c
> @@ -509,7 +509,6 @@ static const struct of_device_id mpc52xx_psc_spi_=
of_match[] =3D {
> =A0MODULE_DEVICE_TABLE(of, mpc52xx_psc_spi_of_match);
>
> =A0static struct of_platform_driver mpc52xx_psc_spi_of_driver =3D {
> - =A0 =A0 =A0 .probe =3D mpc52xx_psc_spi_of_probe,
> =A0 =A0 =A0 =A0.remove =3D __exit_p(mpc52xx_psc_spi_of_remove),
> =A0 =A0 =A0 =A0.driver =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D "mpc52xx-psc-spi",
> @@ -520,7 +519,8 @@ static struct of_platform_driver mpc52xx_psc_spi_=
of_driver =3D {
>
> =A0static int __init mpc52xx_psc_spi_init(void)
> =A0{
> - =A0 =A0 =A0 return of_register_platform_driver(&mpc52xx_psc_spi_of_=
driver);
> + =A0 =A0 =A0 return of_probe_platform_driver(&mpc52xx_psc_spi_of_dri=
ver,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 mpc52xx_psc_spi_of_probe);
> =A0}
> =A0module_init(mpc52xx_psc_spi_init);
>
> --
> 1.7.2.3
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
