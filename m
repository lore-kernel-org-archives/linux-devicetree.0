From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] mtd: brcmnand: do not make local variable static
Date: Mon, 18 May 2015 11:13:09 -0700
Message-ID: <20150518181309.GQ11598@ld-irv-0074>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-3-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431877266-28566-3-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, May 17, 2015 at 05:41:01PM +0200, Hauke Mehrtens wrote:
> Remove static in front of ctrl. This variable should not be shared
> between different instances of brcmnand_probe(), it should be local to
> this function and stored on the stack.
> 
> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index bae30ab..a48ad49 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -2069,7 +2069,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *dn = dev->of_node, *child;
> -	static struct brcmnand_controller *ctrl;
> +	struct brcmnand_controller *ctrl;
>  	struct resource *res;
>  	int ret;
>  

Good catch. Applied this to l2-mtd.git. I'll come back to the others.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
