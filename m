From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v7 4/7] staging: imx-drm: imx-hdmi: move imx-hdmi to bridge/dw-hdmi
Date: Tue, 11 Nov 2014 22:41:50 +0800
Message-ID: <5462202E.2080809@rock-chips.com>
References: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com> <1415710398-12120-1-git-send-email-andy.yan@rock-chips.com> <54621A3D.9090406@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54621A3D.9090406-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 2014=E5=B9=B411=E6=9C=8811=E6=97=A5 22:16, Zubair Lutfullah Kakakhel=
 wrote:
> Hi Andy,
>
> On 11/11/14 12:53, Andy Yan wrote:
>> the original imx hdmi driver is under staging/imx-drm,
>> which depends on imx-drm, so move the imx hdmi drvier out
> Spelling mistake. 				^'driver'
>
>> to drm/bridge and rename imx-hdmi to dw-hdmi
> 				      ^dw_hdmi
  thanks , these will be fixed in v8
>> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> ---
>>
>> Changes in v7: None
>> Changes in v6: None
>> Changes in v5: None
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2:
>> - use git format -M to generate these patch
>>
>>   drivers/gpu/drm/bridge/Kconfig                     |   5 +
>>   drivers/gpu/drm/bridge/Makefile                    |   1 +
>>   .../imx-hdmi.c =3D> gpu/drm/bridge/dw_hdmi.c}        | 281 +++++++=
++++----------
>>   .../imx-hdmi.h =3D> gpu/drm/bridge/dw_hdmi.h}        |  46 +---
>>   drivers/staging/imx-drm/Kconfig                    |   1 +
>>   drivers/staging/imx-drm/Makefile                   |   2 +-
>>   drivers/staging/imx-drm/dw_hdmi-imx.c              |  70 ++---
>>   include/drm/bridge/dw_hdmi.h                       |  57 +++++
>>   8 files changed, 243 insertions(+), 220 deletions(-)
>>   rename drivers/{staging/imx-drm/imx-hdmi.c =3D> gpu/drm/bridge/dw_=
hdmi.c} (83%)
>>   rename drivers/{staging/imx-drm/imx-hdmi.h =3D> gpu/drm/bridge/dw_=
hdmi.h} (97%)
>>   create mode 100644 include/drm/bridge/dw_hdmi.h
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge=
/Kconfig
>> index 884923f..26162ef 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -3,3 +3,8 @@ config DRM_PTN3460
>>   	depends on DRM
>>   	select DRM_KMS_HELPER
>>   	---help---
>> +
>> +config DRM_DW_HDMI
>> +	bool "Synopsys DesignWare High-Definition Multimedia Interface"
>> +	depends on DRM
>> +	select DRM_KMS_HELPER
>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridg=
e/Makefile
>> index b4733e1..d8a8cfd 100644
>> --- a/drivers/gpu/drm/bridge/Makefile
>> +++ b/drivers/gpu/drm/bridge/Makefile
>> @@ -1,3 +1,4 @@
>>   ccflags-y :=3D -Iinclude/drm
>>  =20
>>   obj-$(CONFIG_DRM_PTN3460) +=3D ptn3460.o
>> +obj-$(CONFIG_DRM_DW_HDMI) +=3D dw_hdmi.o
>> diff --git a/drivers/staging/imx-drm/imx-hdmi.c b/drivers/gpu/drm/br=
idge/dw_hdmi.c
>> similarity index 83%
>> rename from drivers/staging/imx-drm/imx-hdmi.c
>> rename to drivers/gpu/drm/bridge/dw_hdmi.c
>> index c7e5f12..e9f0dfe 100644
>> --- a/drivers/staging/imx-drm/imx-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/dw_hdmi.c
>> @@ -6,8 +6,7 @@
>>    * the Free Software Foundation; either version 2 of the License, =
or
>>    * (at your option) any later version.
>>    *
>> - * SH-Mobile High-Definition Multimedia Interface (HDMI) driver
>> - * for SLISHDMI13T and SLIPHDMIT IP cores
> ...
>
>> diff --git a/drivers/staging/imx-drm/imx-hdmi.h b/drivers/gpu/drm/br=
idge/dw_hdmi.h
>> similarity index 97%
>> rename from drivers/staging/imx-drm/imx-hdmi.h
>> rename to drivers/gpu/drm/bridge/dw_hdmi.h
>> index e67d60d..b8412a9 100644
>> --- a/drivers/staging/imx-drm/imx-hdmi.h
>> +++ b/drivers/gpu/drm/bridge/dw_hdmi.h
>> @@ -7,8 +7,8 @@
>>    * (at your option) any later version.
>>    */
>>  =20
>> -#ifndef __IMX_HDMI_H__
>> -#define __IMX_HDMI_H__
>> +#ifndef __DW_HDMI__
>> +#define __DW_HDMI__
>>  =20
>>   /* Identification Registers */
>>   #define HDMI_DESIGN_ID                          0x0000
>> @@ -1030,46 +1030,4 @@ enum {
>>   	HDMI_A_VIDPOLCFG_HSYNCPOL_ACTIVE_LOW =3D 0x0,
>>   };
>>  =20
>> -enum {
>> -	RES_8,
>> -	RES_10,
>> -	RES_12,
>> -	RES_MAX,
>> -};
>> -
>> -enum imx_hdmi_devtype {
>> -	IMX6Q_HDMI,
>> -	IMX6DL_HDMI,
>> -};
>> -
>> -struct mpll_config {
>> -	unsigned long mpixelclock;
>> -	struct {
>> -		u16 cpce;
>> -		u16 gmp;
>> -	} res[RES_MAX];
>> -};
>> -
>> -struct curr_ctrl {
>> -	unsigned long mpixelclock;
>> -	u16 curr[RES_MAX];
>> -};
>> -
>> -struct imx_hdmi_plat_data {
>> -	void * (*setup)(struct platform_device *pdev);
>> -	void (*exit)(void *priv);
>> -	void (*encoder_commit)(void *priv, struct drm_encoder *encoder);
>> -	void (*encoder_prepare)(struct drm_connector *connector,
>> -				struct drm_encoder *encoder);
>> -	enum drm_mode_status (*mode_valid)(struct drm_connector *connector=
,
>> -					   struct drm_display_mode *mode);
>> -	const struct mpll_config *mpll_cfg;
>> -	const struct curr_ctrl *cur_ctr;
>> -	enum imx_hdmi_devtype dev_type;
>> -
>> -};
>> -
>> -int imx_hdmi_platform_register(struct platform_device *pdev,
>> -			       const struct imx_hdmi_plat_data *plat_data);
>> -int imx_hdmi_platform_unregister(struct platform_device *pdev);
> Doesn't this change belong in the previous splitting patch?
     in previous splitting patch we put these in staging/imx-drm/imx-hd=
