From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] of: Deep-copy names of platform devices
Date: Tue, 12 Aug 2014 18:46:36 -0700
Message-ID: <53EAC37C.4020203@codeaurora.org>
References: <1407891444-7311-1-git-send-email-stepanm@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1407891444-7311-1-git-send-email-stepanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stepan Moskovchenko <stepanm@codeaurora.org>
Cc: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/12/14 17:57, Stepan Moskovchenko wrote:
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index f685e55..3e116f6 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -54,7 +54,7 @@ int of_device_add(struct platform_device *ofdev)
>
>  	/* name and id have to be set so that the platform bus doesn't get
>  	 * confused on matching */
> -	ofdev->name = dev_name(&ofdev->dev);
> +	ofdev->name = kstrdup(dev_name(&ofdev->dev), GFP_KERNEL);
>  	ofdev->id = -1;
>
>  	/* device_add will assume that this device is on the same node as
> @@ -76,6 +76,7 @@ EXPORT_SYMBOL(of_device_register);
>  void of_device_unregister(struct platform_device *ofdev)
>  {
>  	device_unregister(&ofdev->dev);
> +	kfree(ofdev->name);

This probably ought to be swapped because we don't know if ofdev isn't
pointing to freed memory after device_unregister().

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
