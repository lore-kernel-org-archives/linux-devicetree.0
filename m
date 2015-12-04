From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 11/12] dt-bindings: msm/dsi: Fix the order in which
 clocks are listed
Date: Fri, 4 Dec 2015 08:45:39 -0600
Message-ID: <20151204144539.GA15360@rob-hp-laptop>
References: <1447844131-4182-1-git-send-email-architt@codeaurora.org>
 <1448964010-18207-1-git-send-email-architt@codeaurora.org>
 <1448964010-18207-12-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448964010-18207-12-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 01, 2015 at 03:30:09PM +0530, Archit Taneja wrote:
> List the clocks in the order that's used in DT. We don't have mdp/dsi
> DT nodes for any SoC in upstream yet, but we align with the order
> we intend to use.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index f344b9e..e097955 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -14,13 +14,13 @@ Required properties:
>  - clocks: device clocks
>    See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
>  - clock-names: the following clocks are required:
> +  * "mdp_core_clk"
> +  * "iface_clk"
>    * "bus_clk"
> -  * "byte_clk"
> -  * "core_clk"
>    * "core_mmss_clk"
> -  * "iface_clk"
> -  * "mdp_core_clk"
> +  * "byte_clk"
>    * "pixel_clk"
> +  * "core_clk"
>  - vdd-supply: phandle to vdd regulator device node
>  - vddio-supply: phandle to vdd-io regulator device node
>  - vdda-supply: phandle to vdda regulator device node
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
