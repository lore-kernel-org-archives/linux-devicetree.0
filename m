From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v4 2/2] soc: Add driver for Freescale Vybrid Platform
Date: Wed, 27 May 2015 09:31:50 +0200
Message-ID: <1432711910.27695.223.camel@x220>
References: <cover.1432637313.git.maitysanchayan@gmail.com>
	 <7df753efff77a96da285f0571f1316512787e83c.1432637313.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7df753efff77a96da285f0571f1316512787e83c.1432637313.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sanchayan Maity <maitysanchayan@gmail.com>
Cc: arnd@arndb.de, shawn.guo@linaro.org, kernel@pengutronix.de, stefan@agner.ch, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-05-26 at 17:06 +0530, Sanchayan Maity wrote:
> --- /dev/null
> +++ b/drivers/soc/fsl/Kconfig

> +config SOC_VF610
> +	   bool "SoC bus device for the Freescale Vybrid platform"
> +	   select SOC_BUS
> +	   help
> +	     Include support for the SoC bus on the Freescale Vybrid platform
> +	     providing some sysfs information about the module variant.
> \ No newline at end of file

(That review comment is courtesy of git.)

> --- /dev/null
> +++ b/drivers/soc/fsl/Makefile

> +obj-$(CONFIG_SOC_VF610)		+= soc-vf610.o

> --- /dev/null
> +++ b/drivers/soc/fsl/soc-vf610.c

> +MODULE_DEVICE_TABLE(of, vf610_soc_bus_match);

> +module_platform_driver(vf610_soc_driver);

(The series starting at https://lkml.org/lkml/2015/5/10/131 would allow
to use builtin_platform_driver() for built-in only code.)

> +MODULE_DESCRIPTION("Freescale VF610 SoC bus driver");
> +MODULE_LICENSE("GPL v2");

I think soc-vf610.o can only be built-in. But its code contains a few
module specific macros. Was it perhaps intended for SOC_VF610 to be
tristate?


Paul Bolle
