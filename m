From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] OF: Add [__]of_find_node_by_full_name
Date: Wed, 19 Mar 2014 21:02:32 +0000
Message-ID: <CACxGe6sg5KUe1c53-LhWSgCU1V0VhHJygfmKpHXomvrrik0Fmg@mail.gmail.com>
References: <1395179560-31384-1-git-send-email-pantelis.antoniou@konsulko.com> <CAL_Jsq+cpgnTYUxe1FRgVDak963y3E5_EFqc=fBM-3hq4wgqbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+cpgnTYUxe1FRgVDak963y3E5_EFqc=fBM-3hq4wgqbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 19, 2014 at 12:26 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Mar 18, 2014 at 4:52 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> __of_find_node_by_full_name recursively searches for a matching node
>> with the given full name without taking any locks.
>>
>> of_find_node_by_full_name takes locks and takes a reference on the
>> matching node.
>>
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> ---
>>  drivers/of/base.c  | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/of.h |  4 ++++
>>  2 files changed, 62 insertions(+)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 19bcdb4..08156e6 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1142,6 +1142,64 @@ static void *of_find_property_value_of_size(const struct device_node *np,
>>  }
>>
>>  /**
>> + * __of_find_node_by_full_name - Find a node with the full name recursively
>> + * @node:      Root of the tree to perform the search
>> + * @full_name: Full name of the node to find.
>> + *
>> + * Find a node with the give full name by recursively following any of
>> + * the child node links.
>> + * Returns the matching node, or NULL if not found.
>> + * Note that the devtree lock is not taken, so this function is only
>> + * safe to call on either detached trees, or when devtree lock is already
>> + * taken.
>> + */
>> +struct device_node *__of_find_node_by_full_name(struct device_node *node,
>> +               const char *full_name)
>> +{
>> +       struct device_node *child, *found;
>> +
>> +       if (node == NULL)
>
> Just !node is preferred.
>
>> +               return NULL;
>> +
>> +       /* check */
>> +       if (of_node_cmp(node->full_name, full_name) == 0)
>> +               return node;
>> +
>> +       __for_each_child_of_node(node, child) {
>> +               found = __of_find_node_by_full_name(child, full_name);
>> +               if (found != NULL)
>
> "if (found)" is preferred.
>
>> +                       return found;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +EXPORT_SYMBOL(__of_find_node_by_full_name);
>
> Does this need to be exported?
>
> In any case, use EXPORT_SYMBOL_GPL.
>
>> +
>> +/**
>> + * of_find_node_by_full_name - Find a node with the full name recursively
>> + * @node:      Root of the tree to perform the search
>> + * @full_name: Full name of the node to find.
>> + *
>> + * Find a node with the give full name by recursively following any of
>> + * the child node links.
>> + * Returns the matching node (with a ref taken), or NULL if not found.
>> + */
>> +struct device_node *of_find_node_by_full_name(struct device_node *node,
>> +               const char *full_name)
>> +{
>> +       unsigned long flags;
>> +       struct device_node *np;
>> +
>> +       raw_spin_lock_irqsave(&devtree_lock, flags);
>> +       np = of_find_node_by_full_name(node, full_name);
>
> Don't you need __of_find_node_by_full_name here.

!?!  Did this code get tested?

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
