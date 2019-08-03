From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/6] thermal: amlogic: Add thermal driver to support
 G12 SoCs
Date: Sat, 3 Aug 2019 20:24:54 +0200
Message-ID: <CAFBinCDGSJABnS1L1ULueyeXZaV38qrxEA0a12gB-uyRC_TvPQ@mail.gmail.com>
References: <20190731153529.30159-1-glaroque@baylibre.com> <20190731153529.30159-3-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731153529.30159-3-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: daniel.lezcano@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guillaume,

(I still don't have any experience with the thermal framework, so
below are some general comments)

On Wed, Jul 31, 2019 at 5:36 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
I would add a patch description here:
"
Amlogic G12A and G12B SoCs integrate two thermal sensors with the same design.
One is located close to the DDR (controller?) and the other one is
located close to the PLLs (between the CPU and GPU).

The calibration data for each of the thermal sensors instance is
stored in a different location within the AO region.

Implement reading the temperature from each thermal sensor.

The IP block has more functionality, which may be added to this driver
in the future:
- reading up to 16 stored temperature samples
- chip reset when the temperature exceeds a configurable threshold
- up to four interrupts when the temperature has risen above a
configurable threshold
- up to four interrupts when the temperature has fallen below a
configurable threshold
"

> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  drivers/thermal/Kconfig           |  11 +
>  drivers/thermal/Makefile          |   1 +
>  drivers/thermal/amlogic_thermal.c | 332 ++++++++++++++++++++++++++++++
>  3 files changed, 344 insertions(+)
>  create mode 100644 drivers/thermal/amlogic_thermal.c
>
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 9966364a6deb..0f31bb4bc372 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -348,6 +348,17 @@ config MTK_THERMAL
>           Enable this option if you want to have support for thermal management
>           controller present in Mediatek SoCs
>
> +config AMLOGIC_THERMAL
we typically use "MESON" in the Kconfig symbols:
$ grep -c AMLOGIC .config
1
$ grep -c MESON .config
33

I also wonder if we should add G12 or G12A so we don't conflict with
upcoming thermal sensors with a different design (assuming that this
will be a thing).
for example we already have three different USB2 PHY drivers

[...]
> +/*
> + * Calculate a temperature value from a temperature code.
> + * The unit of the temperature is degree Celsius.
is it really degree Celsius or millicelsius?

> + */
> +static int code_to_temp(struct amlogic_thermal *pdata, int temp_code)
PREFIX_thermal_code_to_millicelsius?

[...]
> +static int amlogic_thermal_enable(struct amlogic_thermal *data)
> +{
> +       clk_prepare_enable(data->clk);
no clock error handling?

> +       regmap_update_bits(data->regmap, TSENSOR_CFG_REG1,
> +                          TSENSOR_CFG_REG1_ENABLE, TSENSOR_CFG_REG1_ENABLE);
> +
> +       return 0;
> +}
> +
> +static int amlogic_thermal_disable(struct amlogic_thermal *data)
> +{
> +       regmap_update_bits(data->regmap, TSENSOR_CFG_REG1,
> +                          TSENSOR_CFG_REG1_ENABLE, 0);
> +       clk_disable(data->clk);
either clk_disable_unprepare here or use only clk_enable in
amlogic_thermal_enable and move prepare/unprepare somewhere else

> +
> +       return 0;
> +}
> +
> +static int amlogic_thermal_get_temp(void *data, int *temp)
> +{
> +       unsigned int tvalue;
> +       struct amlogic_thermal *pdata = data;
> +
> +       if (!data)
> +               return -EINVAL;
> +
> +       regmap_read(pdata->regmap, TSENSOR_STAT0, &tvalue);
> +       *temp = code_to_temp(pdata,
> +                            tvalue & TSENSOR_READ_TEMP_MASK);
maybe simply move the implementation from code_to_temp here?

[...]
> +static const struct amlogic_thermal_data amlogic_thermal_g12_cpu_param = {
> +       .u_efuse_off = 0x128,
> +       .soc = &amlogic_thermal_g12,
based on the variable name I expected this to be an enum of some sort.
I would have expected it to be called calibration_parameters or
similar to match the explanation in the driver description
(no need to change it if you prefer it like this, I just want to make
you aware of this)

> +       .regmap_config = &amlogic_thermal_regmap_config_g12,
if regmap_config is always the same you may also pass it directly to
devm_regmap_init_mmio

> +};
> +
> +static const struct amlogic_thermal_data amlogic_thermal_g12_ddr_param = {
> +       .u_efuse_off = 0xF0,
I believe we use lower-case hex everywhere else

[...]
> +static const struct of_device_id of_amlogic_thermal_match[] = {
> +       {
> +               .compatible = "amlogic,g12-ddr-thermal",
> +               .data = &amlogic_thermal_g12_ddr_param,
> +       },
> +       {
> +               .compatible = "amlogic,g12-cpu-thermal",
> +               .data = &amlogic_thermal_g12_cpu_param,
> +       },
> +       { /* end */ }
other drivers use "sentinel", but personally I have no preference here

[...]
> +       pdata->tzd = devm_thermal_zone_of_sensor_register
> +                               (&pdev->dev,
> +                                0,
> +                                pdata,
> +                                &amlogic_thermal_ops);
I believe the opening brace has to go onto the same line as the function name

[...]
> +       ret = amlogic_thermal_enable(pdata);
> +       if (ret)
> +               clk_unprepare(pdata->clk);
clk_disable_unprepare, else you'll leave the clock prepared

> +#ifdef CONFIG_PM_SLEEP
> +static int amlogic_thermal_suspend(struct device *dev)
> +{
> +       struct amlogic_thermal *data = dev_get_drvdata(dev);
> +
> +       return amlogic_thermal_disable(data);
> +}
> +
> +static int amlogic_thermal_resume(struct device *dev)
> +{
> +       struct amlogic_thermal *data = dev_get_drvdata(dev);
> +
> +       return amlogic_thermal_enable(data);
> +}
> +#endif
instead of using an #ifdef here annotate the suspend/resume functions
with __maybe_unused, see [0]


Martin


[0] https://lore.kernel.org/patchwork/patch/732981/
