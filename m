From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] of: platform: introduce of_probe_platform_driver()
Date: Thu, 16 Dec 2010 10:22:51 -0700
Message-ID: <AANLkTimxAGVkQF24YgDt+TxjbXvW+iCNJhqVLwXO6FXD@mail.gmail.com>
References: <1292519639-21859-1-git-send-email-w.sang@pengutronix.de>
	<1292519639-21859-2-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1292519639-21859-2-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 16, 2010 at 10:13 AM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrot=
e:
> Introduce a function equivalent to platform_driver_probe() for of. This is
> needed to keep some SoC devices in the __init section.
>
> Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Hi Wolfram

Nack for two reasons:
1- Anything needed at driver probe time should be in an __devinit
section.  What specifically are you wanting to keep in __init
2- of_platform_driver is deprecated.  Drivers should be converted to
use platform_driver directly.

g.

> ---
> =A0drivers/of/platform.c =A0 =A0 =A0 | =A0 30 +++++++++++++++++++++++++++=
---
> =A0include/linux/of_platform.h | =A0 =A02 ++
> =A02 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 5b4a07f..511657b 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -72,7 +72,7 @@ static void platform_driver_shutdown_shim(struct platfo=
rm_device *pdev)
> =A0/**
> =A0* of_register_platform_driver
> =A0*/
> -int of_register_platform_driver(struct of_platform_driver *drv)
> +int __of_register_platform_driver(struct of_platform_driver *drv, bool d=
o_probe)
> =A0{
> =A0 =A0 =A0 =A0char *of_name;
>
> @@ -90,18 +90,42 @@ int of_register_platform_driver(struct of_platform_dr=
iver *drv)
> =A0 =A0 =A0 =A0sprintf(of_name, "of:%s", drv->driver.name);
> =A0 =A0 =A0 =A0drv->platform_driver.driver.name =3D of_name;
>
> - =A0 =A0 =A0 if (drv->probe)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 drv->platform_driver.probe =3D platform_dri=
ver_probe_shim;
> =A0 =A0 =A0 =A0drv->platform_driver.remove =3D drv->remove;
> =A0 =A0 =A0 =A0if (drv->shutdown)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0drv->platform_driver.shutdown =3D platform=
_driver_shutdown_shim;
> =A0 =A0 =A0 =A0drv->platform_driver.suspend =3D drv->suspend;
> =A0 =A0 =A0 =A0drv->platform_driver.resume =3D drv->resume;
>
> + =A0 =A0 =A0 if (do_probe)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return platform_driver_probe(&drv->platform=
_driver,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 platform_driver_probe_shim);
> +
> + =A0 =A0 =A0 if (drv->probe)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 drv->platform_driver.probe =3D platform_dri=
ver_probe_shim;
> +
> =A0 =A0 =A0 =A0return platform_driver_register(&drv->platform_driver);
> =A0}
> +
> +int of_register_platform_driver(struct of_platform_driver *drv)
> +{
> + =A0 =A0 =A0 return __of_register_platform_driver(drv, false);
> +}
> +
> =A0EXPORT_SYMBOL(of_register_platform_driver);
>
> +int of_probe_platform_driver(struct of_platform_driver *drv,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*probe)(struct platform_device *, cons=
t struct of_device_id *match))
> +{
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 drv->probe =3D probe;
> + =A0 =A0 =A0 ret =3D __of_register_platform_driver(drv, true);
> + =A0 =A0 =A0 drv->probe =3D NULL;
> +
> + =A0 =A0 =A0 return ret;
> +}
> +EXPORT_SYMBOL(of_probe_platform_driver);
> +
> =A0void of_unregister_platform_driver(struct of_platform_driver *drv)
> =A0{
> =A0 =A0 =A0 =A0platform_driver_unregister(&drv->platform_driver);
> diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
> index a68716a..c4082c7 100644
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -53,6 +53,8 @@ extern void of_unregister_driver(struct of_platform_dri=
ver *drv);
>
> =A0/* Platform drivers register/unregister */
> =A0extern int of_register_platform_driver(struct of_platform_driver *drv);
> +extern int of_probe_platform_driver(struct of_platform_driver *drv,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*probe)(struct platform_device *, cons=
t struct of_device_id *match));
> =A0extern void of_unregister_platform_driver(struct of_platform_driver *d=
rv);
>
> =A0extern struct platform_device *of_device_alloc(struct device_node *np,
> --
> 1.7.2.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
