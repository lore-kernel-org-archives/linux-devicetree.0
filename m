From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/6] thermal: amlogic: Add thermal driver to support
 G12 SoCs
Date: Sun, 11 Aug 2019 17:43:49 +0200
Message-ID: <CAFBinCAMjtWTAvVEhMxDx1NPvCp9dU8HewxBxxp1TAtr3ZbKtw@mail.gmail.com>
References: <20190806130506.8753-1-glaroque@baylibre.com> <20190806130506.8753-3-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806130506.8753-3-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: daniel.lezcano@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Guillaume,

[...]
> +struct amlogic_thermal {
> +       struct platform_device *pdev;
> +       const struct amlogic_thermal_data *data;
> +       struct regmap *regmap;
> +       struct regmap *sec_ao_map;
> +       struct clk *clk;
> +       struct thermal_zone_device *tzd;
> +       u32 trim_info;
> +       void __iomem *base;
nit-pick: this is only used in _probe() so you could make it a local
variable there

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
I assume you are using "g12" to indicate that it's valid for both,
G12A and G12B?
meson-g12-common.dtsi currently does not use any other "amlogic,g12-*"
compatible string (there are some meson-axg-*, meson-gx-* and
meson-g12a-* ones, but no g12-*)
I would like to hear Kevin's and Neil's opinion on this one whether we
should introduce that "amlogic,g12-*" prefix or stick to
"amlogic,g12a-*"

[...]
> +       ret = amlogic_thermal_enable(pdata);
> +       if (ret)
> +               clk_disable_unprepare(pdata->clk);
amlogic_thermal_enable only returns an error-code if clk_prepare_enable() fails
in that case the clock is neither prepared nor enabled so we must not
call clk_disable_unprepare

apart from that it looks good to me (as someone who doesn't know the
thermal framework)


Martin
