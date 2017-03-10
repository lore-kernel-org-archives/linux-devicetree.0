From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 00/39] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
Date: Fri, 10 Mar 2017 20:00:03 +0900
Message-ID: <CAK7LNAQxTSJT3szu46pQfBXGmenAexMWo8GyjmHsnXVmht4mOA@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <20161127160459.5894be93@bbrezillon> <CAK7LNAQPm7w0_iSDLJihFaxSdMp5UMnpDZH5nBTyVnoLL9KYjg@mail.gmail.com>
 <20161130091722.2e35f32a@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161130091722.2e35f32a@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

I am almost getting v2 done,
and now I am testing it.

I am having one problem.  Please teach me.


2016-11-30 17:17 GMT+09:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>> [2]
>> Remove driver-internal bounce buffer.
>> The current Denali driver allocate DMA_BIDIRECTIONAL buffer
>> to use it as a driver-internal bounce buffer.
>>
>> The hardware transfer page data into the bounce buffer,
>> then CPU copies from the bounce buffer to a given buf (and oob_poi).
>> This is not efficient.
>>
>> So, I want to set NAND_USE_BOUNCE_BUFFER flag
>> and do dma_map_single directly for a given buffer.
>
> Sounds good. Be careful though, when you use the generic bounce buffer
> interface you might have to clear the page cache info (->pagebuf = -1).


Instead of memcpy() of the whole page,
I am trying to use dma_map_single()  in ecc->read_page() / ecc->write_page().
This will allow direct transfer between the buffer and the device by DMA.

But, this does not work for Denali if use_bufpoi is set in nand_do_read_ops().


In the following code in nand_scan_tail(),

        if (!(chip->options & NAND_OWN_BUFFERS)) {
                nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
                                + mtd->oobsize * 3, GFP_KERNEL);
                if (!nbuf)
                        return -ENOMEM;
                nbuf->ecccalc = (uint8_t *)(nbuf + 1);
                nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
                nbuf->databuf = nbuf->ecccode + mtd->oobsize;

                chip->buffers = nbuf;


chip->buffers->databuf has no guarantee for DMA'able alignment.
(actually it has unwanted offset 0xc because sizeof(*nbuf) == 0xc on
32bit systems)

If we could change the code as follows,

                nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
                nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
                nbuf->databuf = kmalloc(mtd->writesize + mtd->oobsize,
GFP_KERNEL);

chip->buffers->databuf would have DMA'able alignment in most cases
without NAND_OWN_BUFFERS.  (but, I am not sure if this is a good idea)


So, the idea of NAND_OWN_BUFFERS is that
drivers should allocate own buffers if they need to perform DMA-mapping
in read_page(), write_page(), right?


However, "git grep NAND_OWN_BUFFERS" shows
cafe_nand.c is the only driver that does so.

On the other hand, "git grep dma_map_single" has more hits,
i.e. some drivers perform dma_map_single() for read/write without
NAND_OWN_BUFFERS.

I have no idea how they are working.



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
