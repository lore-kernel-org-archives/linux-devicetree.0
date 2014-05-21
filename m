From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v1 1/4] ARM: dts: qcom: Add APQ8084 SoC support
Date: Wed, 21 May 2014 10:24:17 -0700
Message-ID: <537CE141.6010500@codeaurora.org>
References: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com> <1400684225-21381-2-git-send-email-gdjakov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400684225-21381-2-git-send-email-gdjakov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <gdjakov@mm-sol.com>
Cc: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rvaswani@codeaurora.org, davidb@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/21/14 07:57, Georgi Djakov wrote:
> +
> +		L2: l2-cache {
> +			compatible = "qcom,arch-cache";
> +			cache-level = <2>;
> +			interrupts = <0 2 0x4>;

Let's leave out interrupts until the binding is accepted.

> +			qcom,saw = <&saw_l2>;
> +		};
> +	};
> +
> +	cpu-pmu {
> +		compatible = "qcom,krait-pmu";
> +		interrupts = <1 7 0xf04>;
> +	};
> +
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		compatible = "simple-bus";
> +
> +		intc: interrupt-controller@f9000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0xf9000000 0x1000>,
> +			      <0xf9002000 0x1000>;
> +		};
> +
> +		timer {
> +			compatible = "arm,armv7-timer";
> +			interrupts = <1 2 0xf08>,
> +				     <1 3 0xf08>,
> +				     <1 4 0xf08>,
> +				     <1 1 0xf08>;
> +			clock-frequency = <19200000>;
> +		};

Please move this timer node out of the soc container below the pmu.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
