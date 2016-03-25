From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mtd: nand: denali: allow to override max_banks from DT
 property
Date: Fri, 25 Mar 2016 09:37:59 -0500
Message-ID: <20160325143759.GA24596@rob-hp-laptop>
References: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458822277-31428-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 09:24:37PM +0900, Masahiro Yamada wrote:
> Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
> changed in revision 5.1") supported the new encoding of the "n_banks"
> bits of the "features" register, but there is an unfortunate case
> that is not covered by that commit.
> 
> Panasonic (its System LSI division is now Socionext) bought several
> versions of this IP.  The IP released for Panasonic around Feb. 2012
> is revision 5 and uses the old encoding for n_banks (2 << n_banks).
> While the one released around Nov. 2012 is also revision 5, but it
> uses the new encoding (1 << n_banks).
> 
> The revision register cannot distinguish these two incompatible
> hardware.  I guess this IP series is not well-organized.  I could not
> find any alternative but giving max_banks from DT property.
> 
> This commit works around the problem by allowing DT to set the
> max_banks forcibly.  Of course, this DT property can be optional if
> the auto detection based on the hardware registers works well.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/mtd/nand/denali.c                             | 3 ++-
>  drivers/mtd/nand/denali_dt.c                          | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
