From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 3/4] RISC-V: Remove per cpu clocksource
Date: Fri, 07 Dec 2018 09:00:07 -0800 (PST)
Message-ID: <mhng-a0437cab-9a27-45a5-aabe-0dee2c1d96db@palmer-si-x1c4>
References: <1543870651-16669-4-git-send-email-atish.patra@wdc.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543870651-16669-4-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, atish.patra@wdc.com, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, dmitriy@oss-tech.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, tglx@linutronix.de, anup@brainfault.org, Damien.LeMoal@wdc.com
List-Id: devicetree@vger.kernel.org

On Mon, 03 Dec 2018 12:57:30 PST (-0800), atish.patra@wdc.com wrote:
> There is only one clocksource in RISC-V. The boot cpu initializes
> that clocksource. No need to keep a percpu data structure.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/clocksource/riscv_timer.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
> index 96af7058..39de6e49 100644
> --- a/drivers/clocksource/riscv_timer.c
> +++ b/drivers/clocksource/riscv_timer.c
> @@ -49,7 +49,7 @@ static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
>  	return get_cycles64();
>  }
>
> -static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
> +static struct clocksource riscv_clocksource = {
>  	.name		= "riscv_clocksource",
>  	.rating		= 300,
>  	.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
> @@ -106,7 +106,6 @@ static long __init riscv_timebase_frequency(struct device_node *node)
>  static int __init riscv_timer_init_dt(struct device_node *n)
>  {
>  	int cpuid, hartid, error;
> -	struct clocksource *cs;
>
>  	hartid = riscv_of_processor_hartid(n);
>  	cpuid = riscv_hartid_to_cpuid(hartid);
> @@ -116,8 +115,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>
>  	/* This should be called only for boot cpu */
>  	riscv_timebase = riscv_timebase_frequency(n);
> -	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
> -	clocksource_register_hz(cs, riscv_timebase);
> +	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
