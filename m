From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Mon, 24 Jun 2013 15:08:28 -0700
Message-ID: <51C8C35C.70307@codeaurora.org>
References: <1372089195-29219-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1372089195-29219-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Cc: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stuart Menefy <stuart.menefy@st.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robherring2@gmail.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

On 06/24/13 08:53, Srinivas KANDAGATLA wrote:
> +#include <linux/clkdev.h>

Why do you need this include?

> +#include <asm/mach/irq.h>

And this one?

> +static u64 gt_counter_read(void)
> +{
> +	u64 counter;
> +	u32 lower;
> +	u32 upper, old_upper;
> +
> +	upper = readl_relaxed(gt_base + GT_COUNTER1);
> +	do {
> +		old_upper = upper;
> +		lower = readl_relaxed(gt_base + GT_COUNTER0);
> +		upper = readl_relaxed(gt_base + GT_COUNTER1);
[snip]
> +static void gt_compare_set(unsigned long delta, int periodic)
> +{
> +	u64 counter = gt_counter_read();
> +	unsigned long ctrl = readl(gt_base + GT_CONTROL);
> +
> +	counter += delta;
> +	ctrl &=  ~(GT_CONTROL_COMP_ENABLE | GT_CONTROL_IRQ_ENABLE);
> +
> +	writel(ctrl, gt_base + GT_CONTROL);
> +	writel(lower_32_bits(counter), gt_base + GT_COMP0);
> +	writel(upper_32_bits(counter), gt_base + GT_COMP1);
> +
> +	if (periodic) {
> +		writel(delta, gt_base + GT_AUTO_INC);
> +		ctrl |= GT_CONTROL_AUTO_INC;
> +	}
> +
> +	ctrl |= GT_CONTROL_COMP_ENABLE | GT_CONTROL_IRQ_ENABLE;
> +	writel(ctrl, gt_base + GT_CONTROL);
> +}

Why is there a mix of the relaxed and non-relaxed io accessors?

> +#ifdef CONFIG_CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> +static u32 gt_sched_clock_read(void)

notrace

> +{
> +	if (!gt_base)
> +		return 0;

Seems impossible? Remove this check?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

