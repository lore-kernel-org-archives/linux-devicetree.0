Return-Path: <SRS0=CDwP=QN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:54732 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727966AbfBFMzN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Feb 2019 07:55:13 -0500
Date: Wed, 6 Feb 2019 14:55:06 +0200
From: "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 1/2] media: atmel-isc: Add support for BT656 with CRC
 decoding
Message-ID: <20190206125506.csprwatdcplsz22w@valkosipuli.retiisi.org.uk>
References: <20190204141756.234563-1-ksloat@aampglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190204141756.234563-1-ksloat@aampglobal.com>
Sender: devicetree-owner@vger.kernel.org
To: Ken Sloat <KSloat@aampglobal.com>
Cc: "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Ken,

Thanks for the update.

On Mon, Feb 04, 2019 at 02:18:13PM +0000, Ken Sloat wrote:
> From: Ken Sloat <ksloat@aampglobal.com>
> 
> The ISC driver currently supports ITU-R 601 encoding which
> utilizes the external hysync and vsync signals. ITU-R 656
> format removes the need for these pins by embedding the
> sync pulses within the data packet.
> 
> To support this feature, enable necessary register bits
> when this feature is enabled via device tree.
> 
> Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
> ---
>  drivers/media/platform/atmel/atmel-isc-regs.h | 2 ++
>  drivers/media/platform/atmel/atmel-isc.c      | 7 ++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
> index 2aadc19235ea..d730693f299c 100644
> --- a/drivers/media/platform/atmel/atmel-isc-regs.h
> +++ b/drivers/media/platform/atmel/atmel-isc-regs.h
> @@ -24,6 +24,8 @@
>  #define ISC_PFE_CFG0_HPOL_LOW   BIT(0)
>  #define ISC_PFE_CFG0_VPOL_LOW   BIT(1)
>  #define ISC_PFE_CFG0_PPOL_LOW   BIT(2)
> +#define ISC_PFE_CFG0_CCIR656    BIT(9)
> +#define ISC_PFE_CFG0_CCIR_CRC   BIT(10)
>  
>  #define ISC_PFE_CFG0_MODE_PROGRESSIVE   (0x0 << 4)
>  #define ISC_PFE_CFG0_MODE_MASK          GENMASK(6, 4)
> diff --git a/drivers/media/platform/atmel/atmel-isc.c b/drivers/media/platform/atmel/atmel-isc.c
> index 50178968b8a6..9a399aa7ca92 100644
> --- a/drivers/media/platform/atmel/atmel-isc.c
> +++ b/drivers/media/platform/atmel/atmel-isc.c
> @@ -1095,7 +1095,8 @@ static int isc_configure(struct isc_device *isc)
>  	pfe_cfg0  |= subdev->pfe_cfg0 | ISC_PFE_CFG0_MODE_PROGRESSIVE;
>  	mask = ISC_PFE_CFG0_BPS_MASK | ISC_PFE_CFG0_HPOL_LOW |
>  	       ISC_PFE_CFG0_VPOL_LOW | ISC_PFE_CFG0_PPOL_LOW |
> -	       ISC_PFE_CFG0_MODE_MASK;
> +	       ISC_PFE_CFG0_MODE_MASK | ISC_PFE_CFG0_CCIR_CRC |
> +		   ISC_PFE_CFG0_CCIR656;

This could be aligned more nicely.

>  
>  	regmap_update_bits(regmap, ISC_PFE_CFG0, mask, pfe_cfg0);
>  
> @@ -2084,6 +2085,10 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
>  			subdev_entity->pfe_cfg0 |= ISC_PFE_CFG0_PPOL_LOW;
>  
> +		if (v4l2_epn.bus_type == V4L2_MBUS_BT656)
> +			subdev_entity->pfe_cfg0 |= ISC_PFE_CFG0_CCIR_CRC |
> +					ISC_PFE_CFG0_CCIR656;

Could you also set the bus_type field for the v4l2_epn to the parallel bus
and if you get -ENXIO, try Bt.656 as well? The semantics changes (i.e. you
need to set the defaults before calling v4l2_fwnode_endpoint_parse()) with
setting the bus_type field; please see v4l2_fwnode_endpoint_parse()
documentation in include/media/v4l2-fwnode.h .

> +
>  		subdev_entity->asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
>  		subdev_entity->asd->match.fwnode =
>  			of_fwnode_handle(rem);

-- 
Kind regards,

Sakari Ailus
