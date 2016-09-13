From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] arm: dts: qcom: apq8064: Add display DT nodes
Date: Tue, 13 Sep 2016 14:44:11 -0700
Message-ID: <cfb9dbc8-40bd-e790-d3d3-5b2c40d58f88@codeaurora.org>
References: <1472737015-29382-1-git-send-email-architt@codeaurora.org>
 <1473780097-11388-1-git-send-email-architt@codeaurora.org>
 <1473780097-11388-4-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473780097-11388-4-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/13/2016 08:21 AM, Archit Taneja wrote:
> APQ8064 contains a MDP4 based display controller. It contains a HDMI, LVDS
> and 2 DSI outputs.
>
> Add display DT nodes for MDP4, HDMI TX and HDMI PHY. MDP4 based display
> blocks have a flat device hierarchy.
>
> Nodes for other outputs will be added later.
>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
> Tested-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 91 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 74a9b6c..b688fb6 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -955,6 +955,97 @@
>  			reset-names = "axi", "ahb", "por", "pci", "phy";
>  			status = "disabled";
>  		};
> +
> +		hdmi: hdmi-tx@4a00000 {
> +			compatible = "qcom,hdmi-tx-8960";
> +			reg = <0x04a00000 0x2f0>;
> +			reg-names = "core_physical";
> +			interrupts = <GIC_SPI 79 IRQ_TYPE_NONE>;

Please specify the IRQ_TYPE that isn't NONE here.

> +			clocks = <&mmcc HDMI_APP_CLK>,
> +				 <&mmcc HDMI_M_AHB_CLK>,
> +				 <&mmcc HDMI_S_AHB_CLK>;
> +			clock-names = "core_clk",
> +				      "master_iface_clk",
> +				      "slave_iface_clk";
> +
> +			phys = <&hdmi_phy>;
> +			phy-names = "hdmi-phy";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					hdmi_in: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					hdmi_out: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		hdmi_phy: hdmi-phy@4a00400 {
> +			compatible = "qcom,hdmi-phy-8960";
> +			reg = <0x4a00400 0x60>,
> +			      <0x4a00500 0x100>;
> +			reg-names = "hdmi_phy",
> +				    "hdmi_pll";
> +
> +			clocks = <&mmcc HDMI_S_AHB_CLK>;
> +			clock-names = "slave_iface_clk";
> +		};
> +
> +		mdp: mdp@5100000 {
> +			compatible = "qcom,mdp4";
> +			reg = <0x05100000 0xf0000>;
> +			interrupts = <GIC_SPI 75 IRQ_TYPE_NONE>;

Same comment here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
