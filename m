From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH anybus v1 3/4] bus: support HMS Anybus-S bus.
Date: Wed, 24 Oct 2018 08:58:36 -0700
Message-ID: <d58debbd-4c14-6995-cc63-bbc2b35fa7cf@infradead.org>
References: <20181024142456.10084-1-svendev@arcx.com>
 <20181024142456.10084-4-svendev@arcx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024142456.10084-4-svendev@arcx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <svendev@arcx.com>, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, andriy.shevchenko@linux.intel.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/24/18 7:24 AM, Sven Van Asbroeck wrote:
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index 1851112ccc29..68869648b9ab 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -45,6 +45,17 @@ config IMX_WEIM
>  	  The WEIM(Wireless External Interface Module) works like a bus.
>  	  You can attach many different devices on it, such as NOR, onenand.
>  
> +config HMS_ANYBUSS_HOST
> +	tristate "HMS Anybus-S Host/Bus Driver"
> +	select REGMAP
> +	depends on OF
> +	default n

Please drop the "default n".  That is already the default in Kconfig files.

> +	help
> +	  Driver for the HMS Industrial Networks Anybus-S bus.
> +	  You can attach Anybus-S compatible cards to it, which
> +	  typically provide fieldbus and industrial ethernet
> +	  functionality.
> +
>  config MIPS_CDMM
>  	bool "MIPS Common Device Memory Map (CDMM) Driver"
>  	depends on CPU_MIPSR2


Also please check the multi-line comments for kernel comment style.

thanks,
-- 
~Randy