mi.h
    now we move these common  struct to include/drm/bridge/dw-hdmi.h
>
>>   #endif /* __IMX_HDMI_H__ */
>> diff --git a/drivers/staging/imx-drm/Kconfig b/drivers/staging/imx-d=
rm/Kconfig
>> index ab31848..560e1d3 100644
>> --- a/drivers/staging/imx-drm/Kconfig
>> +++ b/drivers/staging/imx-drm/Kconfig
>> @@ -50,5 +50,6 @@ config DRM_IMX_IPUV3
>>   config DRM_IMX_HDMI
>>   	tristate "Freescale i.MX DRM HDMI"
>>   	depends on DRM_IMX
>> +	select DRM_DW_HDMI
>>   	help
>>   	  Choose this if you want to use HDMI on i.MX6.
>> diff --git a/drivers/staging/imx-drm/Makefile b/drivers/staging/imx-=
drm/Makefile
>> index 809027d..f3ecd89 100644
>> --- a/drivers/staging/imx-drm/Makefile
>> +++ b/drivers/staging/imx-drm/Makefile
>> @@ -9,4 +9,4 @@ obj-$(CONFIG_DRM_IMX_LDB) +=3D imx-ldb.o
>>  =20
>>   imx-ipuv3-crtc-objs  :=3D ipuv3-crtc.o ipuv3-plane.o
>>   obj-$(CONFIG_DRM_IMX_IPUV3)	+=3D imx-ipuv3-crtc.o
>> -obj-$(CONFIG_DRM_IMX_HDMI) +=3D imx-hdmi.o dw_hdmi-imx.o
>> +obj-$(CONFIG_DRM_IMX_HDMI) +=3D dw_hdmi-imx.o
>> diff --git a/drivers/staging/imx-drm/dw_hdmi-imx.c b/drivers/staging=
/imx-drm/dw_hdmi-imx.c
>> index 0db978e..4b48ea6 100644
>> --- a/drivers/staging/imx-drm/dw_hdmi-imx.c
>> +++ b/drivers/staging/imx-drm/dw_hdmi-imx.c
> All other files in imx-drm/ are named imx-xyz.
>
> no underscore either.
>
> I wonder if they are ok with dw_hdmi-imx.c
>
> How about imx-dw-hdmi.c
> and imx-dw-hdmi.h ?
   I see some dw ip drivers like dw-mmc and dwmac have
   name style like dw_xxx.c for core driver, dw_xx_yy.c
   for platform driver, so I keep the same with it.
