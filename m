From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 3/8] drm/msm/dsi: 28nm PHY: Get ref clock from the DT
Date: Tue, 04 Dec 2018 08:45:44 -0800
Message-ID: <154394194432.88331.17922799670031357358@swboyd.mtv.corp.google.com>
References: <20181201005254.139908-1-mka@chromium.org>
 <20181201005254.139908-4-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181201005254.139908-4-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Airlie <airlied@linux.ie>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Matthias Kaehlcke (2018-11-30 16:52:49)
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c b/drivers/gpu/drm=
/msm/dsi/pll/dsi_pll_28nm.c
> index 26e3a01a99c2b..4a84c69ca0b2b 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
> @@ -81,6 +81,7 @@ struct dsi_pll_28nm {
>         struct platform_device *pdev;
>         void __iomem *mmio;
>  =

> +       const char *vco_ref_clk_name;
>         int vco_delay;
>  =

>         /* private clocks: */
> @@ -265,7 +268,8 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(str=
uct clk_hw *hw,
>         void __iomem *base =3D pll_28nm->mmio;
>         u32 sdm0, doubler, sdm_byp_div;
>         u32 sdm_dc_off, sdm_freq_seed, sdm2, sdm3;
> -       u32 ref_clk =3D VCO_REF_CLK_RATE;
> +       u32 ref_clk =3D parent_rate ?
> +               parent_rate : VCO_REF_CLK_DEFAULT_RATE;

Same comments apply here.

>         unsigned long vco_rate;
>  =

>         VERB("parent_rate=3D%lu", parent_rate);
