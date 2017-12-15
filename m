From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-utgard: add
 rockchip,rk3328-mali compatible
Date: Fri, 15 Dec 2017 14:30:41 -0600
Message-ID: <20171215203041.lm22qrdt2dojoae3@rob-hp-laptop>
References: <20171209000738.32187-1-heiko@sntech.de>
 <20171209000738.32187-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171209000738.32187-2-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 09, 2017 at 01:07:36AM +0100, Heiko Stuebner wrote:
> The rk3328 quad-core Cortex A53 uses a Mali-450MP2 with 2 PPs, so
> add a compatible for it.
> 
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 1 +
>  1 file changed, 1 insertion(+)

For the series,

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Though I don't think it's really necessary to enable the gpu per board 
as it has no pinout. Default enabled would be better IMO.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
