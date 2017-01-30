From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 4/8] ARM: dts: rockchip: disable arm-global-timer for
 rk3188
Date: Mon, 30 Jan 2017 11:21:27 +0100
Message-ID: <20170130102127.GB2206@mai>
References: <1485260203-14216-1-git-send-email-al.kochet@gmail.com>
 <1485260203-14216-5-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485260203-14216-5-git-send-email-al.kochet@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Caesar Wang <wxt@rock-chips.com>, Huang Tao <huangtao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 03:16:39PM +0300, Alexander Kochetkov wrote:
> clocksource and shed_clock provided by arm-global-timer is quite
> unstable, because their rate depends on cpu frequency.
> So disable arm-global-timer and use clocksource and sched_clock
> from rockchip_timer.
> It is impossible get stable clocksource having rockchip_timer and
> arm-global-timer enabled at the same time. Because arm-global-timer
> looks like a better candidate for the kernel: it has higher
> frequency and rating.
> 
> Disabling arm-global-timer doesn't leave kernel without
> clockevents as there is another clockevent provider (smp-twd).

Hi Alexander,

sorry, I will rewrite the description because of the grammatical errors. I
don't want to give you the feeling I'm lecturing you, my English is not perfect
but it will be simpler to give the full descr with the typos fixed.

"
The clocksource and the sched_clock provided by the arm_global_timer are quite
unstable because their rates depend on the cpu frequency.

On the other side, the arm_global_timer has a higher rating than the
rockchip_timer, it will be selected by default by the time framework while
we want to use the stable rockchip clocksource.

Let's disable the arm_global_timer in order to have the rockchip clocksource
selected by default.
"

This patch should go at the end of the patchset when the clocksource is
implemented in the rockchip_timer.

> Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
> Reviwed-by: Heiko Stübner <heiko@sntech.de>
> ---
>  arch/arm/boot/dts/rk3188.dtsi |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
> index bcf8e03..f677130 100644
> --- a/arch/arm/boot/dts/rk3188.dtsi
> +++ b/arch/arm/boot/dts/rk3188.dtsi
> @@ -546,6 +546,7 @@
>  
>  &global_timer {
>  	interrupts = <GIC_PPI 11 0xf04>;
> +	status = "disabled";
>  };
>  
>  &local_timer {
> -- 
> 1.7.9.5
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
