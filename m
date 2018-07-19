From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: drop legacy suffix for clocks used
 by MSM DRM driver
Date: Thu, 19 Jul 2018 12:53:04 +0200
Message-ID: <CAP71WjzPxxwNp-FkUsRAP4e_+Z_q12wcLeXryk-eYdLi-WJexg@mail.gmail.com>
References: <20180718145258.15254-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718145258.15254-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

hi Niklas,

On Wed, Jul 18, 2018 at 4:53 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> Drop legacy suffix for clocks used by MSM DRM driver.

I had the same patch locally, which I forgot to send.. so thanks for
sending it ;)

you might want to add in the commit log:

    Since "720c3bb80235 (drm/msm: drop _clk suffix from clk names)",
we can see such
    messages when booting:

> Fixes the following warnings:
>
> msm_dsi_phy 1a98300.dsi-phy: Using legacy clk name binding.  Use "iface" instead of "iface_clk"
> msm 1a00000.mdss: Using legacy clk name binding.  Use "iface" instead of "iface_clk"
> msm 1a00000.mdss: Using legacy clk name binding.  Use "bus" instead of "bus_clk"
> msm 1a00000.mdss: Using legacy clk name binding.  Use "vsync" instead of "vsync_clk"
> msm_mdp 1a01000.mdp: Using legacy clk name binding.  Use "bus" instead of "bus_clk"
> msm_mdp 1a01000.mdp: Using legacy clk name binding.  Use "iface" instead of "iface_clk"
> msm_mdp 1a01000.mdp: Using legacy clk name binding.  Use "core" instead of "core_clk"
> msm_mdp 1a01000.mdp: Using legacy clk name binding.  Use "vsync" instead of "vsync_clk"
> msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "mdp_core" instead of "mdp_core_clk"
> msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "iface" instead of "iface_clk"
> msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "bus" instead of "bus_clk"
> msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "byte" instead of "byte_clk"
> msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "pixel" instead of "pixel_clk"
> msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "core" instead of "core_clk"
>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 28 +++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index c2625d15a8c0..7b32b8990d62 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -858,9 +858,9 @@
>                         clocks = <&gcc GCC_MDSS_AHB_CLK>,
>                                  <&gcc GCC_MDSS_AXI_CLK>,
>                                  <&gcc GCC_MDSS_VSYNC_CLK>;
> -                       clock-names = "iface_clk",
> -                                     "bus_clk",
> -                                     "vsync_clk";
> +                       clock-names = "iface",
> +                                     "bus",
> +                                     "vsync";
>
>                         interrupts = <0 72 IRQ_TYPE_LEVEL_HIGH>;
>
> @@ -883,10 +883,10 @@
>                                          <&gcc GCC_MDSS_AXI_CLK>,
>                                          <&gcc GCC_MDSS_MDP_CLK>,
>                                          <&gcc GCC_MDSS_VSYNC_CLK>;
> -                               clock-names = "iface_clk",
> -                                             "bus_clk",
> -                                             "core_clk",
> -                                             "vsync_clk";
> +                               clock-names = "iface",
> +                                             "bus",
> +                                             "core",
> +                                             "vsync";
>
>                                 iommus = <&apps_iommu 4>;
>
> @@ -922,12 +922,12 @@
>                                          <&gcc GCC_MDSS_BYTE0_CLK>,
>                                          <&gcc GCC_MDSS_PCLK0_CLK>,
>                                          <&gcc GCC_MDSS_ESC0_CLK>;
> -                               clock-names = "mdp_core_clk",
> -                                             "iface_clk",
> -                                             "bus_clk",
> -                                             "byte_clk",
> -                                             "pixel_clk",
> -                                             "core_clk";
> +                               clock-names = "mdp_core",
> +                                             "iface",
> +                                             "bus",
> +                                             "byte",
> +                                             "pixel",
> +                                             "core";
>                                 phys = <&dsi_phy0>;
>                                 phy-names = "dsi-phy";
>
> @@ -963,7 +963,7 @@
>                                 #phy-cells = <0>;
>
>                                 clocks = <&gcc GCC_MDSS_AHB_CLK>;
> -                               clock-names = "iface_clk";
> +                               clock-names = "iface";
>                         };
>                 };
>
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
