From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V12 0/8] C-SKY(csky) Linux Kernel Driver
Date: Mon, 15 Oct 2018 10:32:34 +0800
Message-ID: <20181015023234.GA24121@guoren-Inspiron-7460>
References: <cover.1539315341.git.ren_guo@c-sky.com>
 <dfe56d38-cfa5-2be1-114e-c6721d6c92a3@linaro.org>
 <20181014162631.GA13374@guoren-Inspiron-7460>
 <36e2cb6d-6d9e-4764-a6dd-a5f74cab5a09@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <36e2cb6d-6d9e-4764-a6dd-a5f74cab5a09@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, will.deacon@arm.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Sun, Oct 14, 2018 at 10:38:36PM +0200, Daniel Lezcano wrote:
> On 14/10/2018 18:26, Guo Ren wrote:
> Thanks Guo,
> 
> the descriptions look ok for the timer part. Can you resend the DT
> bindings + timers patches separately with the commit log updated ?
Ok, immediately.

> 
> When you add the Changelog you have to insert it *after* the first
> '---', so when the patch is git applied, the change log will be
> discarded and won't appear in git.
Ok, thx for the tips.

> 
> eg.
> 
> commit 6b465856936cb8f7eda31b20eb59fb5c8a19d468
> Author: Guo Ren <ren_guo@c-sky.com>
> Date:   Tue Oct 2 16:43:18 2018 +0800
> 
> clocksource: add gx6605s SOC system timer
> 
> The driver is for gx6605s SOC system timer and there are two
> same timers in gx6605s. We use one for clkevt and another one for
> clksrc.
> 
> The timer is mmio map to access, so we need give mmio address in dts.
> The counter at 0x0  offset is clock event. The counter at 0x40 offset is
> clock source.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
> Changelog:
>      - pass checkpatch.pl
>      - Add COMIPLE_TEST in Kconfig
>      - no cast is needed for "struct clock_event_device *ce = dev"
>      - remove: extra space after (u64)
>      - Add License and Copyright
>      - Use timer-of framework
>      - Change name with upstream feedback
>      - Use clksource_mmio framework
> ---

Best Regards
 Guo Ren
