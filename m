From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v8 07/13] usb: chipidea: fix phy handling
Date: Tue, 18 Nov 2014 12:47:28 +0800
Message-ID: <20141118044727.GB15650@shlinux2>
References: <1416231347-27193-1-git-send-email-antoine.tenart@free-electrons.com>
 <1416231347-27193-8-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416231347-27193-8-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 02:35:41PM +0100, Antoine Tenart wrote:
> The generic plaftorm device for ChipIdea drivers is probed by calling
> ci_hdrc_probe. The device structure used is not the one of the specific
> ChipIdea driver but the one of the generic ChipIdea platform device.
> 
> This results in not being able to probe the PHYs as we're not using the
> right device structure. Since all ChipIdea drivers are retrieving their
> PHYs in their specific driver code, this didn't impact any of them yet.
> 
> Fixes it using the right device structure (dev->parent).
> 
> Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/usb/chipidea/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index de1e4a84aa93..068e0c6acc3f 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -686,8 +686,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  	} else if (ci->platdata->usb_phy) {
>  		ci->usb_phy = ci->platdata->usb_phy;
>  	} else {
> -		ci->phy = devm_phy_get(dev, "usb-phy");
> -		ci->usb_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
> +		ci->phy = devm_phy_get(dev->parent, "usb-phy");
> +		ci->usb_phy = devm_usb_get_phy(dev->parent, USB_PHY_TYPE_USB2);
>  
>  		/* if both generic PHY and USB PHY layers aren't enabled */
>  		if (PTR_ERR(ci->phy) == -ENOSYS &&
> -- 
> 2.1.0
> 

Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
