From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v2 5/6] usb: chipidea: allow multiple instances to use
 default ci_default_pdata
Date: Thu, 21 May 2015 10:03:15 +0800
Message-ID: <20150521020314.GB26837@shlinux2>
References: <1432087805-16671-1-git-send-email-robh@kernel.org>
 <1432087805-16671-6-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432087805-16671-6-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 09:10:04PM -0500, Rob Herring wrote:
> Currently, ci_default_pdata is common to all instances of the driver and
> gets modified by the core driver code. This is bad if there are multiple
> instances of the device with different settings such as the phy type. Fix
> this by making a copy of the default platform_data.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Peter Chen <Peter.Chen@freescale.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
>  drivers/usb/chipidea/ci_hdrc_usb2.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
> index 45844c9..73d9906 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -25,11 +25,13 @@ struct ci_hdrc_usb2_priv {
>  	struct clk		*clk;
>  };
>  
> -static struct ci_hdrc_platform_data ci_default_pdata = {
> +static const struct ci_hdrc_platform_data ci_default_pdata = {
>  	.capoffset	= DEF_CAPOFFSET,
>  	.flags		= CI_HDRC_DISABLE_STREAMING,
>  };
>  
> +static const struct of_device_id ci_hdrc_usb2_of_match[];
> +

unrelated change?

Others are ok.

>  static int ci_hdrc_usb2_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -37,8 +39,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
>  	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
>  	int ret;
>  
> -	if (!ci_pdata)
> -		ci_pdata = &ci_default_pdata;
> +	if (!ci_pdata) {
> +		ci_pdata = devm_kmalloc(dev, sizeof(*ci_pdata), GFP_KERNEL);
> +		*ci_pdata = ci_default_pdata;	/* struct copy */
> +	}
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> -- 
> 2.1.0
> 

-- 

Best Regards,
Peter Chen
