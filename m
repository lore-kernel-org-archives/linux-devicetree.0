From: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [v5 2/2] drm/arm/mali-dp: Add display QoS interface
 configuration for Mali DP500
Date: Thu, 12 Sep 2019 15:47:05 +0100
Message-ID: <20190912144705.h2qmyobpayxmu2zd@e110455-lin.cambridge.arm.com>
References: <20190910075913.17650-1-wen.he_1@nxp.com>
 <20190910075913.17650-2-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910075913.17650-2-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: linux-devel@linux.nxdi.nxp.com, Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 03:59:13PM +0800, Wen He wrote:
> Configure the display Quality of service (QoS) levels priority if the
> optional property node "arm,malidp-aqros-value" is defined in DTS file.
> 
> QoS signaling using AQROS and AWQOS AXI interface signals, the AQROS is
> driven from the "RQOS" register, so needed to program the RQOS register
> to avoid the high resolutions flicker issue on the LS1028A platform.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the patch! I will pull this into the malidp code and push it to
drm-misc-next in the following days.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_drv.c  |  6 ++++++
>  drivers/gpu/drm/arm/malidp_hw.c   |  9 +++++++++
>  drivers/gpu/drm/arm/malidp_hw.h   |  3 +++
>  drivers/gpu/drm/arm/malidp_regs.h | 10 ++++++++++
>  4 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index 333b88a5efb0..8a76315aaa0f 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -817,6 +817,12 @@ static int malidp_bind(struct device *dev)
>  
>  	malidp->core_id = version;
>  
> +	ret = of_property_read_u32(dev->of_node,
> +					"arm,malidp-arqos-value",
> +					&hwdev->arqos_value);
> +	if (ret)
> +		hwdev->arqos_value = 0x0;
> +
>  	/* set the number of lines used for output of RGB data */
>  	ret = of_property_read_u8_array(dev->of_node,
>  					"arm,malidp-output-port-lines",
> diff --git a/drivers/gpu/drm/arm/malidp_hw.c b/drivers/gpu/drm/arm/malidp_hw.c
> index bd8265f02e0b..ca570b135478 100644
> --- a/drivers/gpu/drm/arm/malidp_hw.c
> +++ b/drivers/gpu/drm/arm/malidp_hw.c
> @@ -379,6 +379,15 @@ static void malidp500_modeset(struct malidp_hw_device *hwdev, struct videomode *
>  		malidp_hw_setbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISPLAY_FUNC);
>  	else
>  		malidp_hw_clearbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISPLAY_FUNC);
> +
> +	/*
> +	 * Program the RQoS register to avoid high resolutions flicker
> +	 * issue on the LS1028A.
> +	 */
> +	if (hwdev->arqos_value) {
> +		val = hwdev->arqos_value;
> +		malidp_hw_setbits(hwdev, val, MALIDP500_RQOS_QUALITY);
> +	}
>  }
>  
>  int malidp_format_get_bpp(u32 fmt)
> diff --git a/drivers/gpu/drm/arm/malidp_hw.h b/drivers/gpu/drm/arm/malidp_hw.h
> index 968a65eed371..e4c36bc90bda 100644
> --- a/drivers/gpu/drm/arm/malidp_hw.h
> +++ b/drivers/gpu/drm/arm/malidp_hw.h
> @@ -251,6 +251,9 @@ struct malidp_hw_device {
>  
>  	/* size of memory used for rotating layers, up to two banks available */
>  	u32 rotation_memory[2];
> +
> +	/* priority level of RQOS register used for driven the ARQOS signal */
> +	u32 arqos_value;
>  };
>  
>  static inline u32 malidp_hw_read(struct malidp_hw_device *hwdev, u32 reg)
> diff --git a/drivers/gpu/drm/arm/malidp_regs.h b/drivers/gpu/drm/arm/malidp_regs.h
> index 993031542fa1..514c50dcb74d 100644
> --- a/drivers/gpu/drm/arm/malidp_regs.h
> +++ b/drivers/gpu/drm/arm/malidp_regs.h
> @@ -210,6 +210,16 @@
>  #define MALIDP500_CONFIG_VALID		0x00f00
>  #define MALIDP500_CONFIG_ID		0x00fd4
>  
> +/*
> + * The quality of service (QoS) register on the DP500. RQOS register values
> + * are driven by the ARQOS signal, using AXI transacations, dependent on the
> + * FIFO input level.
> + * The RQOS register can also set QoS levels for:
> + *    - RED_ARQOS   @ A 4-bit signal value for close to underflow conditions
> + *    - GREEN_ARQOS @ A 4-bit signal value for normal conditions
> + */
> +#define MALIDP500_RQOS_QUALITY          0x00500
> +
>  /* register offsets and bits specific to DP550/DP650 */
>  #define MALIDP550_ADDR_SPACE_SIZE	0x10000
>  #define MALIDP550_DE_CONTROL		0x00010
> -- 
> 2.17.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
