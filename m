From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Date: Tue, 12 Mar 2019 10:28:42 +0100
Message-ID: <20190312092842.GC28589@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 12, 2019 at 02:51:01PM +0530, Yash Shah wrote:
> Add driver for the SiFive L2 cache controller
> on the HiFive Unleashed board
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/Kconfig            |   1 +
>  drivers/edac/Kconfig          |   7 +
>  drivers/edac/Makefile         |   1 +
>  drivers/edac/sifive_edac-l2.c | 292 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 301 insertions(+)
>  create mode 100644 drivers/edac/sifive_edac-l2.c
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 515fc3c..fede4b6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -49,6 +49,7 @@ config RISCV
>  	select RISCV_TIMER
>  	select GENERIC_IRQ_MULTI_HANDLER
>  	select ARCH_HAS_PTE_SPECIAL
> +	select EDAC_SUPPORT
>  
>  config MMU
>  	def_bool y
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index e286b5b..63ccdf1 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -440,6 +440,13 @@ config EDAC_ALTERA_SDMMC
>  	  Support for error detection and correction on the
>  	  Altera SDMMC FIFO Memory for Altera SoCs.
>  
> +config EDAC_SIFIVE_L2
> +	tristate "Sifive L2 Cache"
> +	depends on RISCV
> +	help
> +	  Support for error detection and correction on the SiFive L2
> +	  cache controller.

Please no EDAC drivers for a single functional unit with RAS
capabilities. Rather, a sifive_edac or riscv_edac driver which covers
the whole platform or even architecture and contains support for all the
RAS functionality there. See altera_edac, for example.

HTH.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
