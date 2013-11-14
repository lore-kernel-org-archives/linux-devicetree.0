From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] mfd: syscon: Allow to using subdevices
Date: Thu, 14 Nov 2013 14:46:00 +0000
Message-ID: <20131114144559.GC28328@e106331-lin.cambridge.arm.com>
References: <1384433523-30602-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1384433523-30602-1-git-send-email-shc_work@mail.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 14, 2013 at 12:52:03PM +0000, Alexander Shiyan wrote:
> This patch adds support for using subdevices within syscon node.
> Primary usage of this is describe all devices with same memory
> region in one container.

I think if you need to do this, you should not be using syscon. What
exactly is your use-case?

I don't like the idea of treating syscon like a bus or container in this
fashion.

Mark.

> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/mfd/syscon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 71841f9..6e9244a 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -152,6 +152,9 @@ static int syscon_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, syscon);
>  
> +	if (of_platform_populate(dev->of_node, NULL, NULL, dev))
> +		dev_warn(dev, "Fail to create subdevices\n");
> +
>  	dev_info(dev, "regmap %pR registered\n", res);
>  
>  	return 0;
> -- 
> 1.8.1.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
