From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH 1/3] mtd: nand: Add an option to maximize the ECC
 strength
Date: Fri, 10 Jun 2016 09:04:41 -0500
Message-ID: <20160610140441.GA4743@rob-hp-laptop>
References: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465398264-8202-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465398264-8202-2-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 08, 2016 at 05:04:22PM +0200, Boris Brezillon wrote:
> The generic NAND DT bindings allows one to tweak the ECC strength and
> step size to their need. It can be used to lower the ECC strength to
> match a bootloader/firmware config, but might also be used to get a better
> reliability.
> 
> In the latter case, the user might want to use the maximum ECC strength
> without having to explicitly calculate the exact value (this value not
> only depends on the OOB size, but also on the NAND controller, and can
> be tricky to extract).
> 
> Add a generic 'nand-ecc-maximize' DT property and the associated
> NAND_ECC_MAXIMIZE flag, to let ECC controller drivers select the best
> ECC strength and step-size on their own.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 9 +++++++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/mtd/nand/nand_base.c                   | 3 +++
>  include/linux/mtd/nand.h                       | 1 +
>  3 files changed, 13 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
