From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] drm/msm/dsi: Get PHY ref clock from the DT
Date: Tue, 06 Nov 2018 15:11:48 -0800
Message-ID: <154154590845.88331.13649449650347478513@swboyd.mtv.corp.google.com>
References: <20181102214534.184593-1-mka@chromium.org>
 <20181102214534.184593-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102214534.184593-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Matthias Kaehlcke (2018-11-02 14:45:34)
> @@ -630,7 +632,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll=
_10nm)
>         char clk_name[32], parent[32], vco_name[32];
>         char parent2[32], parent3[32], parent4[32];
>         struct clk_init_data vco_init =3D {
> -               .parent_names =3D (const char *[]){ "xo" },
> +               .parent_names =3D (const char *[]){
> +                       __clk_get_name(pll_10nm->vco_ref_clk) },

I find this syntax odd, in addition to needing to check for NULL here as
Sean pointed out. Preferably just have it be the address of the
character pointer instead of making an anonymous array and then casting
that inline, i.e

		.parent_names =3D &ref_clk_name,

>                 .num_parents =3D 1,
>                 .name =3D vco_name,
>                 .flags =3D CLK_IGNORE_UNUSED,
> @@ -786,6 +789,12 @@ struct msm_dsi_pll *msm_dsi_pll_10nm_init(struct pla=
tform_device *pdev, int id)
>         pll_10nm->id =3D id;
>         pll_10nm_list[id] =3D pll_10nm;
>  =

> +       pll_10nm->vco_ref_clk =3D devm_clk_get(&pdev->dev, "ref");
> +       if (IS_ERR(pll_10nm->vco_ref_clk)) {
> +               dev_err(&pdev->dev, "couldn't get 'ref' clock\n");

This might be because of probe defer, which may be annoying to see this
failure many times.

> +               return (void *)pll_10nm->vco_ref_clk;
> +       }
> +
>         pll_10nm->phy_cmn_mmio =3D msm_ioremap(pdev, "dsi_phy", "DSI_PHY"=
);
>         if (IS_ERR_OR_NULL(pll_10nm->phy_cmn_mmio)) {
>                 dev_err(&pdev->dev, "failed to map CMN PHY base\n");
