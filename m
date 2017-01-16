From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Mon, 16 Jan 2017 22:24:33 +0100
Message-ID: <596c8ae0-06c5-5951-cf98-fa9eaffce374@denx.de>
References: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
 <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170116210039.25267-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Masahiko Iwamoto <iwamoto-sK/J6oeM9AhgKrQr38906+qrae++aQT8@public.gmane.org>, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/16/2017 10:00 PM, Uwe Kleine-König wrote:
> The MR25 family doesn't support JEDEC, so they need explicit mentioning
> in the list of supported spi IDs. This makes it possible to add these
> using for example:
> 
> 	compatible = "everspin,mr25h40";
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Acked-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
> Changes since (implicit) v1:
>  - use Kib instead of kib
> 
>  drivers/mtd/devices/m25p80.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd28034..aa50bd96de3a 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -305,6 +305,11 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
>  	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
>  
> +	/* Everspin MRAMs */
> +	{ "mr25h256" }, /* 256 Kib, 40 MHz */
> +	{ "mr25h10" },  /*   1 Mib, 40 MHz */
> +	{ "mr25h40" },  /*   4 Mib, 40 MHz */
> +
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, m25p_ids);
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
