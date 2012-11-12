From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: add board dts file for Exynos4412 based SMDK
 board
Date: Mon, 12 Nov 2012 15:07:08 +0100
Message-ID: <1629120.eNASZVgxGi@amdc1227>
References: <1351954172-13645-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1351954172-13645-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, chaos.youn@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On Saturday 03 of November 2012 20:19:32 Thomas Abraham wrote:
> Add a minimal board dts file for Samsung Exynos4412 based SMDK board.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> This patch depends the on the following patch posted by Tomasz Figa.
> "ARM: dts: exynos4: Add support for Exynos4x12 SoCs"
> 
>  arch/arm/boot/dts/Makefile                |    1 +
>  arch/arm/boot/dts/exynos4412-smdk4412.dts |   45
> +++++++++++++++++++++++++++++ 2 files changed, 46 insertions(+), 0
> deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4412-smdk4412.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f37cf9f..36488a5 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_DOVE) += dove-cm-a510.dtb \
>  dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>  	exynos4210-smdkv310.dtb \
>  	exynos4210-trats.dtb \
> +	exynos4412-smdk4412.dtb \
>  	exynos5250-smdk5250.dtb
>  dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb
>  dtb-$(CONFIG_ARCH_INTEGRATOR) += integratorap.dtb \
> diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts
> b/arch/arm/boot/dts/exynos4412-smdk4412.dts new file mode 100644
> index 0000000..f05bf57
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
> @@ -0,0 +1,45 @@
> +/*
> + * Samsung's Exynos4412 based SMDK board device tree source
> + *
> + * Copyright (c) 2012-2013 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * Device tree source file for Samsung's SMDK4412 board which is based
> on + * Samsung's Exynos4412 SoC.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as +
> * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +/include/ "exynos4412.dtsi"
> +
> +/ {
> +	model = "Samsung SMDK evaluation board based on Exynos4412";
> +	compatible = "samsung,smdk4412", "samsung,exynos4412";
> +
> +	memory {
> +		reg = <0x40000000 0x40000000>;
> +	};

This will not boot, because section size limit is set to 256 MiB.

It might work with CONFIG_ARM_ATAG_DTB_COMPAT enabled, because the memory 
configuration from DT is ignored and values from ATAGs are taken instead.

I suggest you to change it to 4 banks of 256 MiB.

> +	chosen {
> +		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M
> console=ttySAC1,115200 init=/linuxrc"; +	};
> +
> +	serial@13800000 {
> +		status = "okay";
> +	};
> +
> +	serial@13810000 {
> +		status = "okay";
> +	};
> +
> +	serial@13820000 {
> +		status = "okay";
> +	};
> +
> +	serial@13830000 {
> +		status = "okay";
> +	};
> +};

Otherwise looks fine.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
