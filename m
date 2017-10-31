From: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] iio: adc: aspeed: Deassert reset in probe
Date: Tue, 31 Oct 2017 12:58:25 +0100
Message-ID: <CA+gwMcdVpq1P5kWAWzkg2A+Ah-fKyTk0adhGdg4465gkOY3EKA@mail.gmail.com>
References: <20171031021203.18248-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171031021203.18248-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 31, 2017 at 3:12 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> The ASPEED SoC must deassert a reset in order to use the ADC peripheral.
>
> The device tree bindings are updated to document the resets phandle, and
> the example is updated to match what is expected for both the reset and
> clock phandle. Note that the bindings should have always had the reset
> controller, as the hardware is unusable without it.
>
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

It is unfortunate that this has to break DT (theoretical) backwards
compatibility, but given that the old bindings never worked,
this is better than to pretend a required reset is optional.

Reviewed-by: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

regards
Philipp

> ---
> v2:
>  - Ensure disabling path unwinds in opposite order as the enable path
>  - Note that the bindings were incorrect without the reset phandle,
>  and for the system to be usable we must update them. No one was
>  (successfully) using these bindings/driver before without out of tree
>  hacks in mach-aspeed, as it would not have worked.
>
>  .../devicetree/bindings/iio/adc/aspeed_adc.txt     |  4 +++-
>  drivers/iio/adc/aspeed_adc.c                       | 25 ++++++++++++++++------
>  2 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> index 674e133b7cd7..034fc2ba100e 100644
> --- a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> @@ -8,6 +8,7 @@ Required properties:
>  - reg: memory window mapping address and length
>  - clocks: Input clock used to derive the sample clock. Expected to be the
>            SoC's APB clock.
> +- resets: Reset controller phandle
>  - #io-channel-cells: Must be set to <1> to indicate channels are selected
>                       by index.
>
> @@ -15,6 +16,7 @@ Example:
>         adc@1e6e9000 {
>                 compatible = "aspeed,ast2400-adc";
>                 reg = <0x1e6e9000 0xb0>;
> -               clocks = <&clk_apb>;
> +               clocks = <&syscon ASPEED_CLK_APB>;
> +               resets = <&syscon ASPEED_RESET_ADC>;
>                 #io-channel-cells = <1>;
>         };
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 8a958d5f1905..327a49ba1991 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
>
> @@ -53,11 +54,12 @@ struct aspeed_adc_model_data {
>  };
>
>  struct aspeed_adc_data {
> -       struct device   *dev;
> -       void __iomem    *base;
> -       spinlock_t      clk_lock;
> -       struct clk_hw   *clk_prescaler;
> -       struct clk_hw   *clk_scaler;
> +       struct device           *dev;
> +       void __iomem            *base;
> +       spinlock_t              clk_lock;
> +       struct clk_hw           *clk_prescaler;
> +       struct clk_hw           *clk_scaler;
> +       struct reset_control    *rst;
>  };
>
>  #define ASPEED_CHAN(_idx, _data_reg_addr) {                    \
> @@ -217,6 +219,15 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>                 goto scaler_error;
>         }
>
> +       data->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +       if (IS_ERR(data->rst)) {
> +               dev_err(&pdev->dev,
> +                       "invalid or missing reset controller device tree entry");
> +               ret = PTR_ERR(data->rst);
> +               goto reset_error;
> +       }
> +       reset_control_deassert(data->rst);
> +
>         model_data = of_device_get_match_data(&pdev->dev);
>
>         if (model_data->wait_init_sequence) {
> @@ -263,9 +274,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>         writel(ASPEED_OPERATION_MODE_POWER_DOWN,
>                 data->base + ASPEED_REG_ENGINE_CONTROL);
>         clk_disable_unprepare(data->clk_scaler->clk);
> +reset_error:
> +       reset_control_assert(data->rst);
>  clk_enable_error:
>         clk_hw_unregister_divider(data->clk_scaler);
> -
>  scaler_error:
>         clk_hw_unregister_divider(data->clk_prescaler);
>         return ret;
> @@ -280,6 +292,7 @@ static int aspeed_adc_remove(struct platform_device *pdev)
>         writel(ASPEED_OPERATION_MODE_POWER_DOWN,
>                 data->base + ASPEED_REG_ENGINE_CONTROL);
>         clk_disable_unprepare(data->clk_scaler->clk);
> +       reset_control_assert(data->rst);
>         clk_hw_unregister_divider(data->clk_scaler);
>         clk_hw_unregister_divider(data->clk_prescaler);
>
> --
> 2.14.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
