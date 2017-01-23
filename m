From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 5/9] ARM: dts: rockchip: disable arm-global-timer for rk3188
Date: Mon, 23 Jan 2017 17:14:22 +0100
Message-ID: <1513239.YT6aWj25Ep@diego>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com> <1480436092-10728-1-git-send-email-al.kochet@gmail.com> <1480436092-10728-6-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480436092-10728-6-git-send-email-al.kochet@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Caesar Wang <wxt@rock-chips.com>, Huang Tao <huangtao@rock-chips.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 29. November 2016, 19:14:48 CET schrieb Alexander Kochetkov:
> arm-global-timer can provide clockevents, clocksource and shed_clock. But
> on rk3188 platform it provide only clocksource and shed_clock. clockevents
> from  arm-global-timer is not used by kernel because there is another
> clockevent provider with higher rating (smp-twd).
> 
> My commit from the series implement clocksource and shed_clock using
> rockchip_timer. But sched clock from rk_timer is not selected by kernel
> due to lower frequency than arm-global-timer, and clocksource from
> rk_timer is not selected by kernel due to lower rating than
> arm-global-timer. And I don't want to increase clocksource rating
> because ratings greater 300 used for high frequency clocksources.
> 
> clocksource and shed_clock is quite unstable, because their rate depends
> on cpu frequency. So disable arm-global-timer and use clocksource and
> sched_clock from rockchip_timer.

That commit message is hard to understand in its entirety, but this last 
paragraph is essentially enough to describe the problem. So maybe you could 
shorten that somehow.


Heiko


> Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
> ---
>  arch/arm/boot/dts/rk3188.dtsi |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
> index 0dc52fe..44da3d42 100644
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
