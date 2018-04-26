From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 2/3] edac: altera: Add support for Stratix10 SDRAM EDAC
Date: Wed, 25 Apr 2018 21:14:27 -0500
Message-ID: <2d310ff0-fa0e-e432-ae11-ba34080b4f6e@kernel.org>
References: <1524594959-5259-1-git-send-email-thor.thayer@linux.intel.com>
 <1524594959-5259-3-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524594959-5259-3-git-send-email-thor.thayer@linux.intel.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: thor.thayer@linux.intel.com, bp@alien8.de, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/24/2018 01:35 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add support for SDRAM ECC on the Stratix10 platform to
> the EDAC device driver. Although Stratix10 is very similar
> to the Arria10, hypervisor support for Stratix10 SDRAM ECC
> requires the use of SMC calls to a higher priority
> exception level to handle some register reads/writes.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  drivers/edac/Kconfig       |   2 +-
>  drivers/edac/altera_edac.c | 459 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/edac/altera_edac.h | 114 +++++++++++

Does it make sense to have the support for this in separate files?

>  3 files changed, 574 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 3c4017007647..3c66b02b2473 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -379,7 +379,7 @@ config EDAC_THUNDERX
>  
>  config EDAC_ALTERA
>  	bool "Altera SOCFPGA ECC"
> -	depends on EDAC=y && ARCH_SOCFPGA
> +	depends on EDAC=y && (ARCH_SOCFPGA || ARM64)

Should the ARM64 dependency just be ARCH_STRATIX10?

>  	help
>  	  Support for error detection and correction on the
>  	  Altera SOCs. This must be selected for SDRAM ECC.
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 11d6419788c2..7ed885379719 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1,4 +1,5 @@
>  /*
> + *  Copyright (C) 2017-2018, Intel Corporation

If you're updating the license header, would it make sense to convert to
SPDX?

Dinh
