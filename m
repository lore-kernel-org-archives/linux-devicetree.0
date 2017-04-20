From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 3/4] mtd: partitions: add of_match_table parser
 matching
Date: Thu, 20 Apr 2017 16:59:07 -0700
Message-ID: <20170420235907.GL20555@google.com>
References: <20170420135431.12585-1-zajec5@gmail.com>
 <20170420135731.13272-1-zajec5@gmail.com>
 <20170420135731.13272-4-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170420135731.13272-4-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 20, 2017 at 03:57:30PM +0200, Rafał Miłecki wrote:
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
> ---
>  drivers/mtd/mtdpart.c          | 47 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/partitions.h |  1 +
>  2 files changed, 48 insertions(+)

Seems like a valid refactoring of my original work, esp. given that
of_mtd.c went away since then:

Acked-by: Brian Norris <computersforpeac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 73c52f1a2e4c..d0cb1a892ed2 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -861,6 +861,41 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
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
> @@ -913,6 +948,18 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  		if (ret < 0 && !err)
>  			err = ret;
>  	}
> +
> +	parser = mtd_part_get_parser_by_of(master);
> +	if (!parser)
> +		return err;
> +
> +	ret = mtd_part_do_parse(parser, master, pparts, data);
> +	if (ret > 0)
> +		return 0;
> +	mtd_part_parser_put(parser);
> +	if (ret < 0 && !err)
> +		err = ret;
> +
>  	return err;
>  }
>  
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
> index 2787e76c030f..073e1d8d5d17 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -77,6 +77,7 @@ struct mtd_part_parser {
>  	struct list_head list;
>  	struct module *owner;
>  	const char *name;
> +	const struct of_device_id *of_match_table;
>  	int (*parse_fn)(struct mtd_info *, const struct mtd_partition **,
>  			struct mtd_part_parser_data *);
>  	void (*cleanup)(const struct mtd_partition *pparts, int nr_parts);
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
