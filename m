From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] mtd: m25p80: bind to "nor-jedec" ID, for
 auto-detection
Date: Sun, 5 Apr 2015 19:05:00 -0700
Message-ID: <20150406020500.GM2677@norris-Latitude-E6410>
References: <1427477390-24069-1-git-send-email-computersforpeace@gmail.com>
 <1427477390-24069-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427477390-24069-2-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 27, 2015 at 10:29:50AM -0700, Brian Norris wrote:
> Use the new 'nor-jedec' binding to provide automatic detection of fla=
sh
> that use the 0x9F READ ID opcode. This can help for use cases where
> platforms just specify compatibility with "m25p80", and then see
> messages like this:
>=20
>   m25p80 spi32766.0: found s25fl256s1, expected m25p80
>=20
> Instead, they can just specify the generic string and see this:
>=20
>   m25p80 spi32766.0: s25fl256s1 (32768 Kbytes)
>=20
> Also, update the language about m25p_ids[] to straighten out the
> expectations here. We should no longer need to continuously grow the
> m25p_ids[] table, and in fact, we might want to start removing entrie=
s
> which are not used in device trees so far, so we can just default to
> auto-detection as much as possible in the future.
>=20
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> v2: no change

Saw no comments last week, and this patch is blocking several other
trivial patches. See comments below.

> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p8=
0.c
> index 85e35467fba6..7c8b1694a134 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
[...]
> @@ -247,9 +249,16 @@ static int m25p_remove(struct spi_device *spi)
>  }
> =20
>  /*
> - * XXX This needs to be kept in sync with spi_nor_ids.  We can't sha=
re
> - * it with spi-nor, because if this is built as a module then modpos=
t
> - * won't be able to read it and add appropriate aliases.

People patching the spi-nor.c table are not heeding this comment. So
either I need to get them to all rework their patches, or else I can
pull this in to get this all straightened out.

Given I fixed up all the comments from v1 and saw no major objections o=
n
v2 or my plan for cleaning up the DT ABI for this class of devices...

Applied this and the binding documentation change to l2-mtd.git.

Brian

> + * Do NOT add to this array without reading the following:
> + *
> + * Historically, many flash devices are bound to this driver by thei=
r name. But
> + * since most of these flash are compatible to some extent, and thei=
r
> + * differences can often be differentiated by the JEDEC read-ID comm=
and, we
> + * encourage new users to add support to the spi-nor library, and si=
mply bind
> + * against a generic string here (e.g., "nor-jedec").
> + *
> + * Many flash names are kept here in this list (as well as in spi-no=
r.c) to
> + * keep them available as module aliases for existing platforms.
>   */
>  static const struct spi_device_id m25p_ids[] =3D {
>  	{"at25fs010"},	{"at25fs040"},	{"at25df041a"},	{"at25df321a"},
> @@ -291,6 +300,12 @@ static const struct spi_device_id m25p_ids[] =3D=
 {
>  	{"w25x64"},	{"w25q64"},	{"w25q80"},	{"w25q80bl"},
>  	{"w25q128"},	{"w25q256"},	{"cat25c11"},
>  	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
> +
> +	/*
> +	 * Generic support for SPI NOR that can be identified by the JEDEC =
READ
> +	 * ID opcode (0x9F). Use this, if possible.
> +	 */
> +	{"nor-jedec"},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, m25p_ids);
> --=20
> 1.9.1
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
