From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Sun, 30 Oct 2016 15:41:33 -0500
Message-ID: <20161030204133.xa7j4uxdu52iaxe7@rob-hp-laptop>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
 <1477224748-25223-4-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477224748-25223-4-git-send-email-noamca@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 23, 2016 at 03:12:28PM +0300, Noam Camus wrote:
> From: Noam Camus <noamca@mellanox.com>
> 
> Till now we used clockevent from generic ARC driver.
> This was enough as long as we worked with simple multicore SoC.
> When we are working with multithread SoC each HW thread can be
> scheduled to receive timer interrupt using timer mask register.
> This patch will provide a way to control clock events per HW thread.
> 
> The design idea is that for each core there is dedicated regirtser
> (TSI) serving all 16 HW threads.
> The register is a bitmask with one bit for each HW thread.
> When HW thread wants that next expiration of timer interrupt will
> hit it then the proper bit should be set in this dedicated register.
> When timer expires all HW threads within this core which their bit
> is set at the TSI register will be interrupted.
> 
> Driver can be used from device tree by:
> compatible = "ezchip,nps400-timer0" <-- for clocksource
> compatible = "ezchip,nps400-timer1" <-- for clockevent
> 
> Note that name convention for timer0/timer1 was taken from legacy
> ARC design. This design is our base before adding HW threads.
> 
> Signed-off-by: Noam Camus <noamca@mellanox.com>
> 
> Change-Id: Ib351e6fc7a6b691293040ae655f202f3cc2c1298
> ---
>  .../bindings/timer/ezchip,nps400-timer.txt         |   15 --
>  .../bindings/timer/ezchip,nps400-timer0.txt        |   17 ++
>  .../bindings/timer/ezchip,nps400-timer1.txt        |   15 ++

For the binding,

Acked-by: Rob Herring <robh@kernel.org>

However, one issue below...

>  drivers/clocksource/timer-nps.c                    |  220 +++++++++++++++++++-
>  include/linux/cpuhotplug.h                         |    1 +
>  5 files changed, 248 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt


> diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c
> index 6156e54..0757328 100644
> --- a/drivers/clocksource/timer-nps.c
> +++ b/drivers/clocksource/timer-nps.c
> @@ -46,7 +46,7 @@
>  /* This array is per cluster of CPUs (Each NPS400 cluster got 256 CPUs) */
>  static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] __read_mostly;
>  
> -static unsigned long nps_timer_rate;
> +static unsigned long nps_timer1_freq;
>  static int nps_get_timer_clk(struct device_node *node,
>  			     unsigned long *timer_freq,
>  			     struct clk *clk)
> @@ -87,10 +87,10 @@ static int __init nps_setup_clocksource(struct device_node *node)
>  			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
>  				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
>  
> -	nps_get_timer_clk(node, &nps_timer_rate, clk);
> +	nps_get_timer_clk(node, &nps_timer1_freq, clk);
>  
> -	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "EZnps-tick",
> -				    nps_timer_rate, 301, 32, nps_clksrc_read);
> +	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "nps-tick",
> +				    nps_timer1_freq, 301, 32, nps_clksrc_read);
>  	if (ret) {
>  		pr_err("Couldn't register clock source.\n");
>  		clk_disable_unprepare(clk);
> @@ -99,5 +99,215 @@ static int __init nps_setup_clocksource(struct device_node *node)
>  	return ret;
>  }
>  
> -CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer1",
>  		       nps_setup_clocksource);

You should keep the old string here for backwards compatiblity.

Rob
