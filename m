From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 08/17] arm64: dts: qcom: pms405: add spmi node
Date: Mon, 5 Nov 2018 11:03:18 -0800
Message-ID: <20181105190318.GN2523@minitux>
References: <20181105154529.7614-1-vkoul@kernel.org>
 <20181105154529.7614-9-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105154529.7614-9-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 07:45 PST 2018, Vinod Koul wrote:

> Add the pms405 DT file with spmi node.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pms405.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pms405.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
> new file mode 100644
> index 000000000000..8a585180f102
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018, Linaro Limited
> +
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +

Please drop the empty line.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +	pms405_0: pms405@0 {
> +		compatible = "qcom,spmi-pmic";
> +		reg = <0x0 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +	};
> +};
> -- 
> 2.14.4
> 
