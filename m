From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v10 1/5] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Date: Wed, 26 Aug 2015 18:10:05 -0700
Message-ID: <a2060e9f1ad9f26e508af64549da52e7@agner.ch>
References: <1438594050-4595-1-git-send-email-stefan@agner.ch>
 <1438594050-4595-2-git-send-email-stefan@agner.ch>
 <20150825203412.GM81844@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150825203412.GM81844-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2015-08-25 13:34, Brian Norris wrote:
> One more thing...
> 
> On Mon, Aug 03, 2015 at 11:27:26AM +0200, Stefan Agner wrote:
>> --- /dev/null
>> +++ b/drivers/mtd/nand/vf610_nfc.c
>> @@ -0,0 +1,645 @@
> ...
>> +struct vf610_nfc {
>> +	struct mtd_info mtd;
>> +	struct nand_chip chip;
>> +	struct device *dev;
>> +	void __iomem *regs;
>> +	struct completion cmd_done;
>> +	uint buf_offset;
>> +	int page_sz;
> 
> AFAICT (even with the 2nd patch), you never really use this field. You
> just set it/increment it, but don't use it for anything. Kill it?

It is used in the write path, I think I meant to use it for subpage
writes, when I thought it would just mean to transfer only parts of the
page to the controller.

However, as the subpage discussion basically concluded in not using it
for now on this controller, we can as well transfer the complete page
(page_sz). Or is there another case in which vf610_nfc_write_buf could
be called with less than page_sz?

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
