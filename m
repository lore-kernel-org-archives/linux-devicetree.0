From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v9 2/5] mtd: nand: vf610_nfc: add hardware BCH-ECC support
Date: Sat, 01 Aug 2015 01:35:52 +0200
Message-ID: <9dd7975072cf16dd6ea1947bd4ae830a@agner.ch>
References: <1438361581-2702-1-git-send-email-stefan@agner.ch>
 <1438361581-2702-3-git-send-email-stefan@agner.ch>
 <20150731230901.GK10676@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150731230901.GK10676-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On 2015-08-01 01:09, Brian Norris wrote:
<snip>
>> +static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat)
>> +{
>> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
>> +	u8 ecc_status;
>> +	u8 ecc_count;
>> +	int flip;
>> +
>> +	ecc_status = __raw_readb(nfc->regs + ECC_SRAM_ADDR * 8 + ECC_OFFSET);
>> +	ecc_count = ecc_status & ECC_ERR_COUNT;
>> +	if (!(ecc_status & ECC_STATUS_MASK))
>> +		return ecc_count;
>> +
>> +	/*
>> +	 * On an erased page, bit count should be zero or at least
>> +	 * less then half of the ECC strength
>> +	 */
>> +	flip = count_written_bits(dat, nfc->chip.ecc.size, ecc_count);
> 
> Sorry I didn't notice this earlier, but it appears you are falling into
> the same trap that almost everyone else is -- it is not sufficient to
> check just the page area; you also need to check the OOB. Suppose that
> a MTD user wrote mostly-0xff data to the page, then the page accumulates
> bitflips in the spare area and a few in the page area, such that
> eventually HW ECC can't correct them. If there are few enough zero bits
> in the data area, you will mistakenly think that this is a blank page
> below, and memset() it to 0xff. That would be disastrous!
> 
> Fortunately, your code is otherwise quite well structured and looks
> good. A tip below.
> 
>> +
>> +	if (flip > ecc_count && flip > (nfc->chip.ecc.strength / 2))
>> +		return -1;
>> +
>> +	/* Erased page. */
>> +	memset(dat, 0xff, nfc->chip.ecc.size);
>> +	return 0;
>> +}
>> +
>> +static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>> +				uint8_t *buf, int oob_required, int page)
>> +{
>> +	int eccsize = chip->ecc.size;
>> +	int stat;
>> +
>> +	vf610_nfc_read_buf(mtd, buf, eccsize);
>> +
>> +	if (oob_required)
>> +		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> 
> To fix the bitflips issue above, you'll just want to unconditionally
> read the OOB (it's fine to ignore 'oob_required') and...
> 
>> +
>> +	stat = vf610_nfc_correct_data(mtd, buf);
> 
> ...pass in chip->oob_poi as a third argument.
> 

Hm, this probably will have an effect on performance, since we usually
omit the OOB if not requested. I could fetch the OOB from the NAND
controllers SRAM only if necessary (if HW ECC status is not ok...). Does
this sound reasonable?

>> +
>> +	if (stat < 0)
>> +		mtd->ecc_stats.failed++;
>> +	else
>> +		mtd->ecc_stats.corrected += stat;
> 
> You've got another problem here: ecc.read_page() should be returning
> 'max_bitflips' here. So, since you have a single ECC region, this block
> should probably be:
> 
> 	if (stat < 0) {
> 		mtd->ecc_stats.failed++;
> 		return 0;
> 	} else {
> 		mtd->ecc_stats.corrected += stat;
> 		return stat;
> 	}
> 

Ok, will change that.

--
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
