From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 1/2] mtd: partitions: add of_match_table parser
 matching
Date: Fri, 11 Aug 2017 09:19:50 -0700
Message-ID: <20170811161950.GC77953@google.com>
References: <20170624231025.23292-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170624231025.23292-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jun 25, 2017 at 01:10:24AM +0200, Rafał Miłecki wrote:
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
> This is based on Brian's patches:
> [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
> [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
> 
> V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
>     Merge helpers into a single of_mtd_match_mtd_parser
> V3: Add a simple comment to note we will need the best match in the future
> V4: Rework new functions to pick parser with the best match
>     Move new code in parse_mtd_partitions up so it has precedence over flash
>     driver defaults and MTD defaults
> ---
>  drivers/mtd/mtdpart.c          | 65 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/partitions.h |  1 +
>  2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 2ad9493703f9..239d5e6e62ed 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -30,6 +30,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
>  
>  #include "mtdcore.h"
>  
> @@ -885,6 +886,60 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
>  	return ret;
>  }
>  
> +static int of_mtd_match_mtd_parser(struct mtd_info *mtd,
> +				   struct mtd_part_parser *parser)
> +{
> +	const struct of_device_id *matches;
> +	struct device_node *np;
> +	int score = 0;
> +
> +	matches = parser->of_match_table;
> +	if (!matches)
> +		return false;
> +
> +	np = mtd_get_of_node(mtd);
> +	np = of_get_child_by_name(np, "partitions");
> +	if (!np)
> +		return false;

This function returns int, but you're returning 'false'. Should probably
be 0, or negative.

> +
> +	for (; matches->name[0] || matches->type[0] || matches->compatible[0];
> +	     matches++) {
> +		if (!matches->compatible[0])
> +			continue;
> +		score = max(score,
> +			    of_device_is_compatible(np, matches->compatible));
> +	}
> +
> +	of_node_put(np);
> +
> +	return score;
> +}
> +
> +static struct mtd_part_parser *mtd_part_get_parser_by_of(struct mtd_info *mtd)
> +{
> +	struct mtd_part_parser *p, *ret = NULL;
> +	struct mtd_part_parser *best_parser = NULL;
> +	int best_score = 0;
> +
> +	spin_lock(&part_parser_lock);
> +
> +	list_for_each_entry(p, &part_parsers, list) {
> +		int score = of_mtd_match_mtd_parser(mtd, p);
> +
> +		if (score > best_score) {
> +			best_score = score;
> +			best_parser = p;
> +		}
> +	}
> +
> +	if (best_parser && try_module_get(best_parser->owner))
> +		ret = best_parser;

Unfortunately, this only tries a single parser (the "best" in the
compatible list). But what if that parser doesn't match? I thought the
idea was to fall back to the others. e.g., if this was like a block
device, we might have something like 'compatible = "gpt", "mbr";', and
if we don't find a GPT descriptor, we fall back to MBR.

I believe the correct algorithm for this is:

 for each c in compatible: // in order
   for each p in parsers:
     if p matches c:
       ret = do_parse(p)
       if ret > 0:
         terminate(success)

Which is essentially "try parsers that match each compatible property,
starting with the first". (You could also do this by sorting the parser
list, but that would just be extra complex.)

If I understand right, yours is like sorting the parser list and only
trying the first one (i.e., the "max score").

Brian

> +
> +	spin_unlock(&part_parser_lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * parse_mtd_partitions - parse MTD partitions
>   * @master: the master partition (describes whole MTD device)
> @@ -913,6 +968,16 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  	struct mtd_part_parser *parser;
>  	int ret, err = 0;
>  
> +	parser = mtd_part_get_parser_by_of(master);
> +	if (parser) {
> +		ret = mtd_part_do_parse(parser, master, pparts, data);
> +		if (ret > 0)
> +			return 0;
> +		mtd_part_parser_put(parser);
> +		if (ret < 0)
> +			err = ret;
> +	}
> +
>  	if (!types)
>  		types = default_mtd_part_types;
>  
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
> index c4beb70dacbd..11cb0c50cd84 100644
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
