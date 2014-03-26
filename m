From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/4] clocksource: mmp: add mmp timer driver
Date: Wed, 26 Mar 2014 10:41:37 +0000
Message-ID: <20140326104137.GQ10341@e106331-lin.cambridge.arm.com>
References: <1395809563-31872-1-git-send-email-chao.xie@marvell.com>
 <1395809563-31872-2-git-send-email-chao.xie@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1395809563-31872-2-git-send-email-chao.xie@marvell.com>
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
To: Chao Xie <chao.xie@marvell.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "xiechao.mail@gmail.com" <xiechao.mail@gmail.com>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 26, 2014 at 04:52:40AM +0000, Chao Xie wrote:
> From: Chao Xie <chao.xie@marvell.com>
>
> MMP timer is attached to APB bus, It has the following
> limitation.
> 1. When get count of timer counter, it need some delay
>    to get a stable count.
> 2. When set match register, it need disable the counter
>    first, and enable it after set the match register.
>    The disabling need wait for 2 clock cycle to take
>    effect.
>
> To improve above #1, shadow register for count is added.
> To improve above #2, CRSR register is added for quick updating.
>
> So there are three types of timer.
> timer1: old timer.
> timer2: old timer with shadow register.
> timer3: old timer with shadow and CRSR register.
>
> This timer driver will be used for many SOCes.
> 1. pxa168, pxa910, pxa988 pxa1088 have only timer1.
> 2. pxa1L88, pxa1U88 have timer1 and timer3.
> 3. pxa1928 has timer 2.
>
> The driver supports DT and non-DT initialization.
> The driver supports UP/SMP SOCes and 64 bit core.
>
> Signed-off-by: Chao Xie <chao.xie@marvell.com>
> ---
>  .../devicetree/bindings/arm/mrvl/timer.txt         |  73 +-
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/timer-mmp.c                    | 866 +++++++++++++++++++++
>  3 files changed, 934 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/clocksource/timer-mmp.c
>
> diff --git a/Documentation/devicetree/bindings/arm/mrvl/timer.txt b/Documentation/devicetree/bindings/arm/mrvl/timer.txt
> index 9a6e251..b9af4bf 100644
> --- a/Documentation/devicetree/bindings/arm/mrvl/timer.txt
> +++ b/Documentation/devicetree/bindings/arm/mrvl/timer.txt
> @@ -1,13 +1,74 @@
>  * Marvell MMP Timer controller
>
> +Each timer have multiple counters, so the timer DT need include counter's
> +description.
> +
> +1. Timer
> +
>  Required properties:
> -- compatible : Should be "mrvl,mmp-timer".
> +- compatible : Should be "marvell,mmp-timer".
>  - reg : Address and length of the register set of timer controller.
> -- interrupts : Should be the interrupt number.
> +- marvell,timer-id : The index of the timer. The timer controller may
> +  include several timers.

Is this a single entry or a list?

> +- marvell,timer-fastclk-frequency : The fast clock frequency of the timer.
> +  Timer will have several clock inputs: fast clock, 32KHZ, 1KHZ. For all
> +  SOCes use this timer controller, fast clock may not be same.
> +- marvell,timer-apb-frequency : The fequency of the apb bus that the timer
> +  attached to. This frequency and "marvell,timer-fastclk-frequency" are used
> +  to calculated delay loops for clock operations.

Wouldn't these be better described as clock inputs?

> +
> +Optional properties:
> +- marvell,timer-has-crsr : This timer has CRSR register.
> +- marvell,timer-has-shadow : This timer has shadow register.
> +
> +2. Counter
> +
> +Required properties:
> +- compatible : It can be
> +      "marvell,timer-counter-clkevt" : The counter is used for clock event
> +                                       device.
> +      "marvell,timer-counter-clksrc" : The counter is used for clock source.
> +      "marvell,timer-counter-delay" : The counter is used for delay timer.

These are _not_ hardware properties. Why can the driver not choose how
to use each of the counter sub-blocks?

How would blocks with each of these strings actually differ?

> +- marvell,timer-counter-id : The counter index in this timer.

Perhaps use a reg for this?

>
> -Example:
> -       timer0: timer@d4014000 {
> -               compatible = "mrvl,mmp-timer";
> -               reg = <0xd4014000 0x100>;
> +Optional properties:
> +- interrupts : The counters may have different IRQs or share same IRQs.
> +  Only valid for "marvell,timer-counter-clkevt".

Describe what the interrupt is logically.

What is the interrupt logically?

> +- marvell,timer-counter-cpu : which CPU the counter is bound. Only valid for
> +  "marvell,timer-counter-clkevt".

How is the counter bound to a particular CPU? Is there really a
relationship in hardware between a given CPU and counter?

> +- "marvell,timer-counter-rating" : The rating when register clock event device
> +  or clock source. Only valid for "marvell,timer-counter-clkevt" and
> +  "marvell,timer-counter-clksrc".

What does this mean? This seems like another leak of Linux internals.

> +- marvell,timer-counter-broadcast : When this counter acts as clock event
> +  device. It is broadcast clock event device.
> +  Only valid for "marvell,timer-counter-clkevt".

This does not seem like a hardware property. Why can Linux not decide
which counter (if any) to use as the broadcast source?

> +- marvell,timer-counter-nodynirq : When this counter acts as broadcast clock
> +  event device, it cannot switch the IRQ of broadcast clock event to any CPU.
> +  Only valid for "marvell,timer-counter-clkevt".

Likewise this does not sound like a hardware property.

Mark.
