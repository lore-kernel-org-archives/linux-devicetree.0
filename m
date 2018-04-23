Return-Path: <SRS0=VLy6=HM=intel.com=adrian.hunter@kernel.org>
Subject: Re: [PATCH v2 2/2] mmc: core: add tunable delay waiting for power to
 be stable
References: <1524471030-3527-1-git-send-email-shawn.lin@rock-chips.com>
 <1524471030-3527-2-git-send-email-shawn.lin@rock-chips.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Message-ID: <607bd244-e911-17d5-8690-90b721a95300@intel.com>
Date: Mon, 23 Apr 2018 11:36:29 +0300
MIME-Version: 1.0
In-Reply-To: <1524471030-3527-2-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 23/04/18 11:10, Shawn Lin wrote:
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
> 
> ---
> 
> Changes in v2:
> - allow to assign zero delay from firmware suggested by Adrain
> 
>  drivers/mmc/core/core.c  | 4 ++--
>  drivers/mmc/core/host.c  | 4 ++++
>  include/linux/mmc/host.h | 1 +
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 121ce50..a52e9c2 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1658,7 +1658,7 @@ void mmc_power_up(struct mmc_host *host, u32 ocr)
>  	 * This delay should be sufficient to allow the power supply
>  	 * to reach the minimum voltage.
>  	 */
> -	mmc_delay(10);
> +	mmc_delay(host->ios.power_delay_ms);
>  
>  	mmc_pwrseq_post_power_on(host);
>  
> @@ -1671,7 +1671,7 @@ void mmc_power_up(struct mmc_host *host, u32 ocr)
>  	 * This delay must be at least 74 clock sizes, or 1 ms, or the
>  	 * time required to reach a stable voltage.
>  	 */
> -	mmc_delay(10);
> +	mmc_delay(host->ios.power_delay_ms);

AFAICT mmc_delay() (calls usleep_range()) does not handle a zero value
correctly so maybe make mmc_delay() check for zero and return immediately in
that case.

>  }
>  
>  void mmc_power_off(struct mmc_host *host)
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 64b03d6..00ddc15 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -338,6 +338,9 @@ int mmc_of_parse(struct mmc_host *host)
>  		host->dsr_req = 0;
>  	}
>  
> +	device_property_read_u32(dev, "power-delay-ms",
> +				 &host->ios.power_delay_ms);
> +
>  	return mmc_pwrseq_alloc(host);
>  }
>  
> @@ -403,6 +406,7 @@ struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
>  	host->max_blk_count = PAGE_SIZE / 512;
>  
>  	host->fixed_drv_type = -EINVAL;
> +	host->ios.power_delay_ms = 10;
>  
>  	return host;
>  }
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
