From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 5/7] mtd: nand: gpmi: add GPMI NAND support for i.MX7D
Date: Sat, 23 Jan 2016 14:58:42 -0800
Message-ID: <20160123225842.GI24744@localhost>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-6-git-send-email-b45815@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449096466-18064-6-git-send-email-b45815-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Han Xu <b45815-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shijie.huang-5wv7dgnIgG8@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 02, 2015 at 04:47:44PM -0600, Han Xu wrote:
> support GPMI NAND on i.MX7D
> 
> Signed-off-by: Han Xu <b45815-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 14 +++++++-------
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 10 ++++++----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 27 ++++++++++++++++++++++-----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  7 +++++--
>  4 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> index 05bb91f..53e58bc 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h

...

> @@ -575,6 +581,10 @@ static char *extra_clks_for_mx6q[GPMI_CLK_MAX] = {
>  	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
>  };
>  
> +static char *extra_clks_for_mx7d[GPMI_CLK_MAX] = {
> +	"gpmi_bch_apb",
> +};
> +
>  static int gpmi_get_clks(struct gpmi_nand_data *this)
>  {
>  	struct resources *r = &this->resources;
> @@ -592,6 +602,8 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
>  	/* Get extra clocks */
>  	if (GPMI_IS_MX6(this))
>  		extra_clks = extra_clks_for_mx6q;
> +	if (GPMI_IS_MX7(this))
> +		extra_clks = extra_clks_for_mx7d;
>  	if (!extra_clks)
>  		return 0;
>  

...

It looks like these clock names were never documented. Shouldn't this be
part of Documentation/devicetree/bindings/mtd/gpmi-nand.txt?

Otherwise, the patch looks good to me.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
