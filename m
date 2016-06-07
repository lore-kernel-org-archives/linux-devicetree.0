From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm: convert DT component matching to
 component_match_add_release()
Date: Tue, 7 Jun 2016 14:39:15 +0100
Message-ID: <20160607133915.GB1165@e106497-lin.cambridge.arm.com>
References: <20160603141548.GC1041@n2100.armlinux.org.uk>
 <E1b8pyX-0005OP-2s@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1b8pyX-0005OP-2s-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 03, 2016 at 03:21:25PM +0100, Russell King wrote:
> Convert DT component matching to use component_match_add_release().
>=20
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c             |  9 +++------
>  drivers/gpu/drm/armada/armada_drv.c         |  8 ++------
>  drivers/gpu/drm/drm_of.c                    |  6 ++++--
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 11 ++---------
>  drivers/gpu/drm/msm/msm_drv.c               |  8 ++------
>  drivers/gpu/drm/msm/msm_drv.h               |  1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 12 +++---------
>  drivers/gpu/drm/sti/sti_drv.c               |  9 ++-------
>  drivers/gpu/drm/tilcdc/tilcdc_external.c    |  8 ++------
>  9 files changed, 21 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hd=
lcd_drv.c
> index b987c63ba8d6..f00845c25795 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -14,6 +14,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/list.h>
> +#include <linux/of_component.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/pm_runtime.h>
> @@ -443,11 +444,6 @@ static const struct component_master_ops hdlcd_m=
aster_ops =3D {
>  	.unbind		=3D hdlcd_drm_unbind,
>  };
> =20
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev->of_node =3D=3D data;
> -}
> -
>  static int hdlcd_probe(struct platform_device *pdev)
>  {
>  	struct device_node *port, *ep;
> @@ -474,7 +470,8 @@ static int hdlcd_probe(struct platform_device *pd=
ev)
>  		return -EAGAIN;
>  	}
> =20
> -	component_match_add(&pdev->dev, &match, compare_dev, port);
> +	component_match_add_of(&pdev->dev, &match, port);
> +	of_node_put(port);
> =20
>  	return component_master_add_with_match(&pdev->dev, &hdlcd_master_op=
s,
>  					       match);

=46or the HDLCD part of v2:

Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>


> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/ar=
mada/armada_drv.c
> index 439824a61aa5..f2716d20c257 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -9,6 +9,7 @@
>  #include <linux/component.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_component.h>
>  #include <drm/drmP.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_of.h>
> @@ -227,11 +228,6 @@ static void armada_drm_unbind(struct device *dev=
)
>  	drm_put_dev(dev_get_drvdata(dev));
>  }
> =20
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node =3D=3D data;
> -}
> -
>  static int compare_dev_name(struct device *dev, void *data)
>  {
>  	const char *name =3D data;
> @@ -255,7 +251,7 @@ static void armada_add_endpoints(struct device *d=
ev,
>  			continue;
>  		}
> =20
> -		component_match_add(dev, match, compare_of, remote);
> +		component_match_add_of(dev, match, remote);
>  		of_node_put(remote);
>  	}
>  }
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index bc98bb94264d..d13fc633aeea 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -1,6 +1,7 @@
>  #include <linux/component.h>
>  #include <linux/export.h>
>  #include <linux/list.h>
> +#include <linux/of_component.h>
>  #include <linux/of_graph.h>
>  #include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
> @@ -101,7 +102,7 @@ int drm_of_component_probe(struct device *dev,
>  			continue;
>  		}
> =20
> -		component_match_add(dev, &match, compare_of, port);
> +		component_match_add_of(dev, &match, compare_of, port);
>  		of_node_put(port);
>  	}
> =20
> @@ -140,7 +141,8 @@ int drm_of_component_probe(struct device *dev,
>  				continue;
>  			}
> =20
> -			component_match_add(dev, &match, compare_of, remote);
> +			component_match_add_of_compare(dev, &match, compare_of,
> +						       remote);
>  			of_node_put(remote);
>  		}
>  		of_node_put(port);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/=
etnaviv/etnaviv_drv.c
> index 3d4f56df8359..a0e0764a6269 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -15,6 +15,7 @@
>   */
> =20
>  #include <linux/component.h>
> +#include <linux/of_component.h>
>  #include <linux/of_platform.h>
> =20
>  #include "etnaviv_drv.h"
> @@ -606,13 +607,6 @@ static const struct component_master_ops etnaviv=
_master_ops =3D {
>  	.unbind =3D etnaviv_unbind,
>  };
> =20
> -static int compare_of(struct device *dev, void *data)
> -{
> -	struct device_node *np =3D data;
> -
> -	return dev->of_node =3D=3D np;
> -}
> -
>  static int compare_str(struct device *dev, void *data)
>  {
>  	return !strcmp(dev_name(dev), data);
> @@ -635,8 +629,7 @@ static int etnaviv_pdev_probe(struct platform_dev=
ice *pdev)
>  			if (!core_node)
>  				break;
> =20
> -			component_match_add(&pdev->dev, &match, compare_of,
> -					    core_node);
> +			component_match_add_of(&pdev->dev, &match, core_node);
>  			of_node_put(core_node);
>  		}
>  	} else if (dev->platform_data) {
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_=
drv.c
> index 9c654092ef78..5293aa775c5a 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -800,11 +800,6 @@ static const struct dev_pm_ops msm_pm_ops =3D {
>   * NOTE: duplication of the same code as exynos or imx (or probably =
any other).
>   * so probably some room for some helpers
>   */
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node =3D=3D data;
> -}
> -
>  static int add_components(struct device *dev, struct component_match=
 **matchptr,
>  		const char *name)
>  {
> @@ -818,7 +813,8 @@ static int add_components(struct device *dev, str=
uct component_match **matchptr,
>  		if (!node)
>  			break;
> =20
> -		component_match_add(dev, matchptr, compare_of, node);
> +		component_match_add_of(dev, matchptr, node);
> +		of_node_put(node);
>  	}
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_=
drv.h
> index 5b2963f32291..66dafecaf115 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -30,6 +30,7 @@
>  #include <linux/list.h>
>  #include <linux/iommu.h>
>  #include <linux/types.h>
> +#include <linux/of_component.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_device.h>
>  #include <asm/sizes.h>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gp=
u/drm/rockchip/rockchip_drm_drv.c
> index a409d1f703cb..84c50f6770c3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -22,6 +22,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/module.h>
> +#include <linux/of_component.h>
>  #include <linux/of_graph.h>
>  #include <linux/component.h>
> =20
> @@ -414,13 +415,6 @@ static const struct dev_pm_ops rockchip_drm_pm_o=
ps =3D {
>  				rockchip_drm_sys_resume)
>  };
> =20
> -static int compare_of(struct device *dev, void *data)
> -{
> -	struct device_node *np =3D data;
> -
> -	return dev->of_node =3D=3D np;
> -}
> -
>  static void rockchip_add_endpoints(struct device *dev,
>  				   struct component_match **match,
>  				   struct device_node *port)
> @@ -439,7 +433,7 @@ static void rockchip_add_endpoints(struct device =
*dev,
>  			continue;
>  		}
> =20
> -		component_match_add(dev, match, compare_of, remote);
> +		component_match_add_of(dev, match, remote);
>  		of_node_put(remote);
>  	}
>  }
> @@ -518,7 +512,7 @@ static int rockchip_drm_platform_probe(struct pla=
tform_device *pdev)
>  			is_support_iommu =3D false;
>  		}
> =20
> -		component_match_add(dev, &match, compare_of, port->parent);
> +		component_match_add_of(dev, &match, port->parent);
>  		of_node_put(port);
>  	}
> =20
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_=
drv.c
> index 872495e72294..aeb2787c9bd4 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of_component.h>
>  #include <linux/of_platform.h>
> =20
>  #include <drm/drm_atomic.h>
> @@ -341,11 +342,6 @@ static struct drm_driver sti_driver =3D {
>  	.minor =3D DRIVER_MINOR,
>  };
> =20
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node =3D=3D data;
> -}
> -
>  static int sti_bind(struct device *dev)
>  {
>  	return drm_platform_init(&sti_driver, to_platform_device(dev));
> @@ -375,8 +371,7 @@ static int sti_platform_probe(struct platform_dev=
ice *pdev)
>  	child_np =3D of_get_next_available_child(node, NULL);
> =20
>  	while (child_np) {
> -		component_match_add(dev, &match, compare_of, child_np);
> -		of_node_put(child_np);
> +		component_match_add_of(dev, &match, child_np);
>  		child_np =3D of_get_next_available_child(node, child_np);
>  	}
> =20
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/d=
rm/tilcdc/tilcdc_external.c
> index 03acb4f99982..1b3fd9fa4bef 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include <linux/component.h>
> +#include <linux/of_component.h>
>  #include <linux/of_graph.h>
> =20
>  #include "tilcdc_drv.h"
> @@ -130,11 +131,6 @@ void tilcdc_remove_external_encoders(struct drm_=
device *dev)
>  						 priv->connector_funcs[i]);
>  }
> =20
> -static int dev_match_of(struct device *dev, void *data)
> -{
> -	return dev->of_node =3D=3D data;
> -}
> -
>  int tilcdc_get_external_components(struct device *dev,
>  				   struct component_match **match)
>  {
> @@ -152,7 +148,7 @@ int tilcdc_get_external_components(struct device =
*dev,
> =20
>  		dev_dbg(dev, "Subdevice node '%s' found\n", node->name);
>  		if (match)
> -			component_match_add(dev, match, dev_match_of, node);
> +			component_match_add_of(dev, match, node);
>  		of_node_put(node);
>  		count++;
>  	}
> --=20
> 2.1.0
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
