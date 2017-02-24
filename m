From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v1 1/3] extcon: int3496: Propagate error code of
 gpiod_to_irq()
Date: Fri, 24 Feb 2017 10:09:49 +0900
Message-ID: <58AF87DD.3030308@samsung.com>
References: <CGME20170223103303epcas3p496d768c3638368e98a9f6d95cb13380b@epcas3p4.samsung.com>
 <20170223103156.109643-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170223103156.109643-1-andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Cohen <david.a.cohen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017년 02월 23일 19:31, Andy Shevchenko wrote:
> gpiod_to_irq() doesn't return 0. Thus, we just adjust condition and
> replace -EINVAL by actual error code it returns.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/extcon/extcon-intel-int3496.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
> index a3131b036de6..38eb6cab938f 100644
> --- a/drivers/extcon/extcon-intel-int3496.c
> +++ b/drivers/extcon/extcon-intel-int3496.c
> @@ -100,9 +100,9 @@ static int int3496_probe(struct platform_device *pdev)
>  	}
>  
>  	data->usb_id_irq = gpiod_to_irq(data->gpio_usb_id);
> -	if (data->usb_id_irq <= 0) {
> +	if (data->usb_id_irq < 0) {
>  		dev_err(dev, "can't get USB ID IRQ: %d\n", data->usb_id_irq);
> -		return -EINVAL;
> +		return data->usb_id_irq;
>  	}
>  
>  	data->gpio_vbus_en = devm_gpiod_get_index(dev, "vbus en",
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
