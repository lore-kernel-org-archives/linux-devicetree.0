From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH v5 03/18] thermal: fix indentation in makefile
Date: Wed, 28 Aug 2019 20:40:33 +0800
Message-ID: <63b8753a2a58688e75f6e03c46c84a064a123d85.camel@intel.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com>
         <20190810052829.6032-4-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190810052829.6032-4-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 2019-08-10 at 05:28 +0000, Yangtao Li wrote:
> To unify code style.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

the later patches in this series does not change Makefile.
So this seems to be a cleanup patch independent of this patch set.
It's better to remove this patch from this patch series.

thanks,
rui
> ---
>  drivers/thermal/Makefile | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index fa6f8b206281..d7eafb5ef8ef 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -5,7 +5,7 @@
>  
>  obj-$(CONFIG_THERMAL)		+= thermal_sys.o
>  thermal_sys-y			+= thermal_core.o
> thermal_sysfs.o \
> -					thermal_helpers.o
> +				   thermal_helpers.o
>  
>  # interface to/from other layers providing sensors
>  thermal_sys-$(CONFIG_THERMAL_HWMON)		+= thermal_hwmon.o
> @@ -25,11 +25,11 @@ thermal_sys-$(CONFIG_CPU_THERMAL)	+=
> cpu_cooling.o
>  thermal_sys-$(CONFIG_CLOCK_THERMAL)	+= clock_cooling.o
>  
>  # devfreq cooling
> -thermal_sys-$(CONFIG_DEVFREQ_THERMAL) += devfreq_cooling.o
> +thermal_sys-$(CONFIG_DEVFREQ_THERMAL) 	+= devfreq_cooling.o
>  
>  # platform thermal drivers
>  obj-y				+= broadcom/
> -obj-$(CONFIG_THERMAL_MMIO)		+= thermal_mmio.o
> +obj-$(CONFIG_THERMAL_MMIO)	+= thermal_mmio.o
>  obj-$(CONFIG_SPEAR_THERMAL)	+= spear_thermal.o
>  obj-$(CONFIG_SUN8I_THERMAL)     += sun8i_thermal.o
>  obj-$(CONFIG_ROCKCHIP_THERMAL)	+= rockchip_thermal.o
> @@ -50,7 +50,7 @@ obj-$(CONFIG_TI_SOC_THERMAL)	+= ti-soc-
> thermal/
>  obj-y				+= st/
>  obj-$(CONFIG_QCOM_TSENS)	+= qcom/
>  obj-y				+= tegra/
> -obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> +obj-$(CONFIG_HISI_THERMAL)     	+= hisi_thermal.o
>  obj-$(CONFIG_MTK_THERMAL)	+= mtk_thermal.o
>  obj-$(CONFIG_GENERIC_ADC_THERMAL)	+= thermal-generic-adc.o
>  obj-$(CONFIG_ZX2967_THERMAL)	+= zx2967_thermal.o
