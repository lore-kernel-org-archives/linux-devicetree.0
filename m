From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] iio: adc: rockchip_saradc: reset saradc
 controller before programming it
Date: Fri, 29 Jul 2016 16:28:33 -0500
Message-ID: <20160729212833.GA12688@rob-hp-laptop>
References: <1469629447-544-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1469629447-544-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 27, 2016 at 10:24:04PM +0800, Caesar Wang wrote:
> SARADC controller needs to be reset before programming it, otherwise
> it will not function properly.
> 
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Tested-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> 
> ---
> 
> Changes in v3:
> - %s/devm_reset_control_get_optional()/devm_reset_control_get()
> - add Guente's test tag.
> 
> Changes in v2:
> - Make the reset as an optional property, since it should work
> with old devicetrees as well.
> 
>  .../bindings/iio/adc/rockchip-saradc.txt           |  7 +++++
>  drivers/iio/adc/Kconfig                            |  1 +
>  drivers/iio/adc/rockchip_saradc.c                  | 30 ++++++++++++++++++++++
>  3 files changed, 38 insertions(+)

Please add acks when posting new versions.

Rob
