From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: Support hashtable lookups for phandles
Date: Mon, 9 May 2016 16:11:28 -0500
Message-ID: <CAL_JsqLsztrWr8mQwCHzA+qkrRev0Kfr--BkMiPVRVycZp0A=Q@mail.gmail.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462817488-8370-3-git-send-email-pantelis.antoniou@konsulko.com> <CAMuHMdXBnxTaKB4io4j4jbbUh+QU0b_Fj8zYi_K_7NZSE33YpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXBnxTaKB4io4j4jbbUh+QU0b_Fj8zYi_K_7NZSE33YpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 9, 2016 at 3:38 PM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Pantelis,
>
> On Mon, May 9, 2016 at 8:11 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>
>> @@ -1073,9 +1097,14 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>>                 return NULL;
>>
>>         raw_spin_lock_irqsave(&devtree_lock, flags);
>> -       for_each_of_allnodes(np)
>> -               if (np->phandle == handle)
>> -                       break;
>> +       /* when we're ready use the hash table */
>> +       if (of_phandle_ht_available() && !in_interrupt())
>
> I guess the !in_interrupt() test is because of the locking inside
> rhashtable_lookup_fast()?

Not a use we should support. Just warn for anyone parsing DT in
interrupt context.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
