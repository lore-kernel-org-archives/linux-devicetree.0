From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Mon, 12 Dec 2016 11:05:19 +1100
Message-ID: <CACPK8XdUSExe91JO1n8RcpSCKTnPZAyErFFerx4kVuaV_X9Cmw@mail.gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org> <1481302167-28044-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481302167-28044-2-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 10, 2016 at 3:49 AM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
> This driver adds mtd support for the Aspeed AST2500 SoC static memory
> controllers :


> Based on previous work from Milton D. Miller II <miltonm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

I had a read and it looks good. Once you have addressed Marek's
review, please add:

Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

> ---
>  drivers/mtd/spi-nor/Kconfig      |  10 +
>  drivers/mtd/spi-nor/Makefile     |   1 +
>  drivers/mtd/spi-nor/aspeed-smc.c | 735 +++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 746 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
>

> +
> +MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
> +MODULE_AUTHOR("Milton Miller");

You can stick your name here instead, or drop the define.

> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
