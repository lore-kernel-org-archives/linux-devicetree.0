From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH 4/7] MIPS: Octeon: Add Free Pointer Unit (FPA) support.
Date: Thu, 2 Nov 2017 13:14:25 +0000
Message-ID: <20171102131425.GO15235@jhogan-linux>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-5-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171102003606.19913-5-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 01, 2017 at 05:36:03PM -0700, David Daney wrote:
> diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
> index 5c0b56203bae..211ef5b57214 100644
> --- a/arch/mips/cavium-octeon/Kconfig
> +++ b/arch/mips/cavium-octeon/Kconfig
> @@ -86,4 +86,14 @@ config OCTEON_ILM
>  	  To compile this driver as a module, choose M here.  The module
>  	  will be called octeon-ilm
>  
> +config OCTEON_FPA3
> +	tristate "Octeon III fpa driver"
> +	default "n"

n is the default default so I think this line is redundant.

> +	depends on CPU_CAVIUM_OCTEON
> +	help
> +	  This option enables a Octeon III driver for the Free Pool Unit (FPA).
> +	  The FPA is a hardware unit that manages pools of pointers to free
> +	  L2/DRAM memory. This driver provides an interface to reserve,
> +	  initialize, and fill fpa pools.
> +
>  endif # CAVIUM_OCTEON_SOC

Cheers
James
