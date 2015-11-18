From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 10/10] dt-bindings: Add DSIv2 documentation
Date: Wed, 18 Nov 2015 07:18:51 -0600
Message-ID: <CAL_JsqJufZvsGyxZ40+kPcAVr5mXqCi+Qej_8X6=GRxT9j+5+w@mail.gmail.com>
References: <1444827544-25656-1-git-send-email-architt@codeaurora.org>
 <1447844131-4182-1-git-send-email-architt@codeaurora.org> <1447844131-4182-11-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1447844131-4182-11-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+dt list

On Wed, Nov 18, 2015 at 4:55 AM, Archit Taneja <architt@codeaurora.org> wrote:
> Add additional property info needed for DSIv2 DT.

Please use get_maintainers.pl.

> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index f344b9e..ca65a34 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -13,18 +13,25 @@ Required properties:
>  - power-domains: Should be <&mmcc MDSS_GDSC>.
>  - clocks: device clocks
>    See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
> -- clock-names: the following clocks are required:
> +- clock-names: these vary based on the DSI version. For DSI6G:
>    * "bus_clk"
>    * "byte_clk"
> +  * "byte_clk_src

This sounds like the parent of byte_clk. Is that really a clock within
the block?

>    * "core_clk"
>    * "core_mmss_clk"
>    * "iface_clk"
>    * "mdp_core_clk"
>    * "pixel_clk"
> +  * "pixel_clk_src"
> +  For DSIv2, we need a few more:

What is the overall order of clocks? As listed?

> +   * "dsi_clk_src"
> +   * "esc_clk_src"
> +   * "src_clk"
>  - vdd-supply: phandle to vdd regulator device node
>  - vddio-supply: phandle to vdd-io regulator device node
>  - vdda-supply: phandle to vdda regulator device node
>  - qcom,dsi-phy: phandle to DSI PHY device node
> +- syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
>
>  Optional properties:
>  - panel@0: Node of panel connected to this DSI controller.
> @@ -51,6 +58,7 @@ Required properties:
>    * "qcom,dsi-phy-28nm-hpm"
>    * "qcom,dsi-phy-28nm-lp"
>    * "qcom,dsi-phy-20nm"
> +  * "qcom,dsi-phy-28nm-8960"
>  - reg: Physical base address and length of the registers of PLL, PHY and PHY
>    regulator
>  - reg-names: The names of register regions. The following regions are required:
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
