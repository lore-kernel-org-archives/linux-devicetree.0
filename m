Return-Path: <SRS0=JAkm=LM=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <20180829132954.64862-2-chris.brandt@renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
Date: Wed, 29 Aug 2018 17:09:28 +0200
MIME-Version: 1.0
In-Reply-To: <20180829132954.64862-2-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Chris Brandt <chris.brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On 29/08/2018 15:29, Chris Brandt wrote:
> The newer RZ/A clock control driver no longer registers all its clocks
> using DT, therefore the clocks required by this driver are no longer
> present at the beginning of boot.
> 
> Because of this, TIMER_OF_DECLARE can no longer be used because this
> causes the driver to get probed too early before the parent clock exists,
> and the probe will fail with "ostm: Failed to get clock".
> 
> So, we'll change this driver to register/probe during subsys_initcall which
> is after the appropriate clocks have been registered.

Can the boot constraints [1] solve this issue instead of the changes you
are proposing ?

[1] https://lwn.net/Articles/747250/




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
