From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 2/8] drm/msm/dsi: 28nm 8960 PHY: Get ref clock from the DT
Date: Tue, 04 Dec 2018 08:44:00 -0800
Message-ID: <154394184065.88331.4558186365546696323@swboyd.mtv.corp.google.com>
References: <20181201005254.139908-1-mka@chromium.org>
 <20181201005254.139908-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181201005254.139908-3-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Airlie <airlied@linux.ie>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Matthias Kaehlcke (2018-11-30 16:52:48)
> Get the ref clock of the PHY from the device tree instead of
> hardcoding its name and rate. Use default values if the ref
> clock is not specified.
> =

> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v3:
> - use default name and rate if the ref clock is not specified
>   in the DT
> - store vco_ref_clk_name instead of vco_ref_clk
> - fixed check for EPROBE_DEFER
> - renamed VCO_REF_CLK_RATE to VCO_REF_CLK_DEFAULT_RATE
> =

> Changes in v2:
> - patch added to the series
> ---
>  .../gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c   | 28 +++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c b/drivers/gp=
u/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
> index 49008451085b8..3af678d3317f6 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
> @@ -47,9 +47,9 @@
>  =

>  #define NUM_PROVIDED_CLKS      2
>  =

> -#define VCO_REF_CLK_RATE       27000000
> -#define VCO_MIN_RATE           600000000
> -#define VCO_MAX_RATE           1200000000
> +#define VCO_REF_CLK_DEFAULT_RATE       27000000
> +#define VCO_MIN_RATE                   600000000
> +#define VCO_MAX_RATE                   1200000000
>  =

>  #define DSI_BYTE_PLL_CLK       0
>  #define DSI_PIXEL_PLL_CLK      1
> @@ -75,6 +75,8 @@ struct dsi_pll_28nm {
>         struct platform_device *pdev;
>         void __iomem *mmio;
>  =

> +       const char *vco_ref_clk_name;

Can this be passed around during clk registration so we don't have to
store it away in the structure?

> +
>         /* custom byte clock divider */
>         struct clk_bytediv *bytediv;
>  =

> @@ -125,7 +127,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *=
hw, unsigned long rate,
>         DBG("rate=3D%lu, parent's=3D%lu", rate, parent_rate);
>  =

>         temp =3D rate / 10;
> -       val =3D VCO_REF_CLK_RATE / 10;
> +       if (parent_rate)
> +               val =3D parent_rate / 10;
> +       else
> +               val =3D VCO_REF_CLK_DEFAULT_RATE / 10;

Is the clk not properly hooked up to a parent sometimes so parent_rate
is 0? That sounds odd given the fact that it used to be 'pxo' and that
has always existed on the system as 27 MHz. So I'd remove this and just
use parent_rate all the time.
