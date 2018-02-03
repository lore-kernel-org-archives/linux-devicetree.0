From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 05/15] ARM: dts: ipq4019: Add ipq4019-ap-dk01-c2 board
 file
Date: Sat, 03 Feb 2018 16:25:53 +0530
Message-ID: <9afb20e560a7ebbcefcb801e7447a983@codeaurora.org>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
 <1517202689-14212-6-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517202689-14212-6-git-send-email-sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-01-29 10:41, Sricharan R wrote:
> The board has a spi-nand interface on spi0 bus chipselect1.
> 
> Signed-off-by: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                      |  1 +
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts | 25
> +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d0381e9..21ed56d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -724,6 +724,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8084-ifc6540.dtb \
>  	qcom-apq8084-mtp.dtb \
>  	qcom-ipq4019-ap.dk01.1-c1.dtb \
> +	qcom-ipq4019-ap.dk01.1-c2.dtb \
>  	qcom-ipq8064-ap148.dtb \
>  	qcom-msm8660-surf.dtb \
>  	qcom-msm8960-cdp.dtb \
> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts
> b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts
> new file mode 100644
> index 0000000..e3442da
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017, The Linux Foundation. All rights reserved.
> +
> +#include "qcom-ipq4019-ap.dk01.1.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ40xx/AP-DK01.1-C2";

  s/IPQ40xx/IPQ4019

> +
> +	soc {
> +		spi_0: spi@78b5000 { /* BLSP1 QUP1 */
> +			status = "ok";
> +			cs-gpios = <&tlmm 54 0>, <&tlmm 59 0>;

  the base dk01 file has pinmux for 54 only.
  for 59 pin, we need to add pinmux entry also.

  Thanks,
  Abhishek

> +			num-cs = <2>;
> +
> +			mt29f@1 {
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				compatible = "spinand,mt29f";
> +				reg = <1>;
> +				spi-max-frequency = <24000000>;
> +			};
> +
> +		};
> +	};
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
