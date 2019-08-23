From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v9 1/8] ARM: aurora-l2: add prefix to MAX_RANGE_SIZE
Date: Fri, 23 Aug 2019 11:46:21 +0100
Message-ID: <20190823104621.GY13294@shell.armlinux.org.uk>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
 <20190712034904.5747-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190712034904.5747-2-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, patches@armlinux.org.uk, mchehab@kernel.org, james.morse@arm.com, jlu@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 12, 2019 at 03:48:57PM +1200, Chris Packham wrote:
> From: Jan Luebbe <jlu@pengutronix.de>
> 
> The macro name is too generic, so add a AURORA_ prefix.
> 
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  arch/arm/include/asm/hardware/cache-aurora-l2.h | 2 +-

I can't apply this series - this file does not exist in my tree, and
from what git tells me, it never has existed.  Maybe it's in someone
elses tree?

>  arch/arm/mm/cache-l2x0.c                        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/include/asm/hardware/cache-aurora-l2.h b/arch/arm/include/asm/hardware/cache-aurora-l2.h
> index c86124769831..dc5c479ec4c3 100644
> --- a/arch/arm/include/asm/hardware/cache-aurora-l2.h
> +++ b/arch/arm/include/asm/hardware/cache-aurora-l2.h
> @@ -41,7 +41,7 @@
>  #define AURORA_ACR_FORCE_WRITE_THRO_POLICY	\
>  	(2 << AURORA_ACR_FORCE_WRITE_POLICY_OFFSET)
>  
> -#define MAX_RANGE_SIZE		1024
> +#define AURORA_MAX_RANGE_SIZE	1024
>  
>  #define AURORA_WAY_SIZE_SHIFT	2
>  
> diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> index 428d08718107..83b733a1f1e6 100644
> --- a/arch/arm/mm/cache-l2x0.c
> +++ b/arch/arm/mm/cache-l2x0.c
> @@ -1352,8 +1352,8 @@ static unsigned long aurora_range_end(unsigned long start, unsigned long end)
>  	 * since cache range operations stall the CPU pipeline
>  	 * until completion.
>  	 */
> -	if (end > start + MAX_RANGE_SIZE)
> -		end = start + MAX_RANGE_SIZE;
> +	if (end > start + AURORA_MAX_RANGE_SIZE)
> +		end = start + AURORA_MAX_RANGE_SIZE;
>  
>  	/*
>  	 * Cache range operations can't straddle a page boundary.
> -- 
> 2.22.0
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
