From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v5 2/2] ARM: sama5_defconfig: add support for the Axentia
 TSE-850 board
Date: Tue, 10 Jan 2017 10:10:34 +0100
Message-ID: <10e75ffd-d68b-97f2-2618-c5e92713f5b3@atmel.com>
References: <1484035732-31635-1-git-send-email-peda@axentia.se>
 <1484035732-31635-3-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484035732-31635-3-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 10/01/2017 à 09:08, Peter Rosin a écrit :
> Signed-off-by: Peter Rosin <peda@axentia.se>

I know that most of the entries in this configuration file are direct
additions to the kernel but what about moving some of your additions to
modules?

Regards,

> ---
>  arch/arm/configs/sama5_defconfig | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
> index aca8625b6fc9..bf5b3a73e38c 100644
> --- a/arch/arm/configs/sama5_defconfig
> +++ b/arch/arm/configs/sama5_defconfig
> @@ -131,7 +131,7 @@ CONFIG_GPIO_SYSFS=y
>  CONFIG_POWER_SUPPLY=y
>  CONFIG_BATTERY_ACT8945A=y
>  CONFIG_POWER_RESET=y
> -# CONFIG_HWMON is not set
> +CONFIG_SENSORS_JC42=y
>  CONFIG_WATCHDOG=y
>  CONFIG_AT91SAM9X_WATCHDOG=y
>  CONFIG_SAMA5D4_WATCHDOG=y
> @@ -142,6 +142,7 @@ CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_ACT8865=y
>  CONFIG_REGULATOR_ACT8945A=y
> +CONFIG_REGULATOR_PWM=y
>  CONFIG_MEDIA_SUPPORT=y
>  CONFIG_MEDIA_CAMERA_SUPPORT=y
>  CONFIG_V4L_PLATFORM_DRIVERS=y
> @@ -164,6 +165,7 @@ CONFIG_SND_ATMEL_SOC=y
>  CONFIG_SND_ATMEL_SOC_WM8904=y
>  # CONFIG_HID_GENERIC is not set
>  CONFIG_SND_ATMEL_SOC_PDMIC=y
> +CONFIG_SND_ATMEL_SOC_TSE850_PCM5142=y
>  CONFIG_USB=y
>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>  CONFIG_USB_EHCI_HCD=y
> @@ -199,6 +201,9 @@ CONFIG_AT_XDMAC=y
>  CONFIG_IIO=y
>  CONFIG_AT91_ADC=y
>  CONFIG_AT91_SAMA5D2_ADC=y
> +CONFIG_ENVELOPE_DETECTOR=y
> +CONFIG_DPOT_DAC=y
> +CONFIG_MCP4531=y
>  CONFIG_PWM=y
>  CONFIG_PWM_ATMEL=y
>  CONFIG_PWM_ATMEL_HLCDC_PWM=y
> 


-- 
Nicolas Ferre
