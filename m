From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V7 3/8] clocksource: add C-SKY SMP timer
Date: Sun, 30 Sep 2018 21:22:30 +0200
Message-ID: <a15b5e43-0721-8638-f5d2-8bb72df87f4d@linaro.org>
References: <9d68bdd87a8c91f4ee35ff4311e273ea81ab9eb4.1538323894.git.ren_guo@c-sky.com>
 <eee964dd57d12bc630280ab84235b5356799b1fb.1538323894.git.ren_guo@c-sky.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <eee964dd57d12bc630280ab84235b5356799b1fb.1538323894.git.ren_guo@c-sky.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <ren_guo@c-sky.com>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, f.fainelli@gmail.com, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30/09/2018 18:18, Guo Ren wrote:
> This timer is used by SMP system and use mfcr/mtcr instruction
> to access the regs.
> 
> Changelog:
>  - Remove #define CPUHP_AP_CSKY_TIMER_STARTING
>  - Add CPUHP_AP_CSKY_TIMER_STARTING in cpuhotplug.h
>  - Support csky mp timer alpha version.
>  - Just use low-counter with 32bit width as clocksource.
>  - Coding convention with upstream feed-back.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---


Guo,

what is the flow of your patches ?

You sent me a V8 with two patches and those timers which I commented.

And now there is this V7 with the patches previously sent as V8 without
the comments take into account.

I'm a bit lost. Can you clarify ?

Thanks

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
