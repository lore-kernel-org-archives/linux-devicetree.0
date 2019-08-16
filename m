From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/5] RISC-V: Remove per cpu clocksource
Date: Fri, 16 Aug 2019 17:09:07 +0200
Message-ID: <6ba37c45-2d9b-c01e-5f17-3ab919da4de8@linaro.org>
References: <20190731012418.24565-1-atish.patra@wdc.com>
 <20190731012418.24565-2-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731012418.24565-2-atish.patra@wdc.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexios Zavras <alexios.zavras@intel.com>, Allison Randal <allison@lohutok.net>, Anup Patel <anup.patel@wdc.com>, devicetree@vger.kernel.org, Enrico Weigelt <info@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 31/07/2019 03:24, Atish Patra wrote:
> There is only one clocksource in RISC-V. The boot cpu initializes
> that clocksource. No need to keep a percpu data structure.

That is not what is stated in the initial patch [1].

Can you clarify that ?

Thanks

  -- Daniel

[1] https://lkml.org/lkml/2018/8/4/51


> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/clocksource/timer-riscv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 5e6038fbf115..09e031176bc6 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -55,7 +55,7 @@ static u64 riscv_sched_clock(void)
>  	return get_cycles64();
>  }
>  
> -static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
> +static struct clocksource riscv_clocksource = {
>  	.name		= "riscv_clocksource",
>  	.rating		= 300,
>  	.mask		= CLOCKSOURCE_MASK(64),
> @@ -92,7 +92,6 @@ void riscv_timer_interrupt(void)
>  static int __init riscv_timer_init_dt(struct device_node *n)
>  {
>  	int cpuid, hartid, error;
> -	struct clocksource *cs;
>  
>  	hartid = riscv_of_processor_hartid(n);
>  	if (hartid < 0) {
> @@ -112,8 +111,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  
>  	pr_info("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
>  	       __func__, cpuid, hartid);
> -	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
> -	error = clocksource_register_hz(cs, riscv_timebase);
> +	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>  	if (error) {
>  		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>  		       error, cpuid);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
