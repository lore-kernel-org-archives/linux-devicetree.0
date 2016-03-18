From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] net: arc_emac: add phy-reset-* are optional for
 device tree
Date: Fri, 18 Mar 2016 14:21:17 -0500
Message-ID: <20160318192116.GA5224@rob-hp-laptop>
References: <1457693731-6966-1-git-send-email-wxt@rock-chips.com>
 <1457693731-6966-3-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457693731-6966-3-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 06:55:27PM +0800, Caesar Wang wrote:
> This patch adds the following property for arc_emac.
> 
> 1) phy-reset-gpios:
> The phy-reset-gpios is an optional property for arc emac device tree boot.
> Change the binding document to match the driver code.
> 
> 2) phy-reset-duration:
> Different boards may require different phy reset duration. Add property
> phy-reset-duration for device tree probe, so that the boards that need
> a longer reset duration can specify it in their device tree.
> 
> 3) phy-reset-active-high:
> We need that for a custom hardware that needs the reverse reset
> sequence.
> 
> Anyway, we can add the above property for arc emac.
> 
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  Documentation/devicetree/bindings/net/arc_emac.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/arc_emac.txt b/Documentation/devicetree/bindings/net/arc_emac.txt
> index a1d71eb..6389b00 100644
> --- a/Documentation/devicetree/bindings/net/arc_emac.txt
> +++ b/Documentation/devicetree/bindings/net/arc_emac.txt
> @@ -7,6 +7,16 @@ Required properties:
>  - max-speed: see ethernet.txt file in the same directory.
>  - phy: see ethernet.txt file in the same directory.
>  
> +Optional properties:
> +- phy-reset-gpios : Should specify the gpio for phy reset
> +- phy-reset-duration : Reset duration in milliseconds.  Should present

Append units please (-msec).

> +  only if property "phy-reset-gpios" is available.  Missing the property
> +  will have the duration be 1 millisecond.  Numbers greater than 1000 are
> +  invalid and 1 millisecond will be used instead.
> +- phy-reset-active-high : If present then the reset sequence using the GPIO
> +  specified in the "phy-reset-gpios" property is reversed (H=reset state,
> +  L=operation state).

These are really all properties of the phy, not the mac, so they would 
be more appropriately be in the phy node even though it is the mac 
driver that wants to control the gpio.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
