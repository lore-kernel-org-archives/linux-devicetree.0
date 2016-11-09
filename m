From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/3] clk: qcom: Add A53 clock driver
Date: Wed, 9 Nov 2016 12:24:40 -0600
Message-ID: <20161109182440.hjiv725vpsh5dctd@rob-hp-laptop>
References: <20161031145526.5023-1-georgi.djakov@linaro.org>
 <20161031145526.5023-4-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161031145526.5023-4-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 31, 2016 at 04:55:26PM +0200, Georgi Djakov wrote:
> Add a driver for the A53 Clock Controller. It is a hardware block that
> implements a combined mux and half integer divider functionality. It can
> choose between a fixed-rate clock or the dedicated A53 PLL. The source
> and the divider can be set both at the same time.
> 
> This is required for enabling CPU frequency scaling on platforms like
> MSM8916.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/qcom,a53cc.txt       |  23 ++++
>  drivers/clk/qcom/Kconfig                           |   8 ++
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/a53cc.c                           | 152 +++++++++++++++++++++
>  4 files changed, 184 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
>  create mode 100644 drivers/clk/qcom/a53cc.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53cc.txt b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
> new file mode 100644
> index 000000000000..82d1634a2713
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
> @@ -0,0 +1,23 @@
> +Qualcomm A53 CPU Clock Controller Binding
> +------------------------------------------------
> +The A53 CPU Clock Controller is hardware, which provides a combined
> +mux and divider functionality for the CPU clocks. It can choose between
> +a fixed rate clock and the dedicated A53 PLL. This hardware block is used
> +on platforms such as msm8916.
> +
> +Required properties :
> +- compatible : shall contain:
> +
> +			"qcom,a53cc-msm8916"

Same comment on the ordering. With that, for the binding:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +
> +- reg : shall contain base register location and length
> +	of the APCS region
> +- #clock-cells : shall contain 1
> +
> +Example:
> +
> +	apcs: syscon@b011000 {
> +		compatible = "qcom,a53cc-msm8916";
> +		reg = <0x0b011000 0x1000>;
> +		#clock-cells = <1>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
