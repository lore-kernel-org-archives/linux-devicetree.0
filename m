From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] Documentation: clock: address more for clock-cells
 property
Date: Fri, 2 Jun 2017 15:56:21 -0700
Message-ID: <20170602225621.GE20170@codeaurora.org>
References: <1496306801-19239-1-git-send-email-zhang.chunyan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1496306801-19239-1-git-send-email-zhang.chunyan@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, zhang.lyra@gmail.com
List-Id: devicetree@vger.kernel.org

On 06/01, Chunyan Zhang wrote:
> The value of property 'clock-cells' is not determined only by the number of
> clock outputs in one clock node, it is actually determined by whether the
> clock output in this node can be referenced directly without index.  If
> the output clock has to be referenced by a index, the clock-cell of this
> clock node can't be defined 0.
> 
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/clock-bindings.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

I'm leaving this patch for Rob/DT maintainers to apply.

> 
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index 2ec489e..cef3db5 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -15,8 +15,14 @@ value of a #clock-cells property in the clock provider node.
>  
>  Required properties:
>  #clock-cells:	   Number of cells in a clock specifier; Typically 0 for nodes
> -		   with a single clock output and 1 for nodes with multiple
> -		   clock outputs.
> +		   with a single clock output and it must be able to be
> +		   referenced without index, and 1 for nodes with single or
> +		   multiple clock outputs which have to be referenced by index.
> +
> +		   Please note that if a node with a single clock output
> +		   but it has "clock-indices" property (see bellow), it has
> +		   to be referenced by index, its "#clock-cells" cannot be
> +		   defined 0.

Maybe this should be added to the clock-indices area of the
document instead of here? It seems to me that you can't have
clock-indices if you have #clock-cells=<0>, and that's sort of
obvious because 0 cells means 1 output and >0 cells means
potentially many outputs.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
