From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v4 2/3] usb: phy: msm: fix connect/disconnect bug for
 dragonboard OTG port
Date: Sat, 21 Nov 2015 18:23:59 -0800
Message-ID: <20151122022359.GL30882@usrtlx11787.corpusers.net>
References: <1448063240-2739-1-git-send-email-tim.bird@sonymobile.com>
 <1448063240-2739-2-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448063240-2739-2-git-send-email-tim.bird@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tim Bird <tim.bird@sonymobile.com>
Cc: "Peter.Chen@freescale.com" <Peter.Chen@freescale.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "balbi@ti.com" <balbi@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tbird20d@gmail.com" <tbird20d@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri 20 Nov 15:47 PST 2015, Tim Bird wrote:

> Add support for async_irq to wake up driver from low power mode.
> Without this, the power management code never calls resume.
> Remove a spurious interrupt enable in the driver resume function.
> 
> Signed-off-by: Tim Bird <tim.bird@sonymobile.com>

Sorry Tim for missing these things and not jumping into the discussion
before.

> ---
>  drivers/usb/phy/phy-msm-usb.c | 17 ++++++++++++++++-
>  include/linux/usb/msm_hsusb.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
[..]
> @@ -1732,6 +1731,12 @@ static int msm_otg_probe(struct platform_device *pdev)
>  		return motg->irq;
>  	}
>  
> +	motg->async_irq = platform_get_irq_byname(pdev, "async");
> +	if (motg->async_irq < 0) {
> +		dev_err(&pdev->dev, "platform_get_irq for async irq failed\n");

This is optional, so I must object to this being dev_err(). Except for
development purposes logging this is useless, can't we make it a
dev_dbg?

> +		motg->async_irq = 0;
> +	}
> +
[..]
> diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_hsusb.h
> index 8c8f685..08c67a3 100644
> --- a/include/linux/usb/msm_hsusb.h
> +++ b/include/linux/usb/msm_hsusb.h
> @@ -164,6 +164,7 @@ struct msm_otg {
>  	struct usb_phy phy;
>  	struct msm_otg_platform_data *pdata;
>  	int irq;
> +	int async_irq;

This should be added to the kerneldoc above.

>  	struct clk *clk;
>  	struct clk *pclk;
>  	struct clk *core_clk;

Regards,
Bjorn
