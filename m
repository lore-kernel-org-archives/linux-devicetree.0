From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V9 3/8] clocksource: add C-SKY SMP timer
Date: Tue, 2 Oct 2018 09:59:42 +0200
Message-ID: <49238cda-d12c-7d3f-9333-296527d94f12@linaro.org>
References: <cover.1538355281.git.ren_guo@c-sky.com>
 <eee964dd57d12bc630280ab84235b5356799b1fb.1538355281.git.ren_guo@c-sky.com>
 <88e320f2-8cf0-fdb9-c9b0-ee25d7a4d00f@linaro.org>
 <20181002054024.GA12645@guoren>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002054024.GA12645@guoren>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <ren_guo@c-sky.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, f.fainelli@gmail.com, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/10/2018 07:40, Guo Ren wrote:
[ ... ]

>>
>> 	irq = irq_of_parse_and_map(np, 0);
>> 	if (irq <= 0)
>> 		return -EINVAL;
> 		panic();
> I want a panic here. Return will make debug confused and directly tell
> the people where is wrong. It's root-timer for us and it must bootup.
> 
> If it's a co-timer, I also think return is good.

We don't need a panic in case of failure. If the board as an alternate
timer it should be able to boot, that is the general rule of thumb for
these drivers in this directory.

The init timer functions will be called via the timer_probe() which
browse the timer_of_table (the one with all entries for the
TIMER_OF_DECLARE macros).

You can see in the code below (from timer_probe.c), there is an error
message emitted if the driver fails to initialize and another one much
stronger if no timer was initialize.

This is enough trace IMO.

void __init timer_probe(void)
{
        struct device_node *np;
        const struct of_device_id *match;
        of_init_fn_1_ret init_func_ret;
        unsigned timers = 0;
        int ret;

        for_each_matching_node_and_match(np, __timer_of_table, &match) {
                if (!of_device_is_available(np))
                        continue;

                init_func_ret = match->data;

                ret = init_func_ret(np);
                if (ret) {
                        pr_err("Failed to initialize '%pOF': %d\n", np,
ret);
                        continue;
                }

                timers++;
        }

        timers += acpi_probe_device_table(timer);

        if (!timers)
                pr_crit("%s: no matching timers found\n", __func__);
}




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
