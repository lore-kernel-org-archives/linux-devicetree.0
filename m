From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 01/17] arm64: dts: qcom: qcs404: add base dts files
Date: Mon, 5 Nov 2018 10:56:48 -0800
Message-ID: <20181105185648.GL2523@minitux>
References: <20181105154529.7614-1-vkoul@kernel.org>
 <20181105154529.7614-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105154529.7614-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 07:45 PST 2018, Vinod Koul wrote:

> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dts b/arch/arm64/boot/dts/qcom/qcs404-evb.dts
> new file mode 100644
> index 000000000000..74dc09ddb0d2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018, Linaro Limited
> +
> +// QCS EVB DTS

This can be read from the filename and the model a few lines down. So
please drop.

> +
> +/dts-v1/;
> +
> +#include "qcs404.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS404 EVB 1000";
> +	compatible = "qcom,qcs404-evb";
> +
> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
[..]
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 2 0xff08>,
> +			     <GIC_PPI 3 0xff08>,
> +			     <GIC_PPI 4 0xff08>,
> +			     <GIC_PPI 1 0xff08>;
> +	};
> +
> +	clocks {

Please sort these nodes alphabetically.

> +		xo_board: xo_board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +		};
> +	};
> +
> +	soc: soc@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		compatible = "simple-bus";
> +

Please pad the address in reg to 8 digits and sort these nodes by
address.

> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x0b000000 0x1000>,
> +			      <0x0b002000 0x1000>;
> +		};
> +

Regards,
Bjorn
