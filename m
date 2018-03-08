From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 2/2] clocksource/drivers/npcm: Add NPCM7xx timer driver
Date: Thu, 8 Mar 2018 16:33:13 +0100
Message-ID: <2a83eb83-10a9-54f3-e0da-bd6cf32b5ac1@linaro.org>
References: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
 <1520522698-16153-3-git-send-email-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520522698-16153-3-git-send-email-tmaimon77@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 08/03/2018 16:24, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM7xx timer driver.
> 
> The clocksource Enable 24-bit TIMER0 and TIMER1 counters,
> while TIMER0 serve as clockevent and TIMER1 serve as clocksource.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>
> ---

[ ... ]

> +
> +	pr_info("Enabling NPCM7xx clocksource timer base: 0x%x, IRQ: %d ",
> +		(int)timer_of_base(&npcm7xx_to), timer_of_irq(&npcm7xx_to));

You can use '%p' instead of '0x%x' and remove the (int) cast.

I'm fine with the driver. If there is no comment, I will take it and do
the change (if you are ok), no need on this case to resend a v6.



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
