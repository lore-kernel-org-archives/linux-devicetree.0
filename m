From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and
 of_mtd_match_mtd_parser() helpers
Date: Sun, 6 Dec 2015 20:45:40 -0600
Message-ID: <CAL_JsqLV1mDpW9tD0XjWRxZSSsYuDiqHbuADQmBUtACgYiHJ+w@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com> <1449292763-129421-5-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449292763-129421-5-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 4, 2015 at 11:19 PM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Like the corresponding OF-based device/driver matching infrascture,

typo.

> let's begin to support a mtd/partition-parser matching infrastructure.
>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/of_mtd.c            | 33 +++++++++++++++++++++++++++++++++

BTW, this file should be moved to drivers/mtd/ at some point.

>  include/linux/mtd/partitions.h |  2 ++
>  include/linux/of_mtd.h         | 13 +++++++++++++
>  3 files changed, 48 insertions(+)
>
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> index b7361ed70537..169d7500af5d 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/of_mtd.h>
>  #include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
>  #include <linux/export.h>
>
>  /**
> @@ -117,3 +118,35 @@ bool of_get_nand_on_flash_bbt(struct device_node *np)
>         return of_property_read_bool(np, "nand-on-flash-bbt");
>  }
>  EXPORT_SYMBOL_GPL(of_get_nand_on_flash_bbt);
> +
> +static const struct of_device_id *of_match_mtd_parser(

This function name and the only caller's function name are very
similar. Why not just move this function inline.

> +               struct mtd_part_parser *parser, struct device_node *np)
> +{
> +       if (!parser || !np)
> +               return NULL;
> +
> +       return of_match_node(parser->of_match_table, np);
> +}
> +
> +static struct device_node *mtd_get_partitions_of_node(struct mtd_info *master)
> +{
> +       struct device_node *np = mtd_get_of_node(master);
> +
> +       if (!np)
> +               return NULL;
> +
> +       return of_get_child_by_name(np, "partitions");
> +}
> +
> +bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
> +                            struct mtd_part_parser *parser)
> +{
> +       struct device_node *np = mtd_get_partitions_of_node(mtd);
> +       bool ret;
> +
> +       ret = of_match_mtd_parser(parser, np) != NULL;
> +       of_node_put(np);
> +
> +       return ret;
> +}
