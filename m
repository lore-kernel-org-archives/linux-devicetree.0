From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 4/6] edac: Document Krait L1/L2 EDAC driver binding
Date: Wed, 30 Oct 2013 16:45:39 -0500
Message-ID: <872F86E8-85CE-472B-9546-CDCC96F6F08B@codeaurora.org>
References: <1383164736-1849-1-git-send-email-sboyd@codeaurora.org> <1383164736-1849-5-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1383164736-1849-5-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Oct 30, 2013, at 3:25 PM, Stephen Boyd wrote:

> The Krait L1/L2 error reporting device is made up of two
> interrupts, one per-CPU interrupt for the L1 caches and one
> interrupt for the L2 cache.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> Documentation/devicetree/bindings/arm/cpus.txt | 49 ++++++++++++++++++++++++++
> 1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index f32494d..0f7b27f 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -44,6 +44,8 @@ For the ARM architecture every CPU node must contain the following properties:
> 		"marvell,mohawk"
> 		"marvell,xsc3"
> 		"marvell,xscale"
> +		"qcom,scorpion"
> +		"qcom,krait"
> 
> Example:
> 
> @@ -75,3 +77,50 @@ Example:
> 			reg = <0x101>;
> 		};
> 	};
> +
> +If the compatible string contains "qcom,krait" there shall be an interrupts
> +property containing the L1/CPU error interrupt number. There shall also be an

'also be a'

> +l2-cache node containing the following properties:

Is the L1 interrupt not per core L1 cache (even if they are OR together at PIC)?

> +
> + - compatible: Shall contain at least "cache"
> + - cache-level: Must be 2
> + - interrupts: Shall contain the L2 error interrupt
> +
> +Example:
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		interrupts = <1 9 0xf04>;
> +		compatible = "qcom,krait";
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			reg = <0>;
> +			next-level-cache = <&L2>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			reg = <1>;
> +			next-level-cache = <&L2>;
> +		};
> +
> +		cpu@2 {
> +			device_type = "cpu";
> +			reg = <2>;
> +			next-level-cache = <&L2>;
> +		};
> +
> +		cpu@3 {
> +			device_type = "cpu";
> +			reg = <3>;
> +			next-level-cache = <&L2>;
> +		};
> +
> +		L2: l2-cache {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			interrupts = <0 2 0x4>;
> +		};
> +	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
