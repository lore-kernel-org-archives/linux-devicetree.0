From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/2] usb: phy: msm: fix connect/disconnect bug for
 dragonboard OTG port
Date: Wed, 11 Nov 2015 11:14:46 +0800
Message-ID: <20151111031445.GA8826@shlinux2>
References: <1447202811-3429-1-git-send-email-tim.bird@sonymobile.com>
 <1447202811-3429-2-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447202811-3429-2-git-send-email-tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 10, 2015 at 04:46:51PM -0800, Tim Bird wrote:
> This fixes a bug where if you disconnect and re-connect the USB cable,
> the gadget driver stops working.
> 
> Add support for async_irq to wake up driver from low power mode.
> Without this, the power management code never calls resume.
> Also, have the phy driver kick the gadget driver (chipidea otg)
> by having the chipidea driver register with it, for vbus connect
> notifications.
> 
> Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  drivers/usb/chipidea/udc.c    |  6 ++++++
>  drivers/usb/phy/phy-msm-usb.c | 16 ++++++++++++++++
>  include/linux/usb/msm_hsusb.h |  1 +
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 8223fe7..06234cd 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1890,6 +1890,12 @@ static int udc_start(struct ci_hdrc *ci)
>  
>  	ci->gadget.ep0 = &ci->ep0in->ep;
>  
> +	if (ci->usb_phy) {
> +		retval = otg_set_peripheral(ci->usb_phy->otg, &ci->gadget);
> +		if (retval)
> +			goto destroy_eps;
> +	}
> +
>  	retval = usb_add_gadget_udc(dev, &ci->gadget);
>  	if (retval)
>  		goto destroy_eps;

Although it looks no affect for other drivers, it is better you
can split patches between controller and phy, then I can have a test.

In fact, most of phy-msm-usb.c's implementations (except USB PHY related)
are included in chipidea drivers, hope you can try it in future.

> diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
> index 80eb991..eb80f92 100644
> --- a/drivers/usb/phy/phy-msm-usb.c
> +++ b/drivers/usb/phy/phy-msm-usb.c
> @@ -1731,6 +1731,12 @@ static int msm_otg_probe(struct platform_device *pdev)
>  		return motg->irq;
>  	}
>  
> +	motg->async_irq = platform_get_irq_byname(pdev, "async_irq");
> +	if (motg->async_irq < 0) {
> +		dev_info(&pdev->dev, "platform_get_irq for async_irq failed\n");
> +		motg->async_irq = 0;
> +	}
> +

dev_err

>  	regs[0].supply = "vddcx";
>  	regs[1].supply = "v3p3";
>  	regs[2].supply = "v1p8";
> @@ -1780,6 +1786,16 @@ static int msm_otg_probe(struct platform_device *pdev)
>  		goto disable_ldo;
>  	}
>  
> +	if (motg->async_irq) {
> +		ret = devm_request_irq(&pdev->dev, motg->async_irq,
> +				      msm_otg_irq, IRQF_TRIGGER_RISING,
> +				      "msm_otg", motg);
> +		if (ret) {
> +			dev_err(&pdev->dev, "request irq failed (ASYNC INT)\n");
> +			goto disable_ldo;
> +		}
> +	}
> +
>  	phy->init = msm_phy_init;
>  	phy->set_power = msm_otg_set_power;
>  	phy->notify_disconnect = msm_phy_notify_disconnect;
> diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_hsusb.h
> index 8c8f685..08c67a3 100644
> --- a/include/linux/usb/msm_hsusb.h
> +++ b/include/linux/usb/msm_hsusb.h
> @@ -164,6 +164,7 @@ struct msm_otg {
>  	struct usb_phy phy;
>  	struct msm_otg_platform_data *pdata;
>  	int irq;
> +	int async_irq;
>  	struct clk *clk;
>  	struct clk *pclk;
>  	struct clk *core_clk;
> -- 
> 1.8.2.2
> 

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
