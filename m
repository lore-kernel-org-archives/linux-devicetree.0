From: Julien Thierry <julien.thierry@arm.com>
Subject: Re: [PATCH v5 2/4] clocksource: stm32: only use 32 bits timers
Date: Wed, 18 Oct 2017 09:21:50 +0100
Message-ID: <78e4bf06-7e95-d863-3b3d-c7362643da90@arm.com>
References: <1508312614-27750-1-git-send-email-benjamin.gaignard@linaro.org>
 <1508312614-27750-3-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1508312614-27750-3-git-send-email-benjamin.gaignard@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, daniel.lezcano@linaro.org, tglx@linutronix.de, ludovic.barre@st.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 18/10/17 08:43, Benjamin Gaignard wrote:
> 16 bits hardware are not enough accure to be used.
> Do no allow them to be probed by tested max counter value.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> ---
>   drivers/clocksource/timer-stm32.c | 23 +++++++++--------------
>   1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
> index abff21c..f7e4eec 100644
> --- a/drivers/clocksource/timer-stm32.c
> +++ b/drivers/clocksource/timer-stm32.c
> @@ -81,9 +81,9 @@ static irqreturn_t stm32_clock_event_handler(int irq, void *dev_id)
>   static int __init stm32_clockevent_init(struct device_node *node)
>   {
>   	struct reset_control *rstc;
> -	unsigned long max_delta;
> -	int ret, bits, prescaler = 1;
> +	unsigned long max_arr;
>   	struct timer_of *to;
> +	int ret;
>   
>   	to = kzalloc(sizeof(*to), GFP_KERNEL);
>   	if (!to)
> @@ -113,26 +113,21 @@ static int __init stm32_clockevent_init(struct device_node *node)
>   
>   	/* Detect whether the timer is 16 or 32 bits */
>   	writel_relaxed(~0U, timer_of_base(to) + TIM_ARR);
> -	max_delta = readl_relaxed(timer_of_base(to) + TIM_ARR);
> -	if (max_delta == ~0U) {
> -		prescaler = 1;
> -		bits = 32;
> -	} else {
> -		prescaler = 1024;
> -		bits = 16;
> +	max_arr = readl_relaxed(timer_of_base(to) + TIM_ARR);
> +	if (max_arr != ~0U) {
> +		pr_err("32 bits timer is needed\n");
> +		return -EINVAL;

Same as with previous patch, I think "to" should get freed.

Also, why is there no function to undo what timer_of_init did? Shouldn't 
we be able to free the irqs and unmap the timer io base here?

Cheers,

-- 
Julien Thierry
