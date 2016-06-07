From: Vincent ABRIOU <vincent.abriou-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm: convert DT component matching to
 component_match_add_release()
Date: Tue, 7 Jun 2016 16:26:13 +0200
Message-ID: <5756D985.80107@st.com>
References: <20160603141548.GC1041@n2100.armlinux.org.uk>
 <E1b8pyX-0005OP-2s@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <E1b8pyX-0005OP-2s-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 06/03/2016 04:21 PM, Russell King wrote:
> Convert DT component matching to use component_match_add_release().
>
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> ---
>   drivers/gpu/drm/arm/hdlcd_drv.c             |  9 +++------
>   drivers/gpu/drm/armada/armada_drv.c         |  8 ++------
>   drivers/gpu/drm/drm_of.c                    |  6 ++++--
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 11 ++---------
>   drivers/gpu/drm/msm/msm_drv.c               |  8 ++------
>   drivers/gpu/drm/msm/msm_drv.h               |  1 +
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 12 +++---------
>   drivers/gpu/drm/sti/sti_drv.c               |  9 ++-------
>   drivers/gpu/drm/tilcdc/tilcdc_external.c    |  8 ++------
>   9 files changed, 21 insertions(+), 51 deletions(-)
>
>
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index 872495e72294..aeb2787c9bd4 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -10,6 +10,7 @@
>   #include <linux/debugfs.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/of_component.h>
>   #include <linux/of_platform.h>
>
>   #include <drm/drm_atomic.h>
> @@ -341,11 +342,6 @@ static struct drm_driver sti_driver = {
>   	.minor = DRIVER_MINOR,
>   };
>
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>   static int sti_bind(struct device *dev)
>   {
>   	return drm_platform_init(&sti_driver, to_platform_device(dev));
> @@ -375,8 +371,7 @@ static int sti_platform_probe(struct platform_device *pdev)
>   	child_np = of_get_next_available_child(node, NULL);
>
>   	while (child_np) {
> -		component_match_add(dev, &match, compare_of, child_np);
> -		of_node_put(child_np);
> +		component_match_add_of(dev, &match, child_np);
>   		child_np = of_get_next_available_child(node, child_np);
>   	}
>

Hi Russel,

Ok for the sti driver.

Acked-by: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>
