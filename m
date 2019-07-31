From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/6] thermal: amlogic: Add thermal driver to support G12
 SoCs
Date: Wed, 31 Jul 2019 14:45:25 +0200
Message-ID: <abd22b63-3da2-602a-8fc3-09085706343c@baylibre.com>
References: <20190731121409.17285-1-glaroque@baylibre.com>
 <20190731121409.17285-3-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731121409.17285-3-glaroque@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, daniel.lezcano@linaro.org, khilman@baylibre.com
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 31/07/2019 14:14, Guillaume La Roque wrote:
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  drivers/thermal/Kconfig           |  12 +-
>  drivers/thermal/Makefile          |   1 +
>  drivers/thermal/amlogic_thermal.c | 335 ++++++++++++++++++++++++++++++
>  3 files changed, 347 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/thermal/amlogic_thermal.c
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 9966364a6deb..2332ef1bfafc 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -1,4 +1,3 @@
> -# SPDX-License-Identifier: GPL-2.0-only

|\ typo ?

>  #
>  # Generic thermal sysfs drivers configuration
>  #
> @@ -348,6 +347,17 @@ config MTK_THERMAL
>  	  Enable this option if you want to have support for thermal management
>  	  controller present in Mediatek SoCs
>  
> +config AMLOGIC_THERMAL
> +	tristate "Amlogic Thermal Support"
> +	default ARCH_MESON
> +	depends on OF && ARCH_MESON
> +	help
> +	  If you say yes here you get support for Amlogic Thermal
> +	  for G12 SoC Family.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called amlogic_thermal.
> +
>  menu "Intel thermal drivers"
>  depends on X86 || X86_INTEL_QUARK || COMPILE_TEST
>  source "drivers/thermal/intel/Kconfig"

[...]
