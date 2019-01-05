From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] iio: adc: meson-saradc: enable the temperature
 sensor two more SoCs
Date: Sat, 5 Jan 2019 16:44:27 +0000
Message-ID: <20190105164427.03e2a013@archlinux>
References: <20181227215020.9803-1-martin.blumenstingl@googlemail.com>
        <20181227215020.9803-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181227215020.9803-3-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, balbes-150@yandex.ru, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 27 Dec 2018 22:50:20 +0100
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Meson8b and Meson8m2 use the same logic to convert the ADC register
> value to celsius, which is different from Meson8:
> - Meson8 has different multiplier and divider values
> - Meson8 uses a 4-bit TSC (temperature sensor coefficient) which fits
>   into the 4-bit field in the MESON_SAR_ADC_DELTA_10 register:
>   MESON_SAR_ADC_DELTA_10_TS_C_MASK. Meson8b and Meson8m2 have a 5-bit
>   TSC which requires writing the upper-most bit into the
>   MESON_HHI_DPLL_TOP_0[9] register from the HHI register area.
> 
> This adds support for the temperature sensor on the Meson8b and Meson8m2
> SoCs by implementing the logic to write the upper-most TSC bit into the
> HHI register area. The SoC-specific values (temperature_trimming_bits,
> temperature_multiplier, temperature_divider) are added - these simply
> integrate into the existing infrastructure (which was implemented for
> Meson8) and thus require no further changes to the existing temperature
> calculation logic.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/meson_saradc.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 729becb2d3d9..f8600fbcdfe3 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -26,6 +26,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/mfd/syscon.h>
>  
>  #define MESON_SAR_ADC_REG0					0x00
>  	#define MESON_SAR_ADC_REG0_PANEL_DETECT			BIT(31)
> @@ -174,6 +175,9 @@
>  #define MESON_SAR_ADC_EFUSE_BYTE3_UPPER_ADC_VAL			GENMASK(6, 0)
>  #define MESON_SAR_ADC_EFUSE_BYTE3_IS_CALIBRATED			BIT(7)
>  
> +#define MESON_HHI_DPLL_TOP_0					0x318
> +#define MESON_HHI_DPLL_TOP_0_TSC_BIT4				BIT(9)
> +
>  /* for use with IIO_VAL_INT_PLUS_MICRO */
>  #define MILLION							1000000
>  
> @@ -280,6 +284,7 @@ struct meson_sar_adc_priv {
>  	struct completion			done;
>  	int					calibbias;
>  	int					calibscale;
> +	struct regmap				*tsc_regmap;
>  	bool					temperature_sensor_calibrated;
>  	u8					temperature_sensor_coefficient;
>  	u16					temperature_sensor_adc_val;
> @@ -727,6 +732,15 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>  		return ret;
>  	}
>  
> +	priv->tsc_regmap =
> +		syscon_regmap_lookup_by_phandle(indio_dev->dev.parent->of_node,
> +						"amlogic,hhi-sysctrl");
> +	if (IS_ERR(priv->tsc_regmap)) {
> +		dev_err(indio_dev->dev.parent,
> +			"failed to get amlogic,hhi-sysctrl regmap\n");
> +		return PTR_ERR(priv->tsc_regmap);
> +	}
> +
>  	read_len = MESON_SAR_ADC_EFUSE_BYTES;
>  	buf = nvmem_cell_read(temperature_calib, &read_len);
>  	if (IS_ERR(buf)) {
> @@ -861,6 +875,22 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
>  				    priv->temperature_sensor_coefficient);
>  		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELTA_10,
>  				   MESON_SAR_ADC_DELTA_10_TS_C_MASK, regval);
> +
> +		if (priv->param->temperature_trimming_bits == 5) {
> +			if (priv->temperature_sensor_coefficient & BIT(4))
> +				regval = MESON_HHI_DPLL_TOP_0_TSC_BIT4;
> +			else
> +				regval = 0;
> +
> +			/*
> +			 * bit [4] (the 5th bit when starting to count at 1)
> +			 * of the TSC is located in the HHI register area.
> +			 */
> +			regmap_update_bits(priv->tsc_regmap,
> +					   MESON_HHI_DPLL_TOP_0,
> +					   MESON_HHI_DPLL_TOP_0_TSC_BIT4,
> +					   regval);
> +		}
>  	} else {
>  		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELTA_10,
>  				   MESON_SAR_ADC_DELTA_10_TS_REVE1, 0);
> @@ -1064,6 +1094,9 @@ static const struct meson_sar_adc_param meson_sar_adc_meson8b_param = {
>  	.bandgap_reg = MESON_SAR_ADC_DELTA_10,
>  	.regmap_config = &meson_sar_adc_regmap_config_meson8,
>  	.resolution = 10,
> +	.temperature_trimming_bits = 5,
> +	.temperature_multiplier = 10,
> +	.temperature_divider = 32,
>  };
>  
>  static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
