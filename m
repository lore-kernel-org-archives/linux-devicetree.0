From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 15/31] mtd: nand: pxa3xx: Use a completion to signal
 device ready
Date: Thu, 14 Nov 2013 10:39:23 -0800
Message-ID: <20131114183923.GO9468@ld-irv-0074.broadcom.com>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383837455-30721-16-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383837455-30721-16-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 07, 2013 at 12:17:19PM -0300, Ezequiel Garcia wrote:
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -863,21 +867,28 @@ static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
>  {
>  	struct pxa3xx_nand_host *host = mtd->priv;
>  	struct pxa3xx_nand_info *info = host->info_data;
> +	int ret;
> +
> +	/* Need to wait? */
> +	if (!info->is_ready) {
> +		ret = wait_for_completion_timeout(&info->dev_ready,
> +				CHIP_DELAY_TIMEOUT);
> +		if (!ret) {
> +			dev_err(&info->pdev->dev, "Ready time out!!!\n");
> +			return NAND_STATUS_FAIL;
> +		}
> +		info->is_ready = 1;

Shouldn't the is_ready=1 line to be above the if (!ret) condition? I
think you want to set is_ready=1 in either case (success or timeout).
With this code, any timeout will cause subsequent waitfunc()'s to block,
even if they are never going to catch an interrupt.

I think this kind of mistake is easier to make now, since the 'is_ready'
field isn't properly descriptive any more. It doesn't represent "is the
device ready"; it represents "is there a pending command on which I need
to wait". (I don't care if you change the name; I'm just pointing this
out.)

> +	}
>  

I think all the other patches up to this one are good. I may push them
to l2-mtd.git now, unless you object.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
