From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V6 1/2] mtd: partitions: add of_match_table parser
 matching
Date: Tue, 9 Jan 2018 10:42:45 +0100
Message-ID: <20180109104245.0f8cf097@bbrezillon>
References: <20180102130458.16226-1-zajec5@gmail.com>
        <20180103105543.17897-1-zajec5@gmail.com>
        <CAL_JsqLYjUsWGAYm978oPmMAue6YDRb=K00gReZTia6iaJ6xsA@mail.gmail.com>
        <9a799300a0730a0103fe744878fb1a9f@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9a799300a0730a0103fe744878fb1a9f-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 04 Jan 2018 07:32:36 +0100
Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org> wrote:

> On 2018-01-03 19:28, Rob Herring wrote:
> > On Wed, Jan 3, 2018 at 4:55 AM, Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:  
> >> From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> 
> >> Partition parsers can now provide an of_match_table to enable
> >> flash<-->parser matching via device tree as documented in the
> >> mtd/partition.txt.
> >> 
> >> It works by looking for a matching parser for every string in the
> >> "compatibility" property (starting with the most specific one).
> >> 
> >> This support is currently limited to built-in parsers as it uses
> >> request_module() and friends. This should be sufficient for most cases
> >> though as compiling parsers as modules isn't a common choice.
> >> 
> >> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> >> ---
> >> This is based on Brian's patches:
> >> [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and 
> >> of_mtd_match_mtd_parser() helpers
> >> [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
> >> 
> >> V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
> >>     Merge helpers into a single of_mtd_match_mtd_parser
> >> V3: Add a simple comment to note we will need the best match in the 
> >> future
> >> V4: Rework new functions to pick parser with the best match
> >>     Move new code in parse_mtd_partitions up so it has precedence over 
> >> flash
> >>     driver defaults and MTD defaults
> >> V5: Rework matching code to start checking with the most specific 
> >> string in the
> >>     "compatibility" property.
> >> V6: Initialize "ret" variable in mtd_part_get_parser_by_cp to NULL
> >> ---
> >>  drivers/mtd/mtdpart.c          | 64 
> >> ++++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/mtd/partitions.h |  1 +
> >>  2 files changed, 65 insertions(+)
> >> 
> >> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> >> index be088bccd593..b11958adcf45 100644
> >> --- a/drivers/mtd/mtdpart.c
> >> +++ b/drivers/mtd/mtdpart.c
> >> @@ -30,6 +30,7 @@
> >>  #include <linux/mtd/mtd.h>
> >>  #include <linux/mtd/partitions.h>
> >>  #include <linux/err.h>
> >> +#include <linux/of.h>
> >> 
> >>  #include "mtdcore.h"
> >> 
> >> @@ -880,6 +881,48 @@ static int mtd_part_do_parse(struct 
> >> mtd_part_parser *parser,
> >>  }
> >> 
> >>  /**
> >> + * mtd_part_get_parser_by_cp - find MTD parser by a compatible string  
> > 
> > What's "cp"? Perhaps mtd_part_get_compatible_parser.  
> 
> That's what some base of functions use internally, like
> __of_device_is_compatible (cp)
> of_modalias_node (cplen)
> but using "compatible" for the function name sounds better.
> 
> 
> >> + *
> >> + * @cp: compatible string describing partitions in a device tree  
> > 
> > "compat" would be clearer IMO
> >   
> >> + *
> >> + * MTD parsers can specify supported partitions by providing a table 
> >> of
> >> + * compatibility strings. This function finds a parser that 
> >> advertises support
> >> + * for a passed value of "compatible".
> >> + */
> >> +static struct mtd_part_parser *mtd_part_get_parser_by_cp(const char 
> >> *cp)
> >> +{
> >> +       struct mtd_part_parser *p, *ret = NULL;
> >> +
> >> +       spin_lock(&part_parser_lock);
> >> +
> >> +       list_for_each_entry(p, &part_parsers, list) {
> >> +               const struct of_device_id *matches;
> >> +
> >> +               matches = p->of_match_table;
> >> +               if (!matches)
> >> +                       continue;
> >> +
> >> +               for (; matches->name[0] || matches->type[0] || 
> >> matches->compatible[0];
> >> +                    matches++) {
> >> +                       if (!matches->compatible[0])
> >> +                               continue;  
> > 
> > It would be simpler to just ignore name and type. Having either of
> > those would be an error and the only consequence if there are entries
> > without compatible is returning early.  
> 
> OK, thanks. I guess I misused pattern I saw in the __of_match_node.
> 
> 
> >> +                       if (!strcmp(matches->compatible, cp) &&
> >> +                           try_module_get(p->owner)) {
> >> +                               ret = p;
> >> +                               break;
> >> +                       }
> >> +               }
> >> +
> >> +               if (ret)
> >> +                       break;
> >> +       }
> >> +
> >> +       spin_unlock(&part_parser_lock);
> >> +
> >> +       return ret;
> >> +}
> >> +
> >> +/**
> >>   * parse_mtd_partitions - parse MTD partitions
> >>   * @master: the master partition (describes whole MTD device)
> >>   * @types: names of partition parsers to try or %NULL
> >> @@ -905,8 +948,29 @@ int parse_mtd_partitions(struct mtd_info *master, 
> >> const char *const *types,
> >>                          struct mtd_part_parser_data *data)
> >>  {
> >>         struct mtd_part_parser *parser;
> >> +       struct device_node *np;
> >> +       struct property *prop;
> >> +       const char *cp;
> >>         int ret, err = 0;
> >> 
> >> +       np = of_get_child_by_name(mtd_get_of_node(master), 
> >> "partitions");
> >> +       if (np) {  
> > 
> > You can drop this. of_property_for_each_string and of_node_put will
> > work if np is NULL.
> >   
> >> +               of_property_for_each_string(np, "compatible", prop, 
> >> cp) {
> >> +                       parser = mtd_part_get_parser_by_cp(cp);
> >> +                       if (!parser)
> >> +                               continue;
> >> +                       ret = mtd_part_do_parse(parser, master, 
> >> pparts, data);
> >> +                       if (ret > 0) {
> >> +                               of_node_put(np);
> >> +                               return 0;
> >> +                       }
> >> +                       mtd_part_parser_put(parser);
> >> +                       if (ret < 0 && !err)
> >> +                               err = ret;
> >> +               }
> >> +               of_node_put(np);
> >> +       }
> >> +
> >>         if (!types)
> >>                 types = default_mtd_part_types;
> >> 
> >> diff --git a/include/linux/mtd/partitions.h 
> >> b/include/linux/mtd/partitions.h
> >> index c4beb70dacbd..11cb0c50cd84 100644
> >> --- a/include/linux/mtd/partitions.h
> >> +++ b/include/linux/mtd/partitions.h
> >> @@ -77,6 +77,7 @@ struct mtd_part_parser {
> >>         struct list_head list;
> >>         struct module *owner;
> >>         const char *name;
> >> +       const struct of_device_id *of_match_table;  
> > 
> > I generally like using of_device_id over just an array of strings, but
> > I'm wondering if there's really cases where you have multiple
> > compatible strings for a single parser? Perhaps a single string here
> > would be sufficient. And if you did have multiple matches, how would
> > you distinguish them later on in the parsing functions? Normally we'd
> > use the matched data ptr, but that's not provided here.  
> 
> I think we may need some flash parsers to support multiple strings in
> the future. For example image tag parser (bcm63xxpart.c) handles
> Broadcom's tag that has few versions (see struct bcm_tag and its
> version field).
> 
> Later we may want to add support for matching partitions parsers (like
> trx) which also can have multple versions support. For example TRX v1
> and TRX v2 differ by a single field in the header and it makes sense to
> use the same parser for them.
> 
> While this may be not a perfect solution with data ptr, we can always do
> of_device_is_compatible(&mtd->dev, "foo")

Well, if we ever need to extract per-compatible driver data, we could
easily add a field to the mtd_part_parser_data struct (void *of_data).

Rafal, I had a look at your v7 and it looks sane, so I'll queue it for
4.16 unless Rob has other concerns.

Thanks for your patience.

Boris

> 
> 
> >>         int (*parse_fn)(struct mtd_info *, const struct mtd_partition 
> >> **,
> >>                         struct mtd_part_parser_data *);
> >>         void (*cleanup)(const struct mtd_partition *pparts, int 
> >> nr_parts);
> >> --
> >> 2.11.0
> >>   

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
