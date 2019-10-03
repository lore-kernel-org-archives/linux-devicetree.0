From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v11 5/7] drm/sun4i: sun6i_mipi_dsi: Add VCC-DSI regulator support
Date: Thu, 3 Oct 2019 14:55:46 +0800
Message-ID: <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw@mail.gmail.com>
References: <20191003064527.15128-1-jagan@amarulasolutions.com> <20191003064527.15128-6-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003064527.15128-6-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Michael Trimarchi <michael@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 2:46 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Allwinner MIPI DSI controllers are supplied with SoC
> DSI power rails via VCC-DSI pin.
>
> Add support for this supply pin by adding voltage
> regulator handling code to MIPI DSI driver.
>
> Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 14 ++++++++++++++
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 ++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 446dc56cc44b..fe9a3667f3a1 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -1110,6 +1110,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
>                 return PTR_ERR(base);
>         }
>
> +       dsi->regulator = devm_regulator_get(dev, "vcc-dsi");
> +       if (IS_ERR(dsi->regulator)) {
> +               dev_err(dev, "Couldn't get VCC-DSI supply\n");
> +               return PTR_ERR(dsi->regulator);
> +       }
> +
>         dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
>                                               &sun6i_dsi_regmap_config);
>         if (IS_ERR(dsi->regs)) {
> @@ -1183,6 +1189,13 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
>  static int __maybe_unused sun6i_dsi_runtime_resume(struct device *dev)
>  {
>         struct sun6i_dsi *dsi = dev_get_drvdata(dev);
> +       int err;
> +
> +       err = regulator_enable(dsi->regulator);
> +       if (err) {
> +               dev_err(dsi->dev, "failed to enable VCC-DSI supply: %d\n", err);
> +               return err;
> +       }
>
>         reset_control_deassert(dsi->reset);
>         clk_prepare_enable(dsi->mod_clk);
> @@ -1215,6 +1228,7 @@ static int __maybe_unused sun6i_dsi_runtime_suspend(struct device *dev)
>
>         clk_disable_unprepare(dsi->mod_clk);
>         reset_control_assert(dsi->reset);
> +       regulator_disable(dsi->regulator);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> index 5c3ad5be0690..a01d44e9e461 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> @@ -12,6 +12,7 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_mipi_dsi.h>
> +#include <linux/regulator/consumer.h>

You don't need to include the header file since you are only
including a pointer to the struct, and nothing else.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>
>  #define SUN6I_DSI_TCON_DIV     4
>
> @@ -23,6 +24,7 @@ struct sun6i_dsi {
>         struct clk              *bus_clk;
>         struct clk              *mod_clk;
>         struct regmap           *regs;
> +       struct regulator        *regulator;
>         struct reset_control    *reset;
>         struct phy              *dphy;
>
> --
> 2.18.0.321.gffc6fa0e3
>
