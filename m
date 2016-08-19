From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: sort Rockchip vop compatible by
 chip's number
Date: Fri, 19 Aug 2016 08:51:30 -0500
Message-ID: <20160819135130.GA5345@rob-hp-laptop>
References: <loom.20160602T085439-162@post.gmane.org>
 <1471554918-22353-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471554918-22353-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 18, 2016 at 02:15:18PM -0700, Sean Paul wrote:
> From: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Reorder the compatible vop devices to be sorted by chip number
> in ascending order.
> 
> Reviewed-by: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> [seanpaul added commit description per tfiga's review]
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> 
> Resending to add devicetree list
> 
> Changes in v3:
> 	- Updated commit message (Tomasz Figa)
> 
>  Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
