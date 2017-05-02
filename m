From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: add driver for STM32 quad spi flash
 controller
Date: Mon, 1 May 2017 18:05:35 -0700
Message-ID: <20170502010535.GB18576@google.com>
References: <1492103757-22375-1-git-send-email-ludovic.Barre@st.com>
 <1492103757-22375-3-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1492103757-22375-3-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Apr 13, 2017 at 07:15:57PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> 
> The quadspi is a specialized communication interface targeting single,
> dual or quad SPI Flash memories.
> 
> It can operate in any of the following modes:
> -indirect mode: all the operations are performed using the quadspi
>  registers
> -read memory-mapped mode: the external Flash memory is mapped to the
>  microcontroller address space and is seen by the system as if it was
>  an internal memory
> 
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/mtd/spi-nor/Kconfig         |   7 +
>  drivers/mtd/spi-nor/Makefile        |   1 +
>  drivers/mtd/spi-nor/stm32-quadspi.c | 694 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 702 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 7252087..bfdfb1e 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -106,4 +106,11 @@ config SPI_INTEL_SPI_PLATFORM
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called intel-spi-platform.
>  
> +config SPI_STM32_QUADSPI
> +	tristate "STM32 Quad SPI controller"
> +	depends on ARCH_STM32
> +	help
> +	  This enables support for the STM32 Quad SPI controller.
> +	  We only connect the NOR to this controller.
> +
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 72238a7..285aab8 100644
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -0,0 +1,694 @@
...

> +static int stm32_qspi_flash_setup(struct stm32_qspi *qspi,
> +				  struct device_node *np)
> +{
> +	u32 width, flash_read, presc, cs_num, max_rate = 0;
> +	struct stm32_qspi_flash *flash;
> +	struct mtd_info *mtd;
> +	int ret;
> +
> +	of_property_read_u32(np, "reg", &cs_num);
> +	if (cs_num >= STM32_MAX_NORCHIP)
> +		return -EINVAL;
> +
> +	of_property_read_u32(np, "spi-max-frequency", &max_rate);
> +	if (!max_rate)
> +		return -EINVAL;
> +
> +	presc = DIV_ROUND_UP(qspi->clk_rate, max_rate) - 1;
> +
> +	if (of_property_read_u32(np, "spi-rx-bus-width", &width))

Can we move handling of this into spi-nor.c sometime? This is the 2nd
driver that wants this. And in this case, there's absolutely no
driver-specific handling for it. (For nxp-spifi.c, the hanling looks a
little wrong anyway -- the DT could have a larger bus width, but the
flash might only support a smaller. So the driver should gracefull
downgrade *after* we detect this, I think.)

Not a blocker for now, but just room for future work.

Brian

> +		width = 1;
> +
> +	if (width == 4)
> +		flash_read = SPI_NOR_QUAD;
> +	else if (width == 2)
> +		flash_read = SPI_NOR_DUAL;
> +	else if (width == 1)
> +		flash_read = SPI_NOR_NORMAL;
> +	else
> +		return -EINVAL;
[...]

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
