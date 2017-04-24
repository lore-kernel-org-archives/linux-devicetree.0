From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 3/4] mtd: partitions: add of_match_table parser
 matching
Date: Mon, 24 Apr 2017 22:53:49 +0200
Message-ID: <931e8f81-dd42-d0f9-1589-c61927252204@gmail.com>
References: <20170420135731.13272-2-zajec5@gmail.com>
 <20170424124120.31613-1-zajec5@gmail.com>
 <20170424124120.31613-4-zajec5@gmail.com>
 <CAOiHx=njT+y6VqTbqRFQZ4rJNW6A8XsngTe2WRp=qND9c3ySpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=njT+y6VqTbqRFQZ4rJNW6A8XsngTe2WRp=qND9c3ySpA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/24/2017 05:31 PM, Jonas Gorski wrote:
> On 24 April 2017 at 14:41, Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Partition parsers can now provide an of_match_table to enable
>> flash<-->parser matching via device tree.
>>
>> This support is currently limited to built-in parsers as it uses
>> request_module() and friends. This should be sufficient for most cases
>> though as compiling parsers as modules isn't a common choice.
>>
>> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> Acked-by: Brian Norris <computersforpeac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> This is based on Brian's patches:
>> [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
>> [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
>>
>> V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
>>     Merge helpers into a single of_mtd_match_mtd_parser
>> ---
>>  drivers/mtd/mtdpart.c          | 47 ++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/partitions.h |  1 +
>>  2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
>> index 73c52f1a2e4c..d0cb1a892ed2 100644
>> --- a/drivers/mtd/mtdpart.c
>> +++ b/drivers/mtd/mtdpart.c
>> @@ -861,6 +861,41 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
>>         return ret;
>>  }
>>
>> +static bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
>> +                                   struct mtd_part_parser *parser)
>> +{
>> +       struct device_node *np;
>> +       bool ret;
>> +
>> +       np = mtd_get_of_node(mtd);
>> +       np = of_get_child_by_name(np, "partitions");
>> +
>> +       ret = !!of_match_node(parser->of_match_table, np);
>> +
>> +       of_node_put(np);
>> +
>> +       return ret;
>> +}
>> +
>> +static struct mtd_part_parser *mtd_part_get_parser_by_of(struct mtd_info *mtd)
>> +{
>> +       struct mtd_part_parser *p, *ret = NULL;
>> +
>> +       spin_lock(&part_parser_lock);
>> +
>> +       list_for_each_entry(p, &part_parsers, list) {
>> +               if (of_mtd_match_mtd_parser(mtd, p) &&
>> +                               try_module_get(p->owner)) {
>> +                       ret = p;
>> +                       break;
>> +               }
>> +       }
>
>
> Hm, maybe iterate over the compatibles, so parsers matching the most
> specific compatible get precedence in case there is more than one
> compatible? Currently it will match the first one that matches any
> compatible, and registration order of parsers can change that. I'm
> thinking of parsers that partially rely on fixed, unprobable layouts,
> so can use "fixed-partitions" as a fallback compatible.
>
> E.g. having something like this
>
> partitions {
>         compatible = "sample,custom-layout", "fixed-partitions";
>
>         bootloader@0 { ...  };
>
>         firmware@10000 { .... }; /* will be split by the parser */
>
>         extra@780000 { .... }; /* partition the on-flash format can't specify */
> };
>
> Where you will still be able to write an image raw to the image
> partition even if the "custom-layout"-parser isn't present/enabled,
> but if it is present, it should always be used.

I see the point, but I'm afraid we're lacking some DT helper for this. See
below for the function I wrote (and I'm not proud of) - compile tested only.

I think we would need a new helper similar to the of_match_node:
1) Taking const struct of_device_id *matches
2) Taking const struct device_node *node
but returning a score of the best match.

DT guys: any comment on this? Rob?

Would this be acceptable to:
1) Take this patch as is as Linux current doesn't support other bindings
2) Work on DT helper + mtd modification in a separated patchset?

static struct mtd_part_parser *mtd_part_get_parser_by_of(struct mtd_info *mtd)
{
	struct mtd_part_parser *p, *ret = NULL;
	struct device_node *np;
	struct property *prop;
	const char *cp;

	np = mtd_get_of_node(mtd);
	np = of_get_child_by_name(np, "partitions");
	if (!np)
		return NULL;

	spin_lock(&part_parser_lock);

	of_property_for_each_string(np, "compatible", prop, cp) {
		list_for_each_entry(p, &part_parsers, list) {
			const struct of_device_id *matches;

			for (matches = p->of_match_table;
			     matches->name[0] || matches->type[0] || matches->compatible[0];
			     matches++) {
				if (!of_compat_cmp(cp, matches->compatible, strlen(matches->compatible)) &&
				    try_module_get(p->owner)) {
					ret = p;
					break;
				}
			}

			if (ret)
				break;
		}

		if (ret)
			break;
	}

	spin_unlock(&part_parser_lock);

	of_node_put(np);

	return ret;
}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
