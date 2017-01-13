From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] mtd: spi-nor: don't claim mr25h40 to be JEDEC compatible
Date: Fri, 13 Jan 2017 19:42:34 +0100
Message-ID: <CAMuHMdXJi9hJrY0ZV37gejp2XC6fkuLF7i7BqX4CUYTB7j_q1A@mail.gmail.com>
References: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170113093509.25737-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Masahiko Iwamoto <iwamoto-sK/J6oeM9AhgKrQr38906+qrae++aQT8@public.gmane.org>, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Uwe,

CC devicetree

On Fri, Jan 13, 2017 at 10:35 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Commit edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40") made it
> possible to use a mr25h40 by writing
>
>         compatible =3D "mr25h40", "jedec,spi-nor";

No vendor prefix?

>
> in a device tree. This chip however isn't JEDEC compatible however, so
> change the chip string and add a compatible entry to bless
>
>         compatible =3D "mr25h40-nonjedec";
>
> as the right way.

This whole "-nonjedec" business looks wrong to me.
If the device is called "mr25h40", its compatible value should be
"everspin,mr25h40". Adding some (in)compatibility indicator violates the
spirit of compatible values, IMHO.

> Fixes: edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/mtd/devices/m25p80.c  | 1 +
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd28034..bd0c335692d2 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -304,6 +304,7 @@ static const struct spi_device_id m25p_ids[] =3D {
>         {"m25p05-nonjedec"},    {"m25p10-nonjedec"},    {"m25p20-nonjedec=
"},
>         {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonjedec=
"},
>         {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonjede=
c"},
> +       {"mr25h40-nonjedec"},
>
>         { },
>  };
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index bbdbbd763c9d..3a8042fe44f0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -825,7 +825,7 @@ static const struct flash_info spi_nor_ids[] =3D {
>         /* Everspin */
>         { "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE =
| SPI_NOR_NO_FR) },
>         { "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE =
| SPI_NOR_NO_FR) },
> -       { "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE =
| SPI_NOR_NO_FR) },
> +       { "mr25h40-nonjedec",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_=
NO_ERASE | SPI_NOR_NO_FR) },
>
>         /* Fujitsu */
>         { "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE)=
 },
> --
> 2.11.0

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
