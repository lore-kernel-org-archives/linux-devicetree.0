From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] mfd: arizona: Add DT options for max_channels_clocked
 and PDM speaker config
Date: Wed, 31 Aug 2016 13:15:35 +0100
Message-ID: <20160831121535.GB9415@dell>
References: <1472635543-21577-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472635543-21577-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Requires a DT Ack.

On Wed, 31 Aug 2016, Richard Fitzgerald wrote:

> This patch adds DT settings for the max_channels_clocked, spk_fmt and
> spk_mute pdata.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt | 11 ++++++++
>  drivers/mfd/arizona-core.c                        | 31 +++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> index a6e2ea41..6eaf006 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -85,6 +85,17 @@ Optional properties:
>      present, the number of values should be less than or equal to the
>      number of inputs, unspecified inputs will use the chip default.
>  
> +  - wlf,max-channels-clocked : The maximum number of channels to be clocked on
> +    each AIF, useful for I2S systems with multiple data lines being mastered.
> +    Specify one cell for each AIF, specify zero for AIFs that should be handled
> +    normally.
> +
> +  - wlf,spk-fmt : PDM speaker data format, must contain 2 cells (OUT5 and OUT6).
> +    See the datasheet for values.
> +
> +  - wlf,spk-mute : PDM speaker mute setting, must contain 2 cells (OUT5 and OUT6).
> +    See the datasheet for values.
> +
>    - DCVDD-supply, MICVDD-supply : Power supplies, only need to be specified if
>      they are being externally supplied. As covered in
>      Documentation/devicetree/bindings/regulator/regulator.txt
> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index b95ff2d..36a9633 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -816,6 +816,37 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
>  		count++;
>  	}
>  
> +	count = 0;
> +	of_property_for_each_u32(arizona->dev->of_node,
> +				 "wlf,max-channels-clocked",
> +				 prop, cur, val) {
> +		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
> +			break;
> +
> +		pdata->max_channels_clocked[count] = val;
> +		count++;
> +	}
> +
> +	count = 0;
> +	of_property_for_each_u32(arizona->dev->of_node, "wlf,spk-fmt", prop,
> +				 cur, val) {
> +		if (count == ARRAY_SIZE(pdata->spk_fmt))
> +			break;
> +
> +		pdata->spk_fmt[count] = val;
> +		count++;
> +	}
> +
> +	count = 0;
> +	of_property_for_each_u32(arizona->dev->of_node, "wlf,spk-mute", prop,
> +				 cur, val) {
> +		if (count == ARRAY_SIZE(pdata->spk_mute))
> +			break;
> +
> +		pdata->spk_mute[count] = val;
> +		count++;
> +	}
> +
>  	return 0;
>  }
>  

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
