From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC V4 PATCH 5/6] arm64: dts: msm8994 SoC and Huawei Angler
 (Nexus 6P) support
Date: Fri, 21 Oct 2016 11:25:33 -0700
Message-ID: <20161021182533.GX7509@tuxbot>
References: <1477048273-32451-1-git-send-email-jeremymc@redhat.com>
 <1477048273-32451-6-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477048273-32451-6-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, mark.rutland@arm.com, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri 21 Oct 04:11 PDT 2016, Jeremy McNicoll wrote:

> From: Bastian Köcher <mail@kchr.de>
> 
> Initial device tree support for Qualcomm MSM8994 SoC and
> Huawei Angler / Google Nexus 6P support.
> 
> The device tree is based on the Google 3.10 kernel tree.
> 
> The device can be booted into the initrd with only one CPU running.
> 

Looks reasonable as well, same two comments as the 8992 below.

> Signed-off-by: Bastian Köcher <mail@kchr.de>
> [jeremymc@redhat.com: removed Kconfig, defconfig, move from Huawei to qcom dir]
> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +-
>  .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |  42 ++++
>  arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |  38 ++++
>  arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi         |  32 +++
>  arch/arm64/boot/dts/qcom/msm8994.dtsi              | 236 +++++++++++++++++++++
>  5 files changed, 349 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8994.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index abb366e..4040fc8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,6 +1,6 @@
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb apq8096-db820c.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb msm8994-angler-rev-101.dtb

This won't scale, use multiple lines instead.

>  
>  always		:= $(dtb-y)
>  subdir-y	:= $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> new file mode 100644
> index 0000000..9684e6c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -0,0 +1,42 @@
> +/* Copyright (c) 2015, Huawei Inc. All rights reserved.
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +/dts-v1/;
> +
> +#include "msm8994-v2.0.dtsi"
> +
> +/ {
> +	model = "HUAWEI MSM8994 ANGLER rev-1.01";
> +	compatible = "qcom,msm8994";
> +	/* required for bootloader to select correct board */
> +	qcom,board-id = <8026 0>;
> +};
> +
> +/ {

No need to close and reopen / {} here.

> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	soc {
> +		serial@f991e000 {
> +			status = "okay";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&blsp1_uart2_default>;
> +			pinctrl-1 = <&blsp1_uart2_sleep>;
> +		};
> +	};
> +};
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
[..]
> +	msmgpio: pinctrl@fd510000 {
> +		compatible = "qcom,msm8994-pinctrl", "qcom,msm8974-pinctrl";

msm8974 TLMM won't work here either, so please drop that.

> +		reg = <0xfd510000 0x4000>;
> +		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};

Regards,
Bjorn
