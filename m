From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
Date: Tue, 30 Apr 2019 20:34:30 -0700
Message-ID: <20190501033430.GB2938@tuxbook-pro>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org, marc.w.gonzalez@free.fr, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 30 Apr 19:24 PDT 2019, Jeffrey Hugo wrote:

> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> index 8661c3c..7d45323 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -28,6 +28,16 @@ Required properties :
>  - #clock-cells : shall contain 1
>  - #reset-cells : shall contain 1
>  
> +For MSM8998 only:
> +	- clocks: a list of phandles and clock-specifier pairs,
> +		  one for each entry in clock-names.
> +	- clock-names: "xo" (required)
> +		       "usb3_pipe" (optional)
> +		       "ufs_rx_symbol0" (optional)
> +		       "ufs_rx_symbol1" (optional)
> +		       "ufs_tx_symbol0" (optional)
> +		       "pcie0_pipe" (optional)

The optional clocks here comes from hardware blocks that in turn depends
on the gcc, so we would need to resolve them lazily (in contrast to xo).

We typically don't list these in DT, but if this is close to the
complete list of incoming clocks then I like the explicitness of it.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +
>  Optional properties :
>  - #power-domain-cells : shall contain 1
>  - Qualcomm TSENS (thermal sensor device) on some devices can
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
