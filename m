From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 2/4] mtd: partitions: factor out code calling
 parser
Date: Thu, 20 Apr 2017 16:45:34 -0700
Message-ID: <20170420234534.GK20555@google.com>
References: <20170420135431.12585-1-zajec5@gmail.com>
 <20170420135731.13272-1-zajec5@gmail.com>
 <20170420135731.13272-3-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170420135731.13272-3-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 20, 2017 at 03:57:29PM +0200, Rafał Miłecki wrote:
> From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This code is going to be reused for parsers matched using OF so let's
> factor it out to make this easier.
> 
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---

Could have used a changelog to note dropping the
mtd_part_parser_get_by_name() refactoring. Also the corresponding change
in subject (from "mtd: partitions: factor out "match by name"
handling").

But this seems fine to me.

Acked-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

>  drivers/mtd/mtdpart.c | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 81e0b80237df..73c52f1a2e4c 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -840,6 +840,27 @@ static const char * const default_mtd_part_types[] = {
>  	NULL
>  };
>  
> +static int mtd_part_do_parse(struct mtd_part_parser *parser,
> +			     struct mtd_info *master,
> +			     struct mtd_partitions *pparts,
> +			     struct mtd_part_parser_data *data)
> +{
> +	int ret;
> +
> +	ret = (*parser->parse_fn)(master, &pparts->parts, data);
> +	pr_debug("%s: parser %s: %i\n", master->name, parser->name, ret);
> +	if (ret <= 0)
> +		return ret;
> +
> +	pr_notice("%d %s partitions found on MTD device %s\n", ret,
> +		  parser->name, master->name);
> +
> +	pparts->nr_parts = ret;
> +	pparts->parser = parser;
> +
> +	return ret;
> +}
> +
>  /**
>   * parse_mtd_partitions - parse MTD partitions
>   * @master: the master partition (describes whole MTD device)
> @@ -880,16 +901,10 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  			 parser ? parser->name : NULL);
>  		if (!parser)
>  			continue;
> -		ret = (*parser->parse_fn)(master, &pparts->parts, data);
> -		pr_debug("%s: parser %s: %i\n",
> -			 master->name, parser->name, ret);
> -		if (ret > 0) {
> -			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
> -			       ret, parser->name, master->name);
> -			pparts->nr_parts = ret;
> -			pparts->parser = parser;
> +		ret = mtd_part_do_parse(parser, master, pparts, data);
> +		/* Found partitions! */
> +		if (ret > 0)
>  			return 0;
> -		}
>  		mtd_part_parser_put(parser);
>  		/*
>  		 * Stash the first error we see; only report it if no parser
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
