From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 1/3] ARM: at91: flush the L2 cache before entering cpu idle
Date: Fri, 6 Jan 2017 10:05:17 +0100
Message-ID: <20170106090517.txcoukisnx43cfqq@piout.net>
References: <20170106065947.30631-1-wenyou.yang@atmel.com>
 <20170106065947.30631-2-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170106065947.30631-2-wenyou.yang@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Wenyou Yang <wenyou.yang@microchip.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On 06/01/2017 at 14:59:45 +0800, Wenyou Yang wrote :
> For the SoCs such as SAMA5D2 and SAMA5D4 which have L2 cache,
> flush the L2 cache first before entering the cpu idle.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> ---
> 
>  arch/arm/mach-at91/pm.c       | 19 +++++++++++++++++++
>  drivers/memory/atmel-sdramc.c |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index b4332b727e9c..1a60dede1a01 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -289,6 +289,24 @@ static void at91_ddr_standby(void)
>  		at91_ramc_write(1, AT91_DDRSDRC_LPR, saved_lpr1);
>  }
>  
> +static void at91_ddr_cache_standby(void)
> +{
> +	u32 saved_lpr;
> +
> +	flush_cache_all();
> +	outer_disable();
> +
> +	saved_lpr = at91_ramc_read(0, AT91_DDRSDRC_LPR);
> +	at91_ramc_write(0, AT91_DDRSDRC_LPR, (saved_lpr &
> +			(~AT91_DDRSDRC_LPCB)) | AT91_DDRSDRC_LPCB_SELF_REFRESH);
> +
> +	cpu_do_idle();
> +
> +	at91_ramc_write(0, AT91_DDRSDRC_LPR, saved_lpr);
> +
> +	outer_resume();
> +}
> +

Seems good to me. Did you measure the added latency on sama5d3 if you
add the cache operations in at91_ddr_standby instead of having a new
function?


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
