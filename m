From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 4/4] mtd: ofpart: add of_match_table with
 "fixed-partitions"
Date: Thu, 20 Apr 2017 17:11:26 -0700
Message-ID: <20170421001126.GM20555@google.com>
References: <20170420135431.12585-1-zajec5@gmail.com>
 <20170420135731.13272-1-zajec5@gmail.com>
 <20170420135731.13272-5-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170420135731.13272-5-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 20, 2017 at 03:57:31PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> This allows using this parser with any flash driver that takes care of
> setting of_node (using mtd_set_of_node helper) correctly. Up to now
> support for "fixed-partitions" DT compatibility string was working only
> with flash drivers that were specifying "ofpart" (manually or by letting
> mtd use the default set of parsers).
> 
> This matches existing bindings documentation.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---

Seems OK to me. I think this means we can even get away without putting
"ofpart" in the "probe type" arrays in drivers now, if we don't care
about the legacy binding. Probably not gonna happen for existing
drivers, but at least it helps going forward. And of course, it provides
a starting example for new partition-parser compatible properties, if
that's the way we go.

Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

>  drivers/mtd/ofpart.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 2861c7079d7b..fb6f3df40e94 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -140,9 +140,16 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  	return ret;
>  }
>  
> +static const struct of_device_id parse_ofpart_match_table[] = {
> +	{ .compatible = "fixed-partitions" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, parse_ofpart_match_table);
> +
>  static struct mtd_part_parser ofpart_parser = {
>  	.parse_fn = parse_ofpart_partitions,
>  	.name = "ofpart",
> +	.of_match_table = parse_ofpart_match_table,
>  };
>  
>  static int parse_ofoldpart_partitions(struct mtd_info *master,
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
