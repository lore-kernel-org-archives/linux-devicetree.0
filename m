Return-Path: <SRS0=VLy6=HM=intel.com=adrian.hunter@kernel.org>
Subject: Re: [PATCH 2/2] mmc: core: add tunable delay waiting for power to be
 stable
References: <1524297824-94236-1-git-send-email-shawn.lin@rock-chips.com>
 <1524297824-94236-2-git-send-email-shawn.lin@rock-chips.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Message-ID: <dcaf9322-0892-150b-aa98-562624b35ea5@intel.com>
Date: Mon, 23 Apr 2018 09:24:46 +0300
MIME-Version: 1.0
In-Reply-To: <1524297824-94236-2-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 21/04/18 11:03, Shawn Lin wrote:
> The hard-coded 10ms delay in mmc_power_up came from
> commit 79bccc5aefb4 ("mmc: increase power up delay"), which said "The TI
> controller on Toshiba Tecra M5 needs more time to power up or the cards
> will init incorrectly or not at all." But it's too engineering solution
> for a special board but force all platforms to wait for that long time,
> especially painful for mmc_power_up for eMMC when booting.
> 
> However, it's added since 2009, and we can't tell if other platforms
> benefit from it. But in practise, the modern hardware are most likely to
> have a stable power supply with 1ms after setting it for no matter PMIC
> or discrete power. And more importnatly, most regulators implement the
> callback of ->set_voltage_time_sel() for regulator core to wait for
> specific period of time for the power supply to be stable, which means
> once regulator_set_voltage_* return, the power should reach the the
> minimum voltage that works for initialization. Of course, if there
> are some other ways for host to power the card, we should allow them
> to argue a suitable delay as well.
> 
> With this patch, we could assign the delay from firmware, or we could
> assigne it via ->set_ios() callback from host drivers.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>  drivers/mmc/core/core.c  | 6 ++++--
>  drivers/mmc/core/host.c  | 4 ++++
>  include/linux/mmc/host.h | 1 +
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 121ce50..04d3cf4 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1027,6 +1027,8 @@ void mmc_set_initial_state(struct mmc_host *host)
>  	host->ios.bus_width = MMC_BUS_WIDTH_1;
>  	host->ios.timing = MMC_TIMING_LEGACY;
>  	host->ios.drv_type = 0;
> +	if (!host->ios.power_delay_ms)
> +		host->ios.power_delay_ms = 10;

Some drivers already have delays, so a zero value should be supported IMHO.

>  	host->ios.enhanced_strobe = false;
>  
>  	/*
> @@ -1658,7 +1660,7 @@ void mmc_power_up(struct mmc_host *host, u32 ocr)
>  	 * This delay should be sufficient to allow the power supply
>  	 * to reach the minimum voltage.
>  	 */
> -	mmc_delay(10);
> +	mmc_delay(host->ios.power_delay_ms);
>  
>  	mmc_pwrseq_post_power_on(host);
>  
> @@ -1671,7 +1673,7 @@ void mmc_power_up(struct mmc_host *host, u32 ocr)
>  	 * This delay must be at least 74 clock sizes, or 1 ms, or the
>  	 * time required to reach a stable voltage.
>  	 */
> -	mmc_delay(10);
> +	mmc_delay(host->ios.power_delay_ms);
>  }
>  
>  void mmc_power_off(struct mmc_host *host)
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 64b03d6..9c34063 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -338,6 +338,10 @@ int mmc_of_parse(struct mmc_host *host)
>  		host->dsr_req = 0;
>  	}
>  
> +	if (device_property_read_u32(dev, "power-delay-ms",
> +				     &host->ios.power_delay_ms))
> +		host->ios.power_delay_ms = 0;
> +
>  	return mmc_pwrseq_alloc(host);
>  }
>  
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 7c6eaf6..efa9bab 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -22,6 +22,7 @@
>  struct mmc_ios {
>  	unsigned int	clock;			/* clock rate */
>  	unsigned short	vdd;
> +	unsigned int	power_delay_ms;		/* waiting for stable power */
>  
>  /* vdd stores the bit number of the selected voltage range from below. */
>  
> 
