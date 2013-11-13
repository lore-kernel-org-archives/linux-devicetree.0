From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] mtd: gpmi: add a new DT property to use the
 datasheet's minimum required ECC
Date: Wed, 13 Nov 2013 12:46:40 -0800
Message-ID: <CAN8TOE8aew_Jhc7L4isgo5fZPSnP+nsuhdiFoYGPZZ3AsyY9kg@mail.gmail.com>
References: <1383818858-5410-1-git-send-email-b32955@freescale.com>
	<5281BBEE.7000502@freescale.com>
	<CAN8TOE_-O_gxM+c4k6NXvvo=7Ozp1J187=XtK9gxfLa4LGQAWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN8TOE_-O_gxM+c4k6NXvvo=7Ozp1J187=XtK9gxfLa4LGQAWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 9:47 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> + DT maintainers, since they haven't responded
>
> On Mon, Nov 11, 2013 at 9:26 PM, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> 于 2013年11月07日 18:07, Huang Shijie 写道:
>>
>>> In default way, we use the ecc_strength/ecc_step size calculated by
>>> ourselves
>>> and use all the OOB area.
>>>
>>> This patch adds a new property : "fsl,use-minimum-ecc"
>>>
>>> If we enable it, we will firstly try to use the datasheet's minimum
>>> required
>>> ECC provided by the MTD layer (the ecc_strength_ds/ecc_step_ds fields
>>> in the nand_chip{}). So we may have free space in the OOB area by using
>>> the
>>> minimum ECC, and we may support JFFS2 with some SLC NANDs, such as
>>> Micron's
>>> SLC NAND.
>>>
>>> If we fail to use the minimum ECC, we will use the legacy method to
>>> calculate
>>> the ecc_strength and ecc_step size.
>>>
>>> Signed-off-by: Huang Shijie<b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> ---
>>> v1 -->  v2: rebase this patch on the latest l2-mtd.
>>> v2 -->  v3: change the descriptions.
>>> ---
>>>   .../devicetree/bindings/mtd/gpmi-nand.txt          |    8 ++++++++
>>>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    3 +++
>>>   2 files changed, 11 insertions(+), 0 deletions(-)
>>
>> Is this patch ok now? I hope it can be accepted at this merge-window.
>
> The patch is OK to me, but we haven't gotten any DT review. If we
> don't get any response in a few days, I'll take it anyway.

I pushed this to l2-mtd.git/next and will get it into linux-next after
the merge window closes. Let me know if there are further comments.

> I'm not sure about taking it in 3.13 vs. 3.14, as this is
> traditionally a late merge for 3.13.

Queued for 3.14.

Thanks,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
