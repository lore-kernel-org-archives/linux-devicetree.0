From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 2/5] ARM: davinci: da8xx: Add CFGCHIP syscon platform
 declaration.
Date: Tue, 10 May 2016 14:26:05 +0300
Message-ID: <7e0373cf-2ae9-e205-2226-0ded6894b709@cogentembedded.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <1462837612-7803-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462837612-7803-3-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, nsekhar@ti.com, khilman@kernel.org
Cc: petr@barix.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/10/2016 2:46 AM, David Lechner wrote:

> The CFGCHIP registers are used by a number of devices, so using a syscon
> device to share them. The first consumer of this will by the phy-da8xx-usb
> driver.
>
> Signed-off-by: David Lechner <david@lechnology.com>
[...]
> diff --git a/arch/arm/mach-davinci/devices-da8xx.c b/arch/arm/mach-davinci/devices-da8xx.c
> index 725e693..69d11a1 100644
> --- a/arch/arm/mach-davinci/devices-da8xx.c
> +++ b/arch/arm/mach-davinci/devices-da8xx.c
> @@ -11,6 +11,7 @@
>   * (at your option) any later version.
>   */
>  #include <linux/init.h>
> +#include <linux/platform_data/syscon.h>
>  #include <linux/platform_device.h>
>  #include <linux/dma-contiguous.h>
>  #include <linux/serial_8250.h>
> @@ -1109,3 +1110,30 @@ int __init da850_register_sata(unsigned long refclkpn)
>  	return platform_device_register(&da850_sata_device);
>  }
>  #endif
> +
> +static struct syscon_platform_data da8xx_cfgchip_platform_data = {
> +	.label	= "cfgchip",
> +};
> +
> +static struct resource da8xx_cfgchip_resources[] = {
> +	{
> +		.start	= DA8XX_SYSCFG0_BASE + DA8XX_CFGCHIP0_REG,
> +		.end	= DA8XX_SYSCFG0_BASE + DA8XX_CFGCHIP4_REG + 3,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +};
> +
> +static struct platform_device da8xx_cfgchip_device = {
> +	.name	= "syscon",
> +	.id	= 0,

    Again, -1.

[...]

MBR, Sergei
