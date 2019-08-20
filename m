From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm8150-mtp: add base dts file
Date: Tue, 20 Aug 2019 14:26:45 +0200
Message-ID: <20190820122645.GB31261@centauri>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-6-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820064216.8629-6-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 12:12:13PM +0530, Vinod Koul wrote:
> This add base DTS file for sm8150-mtp and enables boot to console, adds
> tlmm reserved range, resin node, volume down key and also includes pmic
> file.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |  1 +
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 48 +++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 0a7e5dfce6f7..1964dacaf19b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -12,5 +12,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> new file mode 100644
> index 000000000000..80b15f4f07c8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +/dts-v1/;
> +
> +#include "sm8150.dtsi"
> +#include "pm8150.dtsi"
> +#include "pm8150b.dtsi"
> +#include "pm8150l.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SM8150 MTP";
> +	compatible = "qcom,sm8150-mtp";
> +
> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&pon {
> +	pwrkey {
> +		status = "okay";
> +	};
> +
> +	resin {
> +		compatible = "qcom,pm8941-resin";
> +		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +		debounce = <15625>;
> +		bias-pull-up;
> +		linux,code = <KEY_VOLUMEDOWN>;
> +	};
> +};

Missing a newline here.

> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <126 4>;
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> -- 
> 2.20.1
> 
