From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and
 evaluation board dts
Date: Thu, 12 Mar 2015 17:05:41 +0000
Message-ID: <20150312170541.GE30145@leverpostej>
References: <1426107080-29079-1-git-send-email-galak@codeaurora.org>
 <1426107080-29079-2-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426107080-29079-2-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Hi Kumar,

> +/ {
> +	model = "Qualcomm Technologies, Inc. MSM 8916 MTP";
> +	compatible = "qcom,msm8916-mtp", "qcom,msm8916-mtp-smb1360",
> +			"qcom,msm8916", "qcom,mtp";
> +};

No /chosen/stdout-path?

Does your UART driver support earlycon?

[...]

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			reg = <0x0>;
> +		};
> +
> +		CPU1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			reg = <0x1>;
> +		};
> +
> +		CPU2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			reg = <0x2>;
> +		};
> +
> +		CPU3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			reg = <0x3>;
> +		};
> +	};

The secondary CPUs need an enable-method. Are you using PSCI or
spin-table? 

Which exception level do the CPUs enter the kernel?

> +	timer {
> +		compatible = "arm,armv7-timer";

This should be "arm,armv8-timer".

> +		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <19200000>;
> +	};

NAK. CNTFRQ should be programmed on all CPUs prior to entering the
kernel, per the boot protocol. You should not need clock-frequency here.

[...]

> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";

This string isn't documented (but seems to be supported by the GIC
driver).

How does this differ from other GIC implementations?

> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
> +		};

No GICH, GICV, maintenance interrupt?

Minor nit, but I'd prefer if the reg entries were on individual lines as
happens in other dts.

Thanks,
Mark.
