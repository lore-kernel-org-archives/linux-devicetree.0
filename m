From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RESEND PATCH 0/3] mtd: nand: standardize ECC maximization
Date: Fri, 16 Sep 2016 15:08:49 +0200
Message-ID: <20160916150849.4a3ca0bb@bbrezillon>
References: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465398264-8202-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed,  8 Jun 2016 17:04:21 +0200
Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hello,
> 
> Sorry for the noise, but I forgot to add DT maintainers in Cc.
> 
> This series aims at standardizing a feature already supported by
> some NAND controller drivers: setting the maximum ECC strength
> based on the OOB area size instead of using the ECC strength/step_size
> information retrieved from the DT or NAND detection code.
> 
> This is particularly useful when the NAND device is used in by a
> FS/wear-leveling layer that is not using the OOB area at all (this is
> the case of UBI).
> 
> Note that drivers already implementing this kind of logic are not
> converted to the new approach (because of backward compatibility
> concern), but new drivers or drivers that do not already implement
> this 'ECC maximization' logic are encouraged to do it.

Applied.

> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (3):
>   mtd: nand: Add an option to maximize the ECC strength
>   mtd: nand: Support maximizing ECC when using software BCH
>   mtd: nand: sunxi: Support ECC maximization
> 
>  Documentation/devicetree/bindings/mtd/nand.txt |  9 ++++++++
>  drivers/mtd/nand/nand_base.c                   | 23 ++++++++++++++++++++
>  drivers/mtd/nand/sunxi_nand.c                  | 29 ++++++++++++++++++++++++++
>  include/linux/mtd/nand.h                       |  1 +
>  4 files changed, 62 insertions(+)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
