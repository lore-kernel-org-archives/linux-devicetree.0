From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/7] dt-bindings: display: msm/dsi: Add compatible for
 14nm DSI PHY
Date: Mon, 29 Jan 2018 11:15:44 -0600
Message-ID: <20180129171544.st53376xyjep2cfx@rob-hp-laptop>
References: <20180117093448.4102-1-architt@codeaurora.org>
 <20180117093448.4102-7-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180117093448.4102-7-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, latkinso@codeaurora.org, sibis@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 17, 2018 at 03:04:47PM +0530, Archit Taneja wrote:
> Add the compatible string for 14nm DSI PHY (used in MSM8996/APQ8096).
> From 14nm PHY onwards, the "dsi_phy_regulator" reg-name is not required,
> but "dsi_phy_lane" reg-name is. Update the doc to specify the reg-names
> each PHY revision needs.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index 9c3ad6bbb9f0..26a1796b7145 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -86,12 +86,19 @@ Required properties:
>    * "qcom,dsi-phy-28nm-lp"
>    * "qcom,dsi-phy-20nm"
>    * "qcom,dsi-phy-28nm-8960"
> -- reg: Physical base address and length of the registers of PLL, PHY and PHY
> -  regulator
> +  * "qcom,dsi-phy-14nm"
> +- reg: Physical base address and length of the registers of PLL, PHY. Some
> +  revisions require the PHY regulator base address, whereas others require the
> +  PHY lane base address. See below for each PHY revision.
>  - reg-names: The names of register regions. The following regions are required:
> +  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
>    * "dsi_pll"
>    * "dsi_phy"
>    * "dsi_phy_regulator"
> +  For DSI 14nm PHY:
> +  * "dsi_pll"
> +  * "dsi_phy"
> +  * "dsi_phy_lane"
>  - clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
>    2 clocks: A byte clock (index 0), and a pixel clock (index 1).
>  - power-domains: Should be <&mmcc MDSS_GDSC>.
> @@ -102,6 +109,8 @@ Required properties:
>  - vddio-supply: phandle to vdd-io regulator device node
>    For 20nm PHY:
>  - vddio-supply: phandle to vdd-io regulator device node
> +- vcca-supply: phandle to vcca regulator device node

Did you mean to add this?

> +  For 14nm PHY:
>  - vcca-supply: phandle to vcca regulator device node
>  
>  Optional properties:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
