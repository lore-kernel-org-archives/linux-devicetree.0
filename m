From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 3/4] mtd: partitions: add of_match_table parser
 matching
Date: Tue, 20 Jun 2017 13:59:53 -0700
Message-ID: <20170620205953.GA14148@google.com>
References: <20170523053022.3251-1-zajec5@gmail.com>
 <20170523053022.3251-4-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170523053022.3251-4-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rafal,

On Tue, May 23, 2017 at 07:30:21AM +0200, Rafał Miłecki wrote:
> From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Partition parsers can now provide an of_match_table to enable
> flash<-->parser matching via device tree.
> 
> This support is currently limited to built-in parsers as it uses
> request_module() and friends. This should be sufficient for most cases
> though as compiling parsers as modules isn't a common choice.
> 
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> Acked-by: Brian Norris <computersforpeac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I've pushed patches 1 and 2 to l2-mtd.git. I'm still looking at one
piece below:

> ---
> This is based on Brian's patches:
> [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
> [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
> 
> V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
>     Merge helpers into a single of_mtd_match_mtd_parser
> V3: Add a simple comment to note we will need the best match in the future
> ---
>  drivers/mtd/mtdpart.c          | 48 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/partitions.h |  1 +
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 73c52f1a2e4c..0d3cc1e79014 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -861,6 +861,42 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
>  	return ret;
>  }
>  
> +static bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
> +				    struct mtd_part_parser *parser)
> +{
> +	struct device_node *np;
> +	bool ret;
> +
> +	np = mtd_get_of_node(mtd);
> +	np = of_get_child_by_name(np, "partitions");
> +
> +	ret = !!of_match_node(parser->of_match_table, np);
> +
> +	of_node_put(np);
> +
> +	return ret;
> +}
> +
> +static struct mtd_part_parser *mtd_part_get_parser_by_of(struct mtd_info *mtd)
> +{
> +	struct mtd_part_parser *p, *ret = NULL;
> +
> +	spin_lock(&part_parser_lock);
> +
> +	/* TODO: Pick parser with the best match (score) */

I don't usually like sticking in TODOs for known issues like this on new
code. This one isn't really that hard to solve; there just aren't any
nice helpers for it. I see you even wrote up something on one of the
prior versions.

I might take a look myself at improving your other proposal. I'd rather
give that a chance than take this with a TODO.

> +	list_for_each_entry(p, &part_parsers, list) {
> +		if (of_mtd_match_mtd_parser(mtd, p) &&
> +				try_module_get(p->owner)) {
> +			ret = p;
> +			break;
> +		}
> +	}
> +
> +	spin_unlock(&part_parser_lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * parse_mtd_partitions - parse MTD partitions
>   * @master: the master partition (describes whole MTD device)

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
