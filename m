From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v11 2/5] mtd: nand: vf610_nfc: add hardware BCH-ECC
 support
Date: Tue, 01 Sep 2015 09:55:48 -0700
Message-ID: <575f176ee9d5e6d785ed2352887d5336@agner.ch>
References: <1440722100-25388-1-git-send-email-stefan@agner.ch>
 <1440722100-25388-3-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440722100-25388-3-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2015-08-27 17:34, Stefan Agner wrote:
> +static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
> +					 uint8_t *oob, int page)
> +{
> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	u32 ecc_status_off = NFC_MAIN_AREA(0) + ECC_SRAM_ADDR + ECC_STATUS;
> +	u8 ecc_status;
> +	u8 ecc_count;
> +	int flips;
> +	int flips_threshold = nfc->chip.ecc.strength / 2;
> +
> +	ecc_status = vf610_nfc_read(nfc, ecc_status_off) & 0xff;
> +	ecc_count = ecc_status & ECC_STATUS_ERR_COUNT;
> +
> +	if (!(ecc_status & ECC_STATUS_MASK))
> +		return ecc_count;
> +
> +	/* Read OOB without ECC unit enabled */
> +	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
> +	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
> +
> +	/*
> +	 * On an erased page, bit count (including OOB) should be zero or
> +	 * at least less then half of the ECC strength.
> +	 */
> +	flips = count_written_bits(dat, nfc->chip.ecc.size, flips_threshold);
> +	flips += count_written_bits(oob, mtd->oobsize, flips_threshold);
> +
> +	if (unlikely(flips > flips_threshold))
> +		return -EINVAL;
> +
> +	/* Erased page. */
> +	memset(dat, 0xff, nfc->chip.ecc.size);
> +	memset(oob, 0xff, mtd->oobsize);
> +	return 0;

I guess I should return the amount of bitflips here. Will send out a v12
today.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
