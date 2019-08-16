From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 07/15] dt: thermal: tsens: Document interrupt support in
 tsens driver
Date: Fri, 16 Aug 2019 16:36:48 -0500
Message-ID: <20190816213648.GA10244@bogus>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <72bce036fa8cba3db6e5ba82249837ee46e9c077.1564091601.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <72bce036fa8cba3db6e5ba82249837ee46e9c077.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 03:48:42AM +0530, Amit Kucheria wrote:
> Define two new required properties to define interrupts and
> interrupt-names for tsens.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> index 673cc1831ee9..3d3dd5dc6d36 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> @@ -22,6 +22,8 @@ Required properties:
>  
>  - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description.
>  - #qcom,sensors: Number of sensors in tsens block
> +- interrupts: Interrupts generated from Always-On subsystem (AOSS)
> +- interrupt-names: The name of the interrupt e.g. "tsens0", "tsens1"

How many interrupts? A name with just indices isn't too useful.

>  - Refer to Documentation/devicetree/bindings/nvmem/nvmem.txt to know how to specify
>  nvmem cells
>  
> @@ -40,6 +42,9 @@ tsens0: thermal-sensor@c263000 {
>  		reg = <0xc263000 0x1ff>, /* TM */
>  			<0xc222000 0x1ff>; /* SROT */
>  		#qcom,sensors = <13>;
> +		interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "tsens0";
> +
>  		#thermal-sensor-cells = <1>;
>  	};
>  
> -- 
> 2.17.1
> 
