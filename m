From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v12 2/5] mtd: nand: vf610_nfc: add hardware BCH-ECC
 support
Date: Tue, 29 Sep 2015 13:57:27 -0700
Message-ID: <20150929205727.GP31505@google.com>
References: <1441242397-870-1-git-send-email-stefan@agner.ch>
 <1441242397-870-3-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441242397-870-3-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pushed this patch to l2-mtd.git, as it looks pretty much good. Although,
I'd like raw read support...

On Wed, Sep 02, 2015 at 06:06:34PM -0700, Stefan Agner wrote:
> This adds hardware ECC support using the BCH encoder in the NFC IP.
> The ECC encoder supports up to 32-bit correction by using 60 error
> correction bytes. There is no sub-page ECC step, ECC is calculated
> always accross the whole page (up to 2k pages).
> 
> Limitations:
> - HW ECC: Only 2K page with 64+ OOB.
> - HW ECC: Only 24 and 32-bit error correction implemented.
> 
> Raw writes have been tested using the generic nand_write_page_raw
> implementation. However, raw reads are currently not possible
> because the controller need to know whether we are going to use
> the ECC mode already at NAND_CMD_READ0 command time. At this point
> we do not have the information whether it is a raw read or a
> regular read at driver level...

Hmm, can you get this in ecc.read_page_raw()?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
