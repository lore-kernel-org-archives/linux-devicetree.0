From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: always assign of_node in mfd_add_device()
Date: Mon, 06 Jan 2014 11:12:15 -0700
Message-ID: <52CAF1FF.9090709@wwwdotorg.org>
References: <1386626809-6251-1-git-send-email-swarren@wwwdotorg.org> <20131211092435.GC16780@lee--X1> <52B32C05.5010204@wwwdotorg.org> <20131220142530.GK3709@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131220142530.GK3709@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/20/2013 07:25 AM, Lee Jones wrote:
> Hi Stephen,
> 
> Please let me know if this is suitable and I can keep your Ack.

This patch doesn't seem to have made it into next-20140106. I assume
that's just because of the holidays, not because it was forgotten?

> ----
> 
> mfd: Revert "mfd: Always assign of_node in mfd_add_device()"
> 
> This reverts commit 68044bee13770918e0b28dd44aa98c889ec7558f.
> 
> We've had confirmed reports of this patch causing unforeseen issues
> with existing MFD users. It has been agreed by the original author
> and myself that reversion is the best solution.
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 32e8d47..2676492 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -117,8 +117,6 @@ static int mfd_add_device(struct device *parent, int id,
>  			}
>  		}
>  	}
> -	if (!pdev->dev.of_node)
> -		pdev->dev.of_node = parent->of_node;
>  
>  	if (cell->pdata_size) {
>  		ret = platform_device_add_data(pdev,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
