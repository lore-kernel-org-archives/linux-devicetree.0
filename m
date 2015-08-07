From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 6/7] clocksource: Add Pistachio clocksource-only driver
Date: Fri, 07 Aug 2015 12:28:17 +0200
Message-ID: <55C48841.3050902@linaro.org>
References: <1438860138-31718-1-git-send-email-govindraj.raja@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438860138-31718-1-git-send-email-govindraj.raja@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Govindraj Raja <govindraj.raja@imgtec.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <James.Hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
List-Id: devicetree@vger.kernel.org

On 08/06/2015 01:22 PM, Govindraj Raja wrote:
> From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
>
> The Pistachio SoC provides four general purpose timers, and allow
> to implement a clocksource driver.
>
> This driver can be used as a replacement for the MIPS GIC and MIPS R4=
K
> clocksources and sched clocks, which are clocked from the CPU clock.
>
> Given the general purpose timers are clocked from an independent cloc=
k,
> this new clocksource driver will be useful to introduce CPUFreq suppo=
rt
> for Pistachio machines.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> ---
>
> changes from v4
> ----------------
> Fixes comments from Daniel as dicussed in below thread:
> http://patchwork.linux-mips.org/patch/10784/
>
>
>   drivers/clocksource/Kconfig          |   5 +
>   drivers/clocksource/Makefile         |   1 +
>   drivers/clocksource/time-pistachio.c | 216 ++++++++++++++++++++++++=
+++++++++++
>   3 files changed, 222 insertions(+)
>   create mode 100644 drivers/clocksource/time-pistachio.c
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g

[ ... ]

> index 4e57730..e642825 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -111,6 +111,11 @@ config CLKSRC_LPC32XX
>   	select CLKSRC_MMIO
>   	select CLKSRC_OF
>
> +config CLKSRC_PISTACHIO
> +	bool
> +	default y if MACH_PISTACHIO

You don't need to add this condition.

> +	select CLKSRC_OF

[ ... ]

> +
> +struct pistachio_clocksource pcs_gpt;

static.

> +#define to_pistachio_clocksource(cs)	\
> +	container_of(cs, struct pistachio_clocksource, cs)
> +
> +static inline u32 gpt_readl(void __iomem *base, u32 offset, u32 gpt_=
id)
> +{
> +	return readl(base + 0x20 * gpt_id + offset);

Are you sure of the address computation ? I guess it is correct but jus=
t=20
wanted you to double check.

> +}
> +
> +static inline void gpt_writel(void __iomem *base, u32 value, u32 off=
set,
> +		u32 gpt_id)
> +{
> +	writel(value, base + 0x20 * gpt_id + offset);
> +}
> +
> +static cycle_t pistachio_clocksource_read_cycles(struct clocksource =
*cs)
> +{
> +	struct pistachio_clocksource *pcs =3D to_pistachio_clocksource(cs);
> +	u32 counter, overflw;
> +	unsigned long flags;
> +
> +	/* The counter value is only refreshed after the overflow value is =
read.
> +	 * And they must be read in strict order, hence raw spin lock added=
=2E
> +	 */

nit: extra carriage return and comment format:

	/*
	 * blabla
	 */

> +	raw_spin_lock_irqsave(&pcs->lock, flags);
> +	overflw =3D gpt_readl(pcs->base, TIMER_CURRENT_OVERFLOW_VALUE, 0);
> +	counter =3D gpt_readl(pcs->base, TIMER_CURRENT_VALUE, 0);
> +	raw_spin_unlock_irqrestore(&pcs->lock, flags);
> +
> +	return ~(cycle_t)counter;
> +}
> +
> +static u64 notrace pistachio_read_sched_clock(void)
> +{
> +	return pistachio_clocksource_read_cycles(&pcs_gpt.cs);

Can you double check the u32 cast to cycle_t returning a u64 from this=20
function ?

> +}
> +
> +static void pistachio_clksrc_set_mode(struct clocksource *cs, int ti=
meridx,
> +			int enable)
> +{
> +	struct pistachio_clocksource *pcs =3D to_pistachio_clocksource(cs);
> +	u32 val;
> +
> +	val =3D gpt_readl(pcs->base, TIMER_CFG, timeridx);
> +	if (enable)
> +		val |=3D TIMER_ME_LOCAL;
> +	else
> +		val &=3D ~TIMER_ME_LOCAL;
> +
> +	gpt_writel(pcs->base, val, TIMER_CFG, timeridx);
> +}
> +
> +static void pistachio_clksrc_enable(struct clocksource *cs, int time=
ridx)
> +{
> +	struct pistachio_clocksource *pcs =3D to_pistachio_clocksource(cs);
> +
> +	/* Disable GPT local before loading reload value */
> +	pistachio_clksrc_set_mode(cs, timeridx, false);
> +	gpt_writel(pcs->base, RELOAD_VALUE, TIMER_RELOAD_VALUE, timeridx);
> +	pistachio_clksrc_set_mode(cs, timeridx, true);
> +}
> +
> +static void pistachio_clksrc_disable(struct clocksource *cs, int tim=
eridx)
> +{
> +	/* Disable GPT local */
> +	pistachio_clksrc_set_mode(cs, timeridx, false);
> +}
> +
> +static int pistachio_clocksource_enable(struct clocksource *cs)
> +{
> +	pistachio_clksrc_enable(cs, 0);
> +	return 0;
> +}
> +
> +static void pistachio_clocksource_disable(struct clocksource *cs)
> +{
> +	pistachio_clksrc_disable(cs, 0);
> +}
> +
> +/* Desirable clock source for pistachio platform */
> +struct pistachio_clocksource pcs_gpt =3D {

static.

Thanks !

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
