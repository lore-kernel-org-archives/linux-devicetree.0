From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 2/5] mtd: nand: vf610_nfc: add hardware BCH-ECC support
Date: Fri, 31 Jul 2015 16:47:18 -0700
Message-ID: <20150731234718.GO10676@google.com>
References: <1438361581-2702-1-git-send-email-stefan@agner.ch>
 <1438361581-2702-3-git-send-email-stefan@agner.ch>
 <20150731230901.GK10676@google.com>
 <9dd7975072cf16dd6ea1947bd4ae830a@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9dd7975072cf16dd6ea1947bd4ae830a-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 01, 2015 at 01:35:52AM +0200, Stefan Agner wrote:
> On 2015-08-01 01:09, Brian Norris wrote:

> >> +static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >> +				uint8_t *buf, int oob_required, int page)
> >> +{
> >> +	int eccsize = chip->ecc.size;
> >> +	int stat;
> >> +
> >> +	vf610_nfc_read_buf(mtd, buf, eccsize);
> >> +
> >> +	if (oob_required)
> >> +		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> > 
> > To fix the bitflips issue above, you'll just want to unconditionally
> > read the OOB (it's fine to ignore 'oob_required') and...
> > 
> >> +
> >> +	stat = vf610_nfc_correct_data(mtd, buf);
> > 
> > ...pass in chip->oob_poi as a third argument.
> > 
> 
> Hm, this probably will have an effect on performance, since we usually
> omit the OOB if not requested.

You could test :) I don't really like performance claims without tests.
(I say this because I added the oob_required flag myself, but just for
functional purposes, not performance. Many drivers got by just fine by
always copying the OOB data.)

> I could fetch the OOB from the NAND
> controllers SRAM only if necessary (if HW ECC status is not ok...). Does
> this sound reasonable?

That does.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