>> @@ -10,14 +10,14 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/mfd/syscon.h>
>>   #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
>> +#include <drm/bridge/dw_hdmi.h>
>>   #include <video/imx-ipu-v3.h>
>>   #include <linux/regmap.h>
>>   #include <linux/clk.h>
>>  =20
>>   #include "imx-drm.h"
>> -#include "imx-hdmi.h"
>>  =20
>>  =20
>> -static const struct of_device_id imx_hdmi_imx_ids[] =3D {
>> +static const struct of_device_id dw_hdmi_imx_ids[] =3D {
>>   	{ .compatible =3D "fsl,imx6q-hdmi",
>>   	  .data =3D &imx6q_hdmi_drv_data
> Weren't there multiple compatible strings in imx-hdmi.c?
   imx6q , imx6dl use different compatible strings for different
configuration in original imx-hdmi.c
>
>>   	}, {
>> @@ -178,38 +178,38 @@ static const struct of_device_id imx_hdmi_imx_=
ids[] =3D {
>>   	},
>>   	{},
>>   };
>> -MODULE_DEVICE_TABLE(of, imx_hdmi_imx_dt_ids);
>> +MODULE_DEVICE_TABLE(of, dw_hdmi_imx_dt_ids);
>>  =20
> ...
>
>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hd=
mi.h
>> new file mode 100644
>> index 0000000..6683b63
>> --- /dev/null
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -0,0 +1,57 @@
>> +/*
>> + * Copyright (C) 2011 Freescale Semiconductor, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation; either version 2 of the License, o=
r
>> + * (at your option) any later version.
>> + */
>> +
>> +#ifndef __DW_HDMI_H__
>> +#define __DW_HDMI_H__
>> +
>> +#include <drm/drmP.h>
>> +
>> +enum {
>> +	RES_8,
>> +	RES_10,
>> +	RES_12,
>> +	RES_MAX,
>> +};
>> +
>> +enum dw_hdmi_devtype {
>> +	IMX6Q_HDMI,
>> +	IMX6DL_HDMI,
>> +};
> This enum going into dw_hdmi.
> Does this mean that dw hdmi code still has some SoC specific things l=
eft?
> Where is this needed.

    yes, imx6q and imx6dl have different configuration in function
    dw_hdmi_clear_overflow, as for rk3288,  function hdmi_phy_configure
    also have different with power control of some block.
>> +
>> +struct mpll_config {
>> +	unsigned long mpixelclock;
>> +	struct {
>> +		u16 cpce;
>> +		u16 gmp;
>> +	} res[RES_MAX];
>> +};
>> +
>> +struct curr_ctrl {
>> +	unsigned long mpixelclock;
>> +	u16 curr[RES_MAX];
>> +};
>> +
>> +struct dw_hdmi_plat_data {
>> +	void * (*setup)(struct platform_device *pdev);
>> +	void (*exit)(void *priv);
>> +	void (*encoder_commit)(void *priv, struct drm_encoder *encoder);
>> +	void (*encoder_prepare)(struct drm_connector *connector,
>> +				struct drm_encoder *encoder);
>> +	enum drm_mode_status (*mode_valid)(struct drm_connector *connector=
,
>> +					   struct drm_display_mode *mode);
>> +	const struct mpll_config *mpll_cfg;
>> +	const struct curr_ctrl *cur_ctr;
>> +	enum dw_hdmi_devtype dev_type;
>> +
>> +};
>> +
>> +int dw_hdmi_platform_register(struct platform_device *pdev,
>> +			      const struct dw_hdmi_plat_data *plat_data);
>> +int dw_hdmi_platform_unregister(struct platform_device *pdev);
>> +#endif /* __IMX_HDMI_H__ */
>>
> Regards
> ZubairLK
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
