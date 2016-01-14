From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/5] mtd: atmel_nand: Support variable RB_EDGE interrupts
Date: Thu, 14 Jan 2016 11:16:19 +0100
Message-ID: <CAGkQfmMQTBVzOoE3BTyvg73NKjtGD_0veV_zb_jLutk-6bcqGw@mail.gmail.com>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-3-git-send-email-romain.izard.pro@gmail.com> <20160113191409.5cd0dc82@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113191409.5cd0dc82@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

2016-01-13 19:14 GMT+01:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
>> index 9d71f9e6a8de..e5d7e7e63f49 100644
>> --- a/drivers/mtd/nand/atmel_nand.c
>> +++ b/drivers/mtd/nand/atmel_nand.c
>> @@ -67,6 +67,10 @@ struct atmel_nand_caps {
>>       bool pmecc_correct_erase_page;
>>  };
>>
>> +struct atmel_nand_nfc_priv {
>
> Can you rename this struct into atmel_nfc_caps to be consistant with the
> atmel_nand_caps?
>
>> +     uint32_t rb_edge;
>
> Actually, AFAIU, it's not encoding the type of edges, but the available
> native R/B lines (by native I mean the R/B lines directly connected to
> the NFC IP).
> I suggest renaming this field avail_rb_lines, and making it a bitfield
> (one bit per possible R/B line).
>

It's already a bitfield in the end: it's the mask for the interrupt status
register. It might have been better if it were called rb_edge_mask.

>> +};
>> +
>>  /* oob layout for large page size
>>   * bad block info is on bytes 0 and 1
>>   * the bytes have to be consecutives to avoid
>> @@ -111,6 +115,7 @@ struct atmel_nfc {
>>       /* Point to the sram bank which include readed data via NFC */
>>       void                    *data_in_sram;
>>       bool                    will_write_sram;
>> +     uint32_t                rb_edge;
>
> Replace this by
>         const struct atmel_nfc_caps *caps;
>
> so that next time you have a per-SoC particularity, you can just add it
> to your struct atmel_nfc_caps without adding new fields to atmel_nfc.
>

I'm reluctant about this, but I will do it. For me, we are exchanging
a single probe-time copy to indirections in each interrupt handler for some
unspecified future user. Let's hope the tradeoff is worth it.

>>  };
>>  static struct atmel_nfc      nand_nfc;
>>
>> @@ -1675,9 +1680,9 @@ static irqreturn_t hsmc_interrupt(int irq, void *dev_id)
>>               nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_XFR_DONE);
>>               ret = IRQ_HANDLED;
>>       }
>> -     if (pending & NFC_SR_RB_EDGE) {
>> +     if (pending & host->nfc->rb_edge) {
>>               complete(&host->nfc->comp_ready);
>> -             nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_RB_EDGE);
>> +             nfc_writel(host->nfc->hsmc_regs, IDR, host->nfc->rb_edge);
>
> How about creating a macro that would generate the appropriate bitmask
> for you?
>
> Something like
>
> #define NFC_SR_RB_EDGE_MASK(x)  ((x) << 24)
>

It's already so verbose, it will make everything longer. Once the member name
contains the 'mask' part, all the information will be there.


>> diff --git a/drivers/mtd/nand/atmel_nand_nfc.h b/drivers/mtd/nand/atmel_nand_nfc.h
>> index 4d5d26221a7e..2cd9c57b1e53 100644
>> --- a/drivers/mtd/nand/atmel_nand_nfc.h
>> +++ b/drivers/mtd/nand/atmel_nand_nfc.h
>> @@ -42,7 +42,10 @@
>>  #define              NFC_SR_UNDEF            (1 << 21)
>>  #define              NFC_SR_AWB              (1 << 22)
>>  #define              NFC_SR_ASE              (1 << 23)
>> -#define              NFC_SR_RB_EDGE          (1 << 24)
>> +#define              NFC_SR_RB_EDGE0         (1 << 24)
>> +#define              NFC_SR_RB_EDGE1         (1 << 25)
>> +#define              NFC_SR_RB_EDGE2         (1 << 26)
>> +#define              NFC_SR_RB_EDGE3         (1 << 27)
>
> Please replace those 4 definitions by:
>
> #define                 NFC_SR_RB_EDGE(x)       BIT(x + 24)
>

The whole file could be rewritten in this form, but I see this as a
zero-value proposition. I believe it is best to keep with local
consistency. In fact, I will rather remove RB_EDGE1 & RB_EDGE2, as
those are not mentioned in the datasheets.


Best regards,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
