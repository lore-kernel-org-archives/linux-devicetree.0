From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 0/4] clocksource: rockchip/timer: Support rktimer for
 rk3399
Date: Thu, 16 Jun 2016 16:26:22 +0200
Message-ID: <5762B70E.7090909@linaro.org>
References: <1465275273-22076-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465275273-22076-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: dianders@chromium.org, briannorris@google.com, smbarber@google.com, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, cf@rock-chips.com, huangtao@rock-chips.com, devicetree@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/07/2016 06:54 AM, Caesar Wang wrote:
> This series patches had been tested on rockchip inside kernel.
> In order to support the rk3399 SoC timer and turn off interrupts and =
IPIs to
> save power in idle.
> Okay, it still works bootup on rk3288/other SoCs, even though many so=
cs hasn't used
> the broadcast timer.
>
> History version:
> v1:
> https://lkml.org/lkml/2016/5/25/186
>
> Easy to test for my borad.
> localhost / # cat /proc/interrupts
> CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
> 1:          0          0          0          0          0          0 =
    GICv3  29 Edge      arch_timer
> ...
> 5:          0          0          0          0          0          0 =
    GICv3 113 Level     rk_timer
> ..
>
> localhost / # cat /proc/timer_list | grep event_handler
> get "event_handler:  hrtimer_interrupt"
> event_handler:  tick_handle_oneshot_broadcast
> event_handler:  hrtimer_interrupt
>
> That should work for my board.

Hi Caesar,

I applied the patches on my tree. I humbly reworded the changelog, if=20
you disagree with the content, let me know.

Please, in the future, take care of the following:

  - patch prefix is 'clocksource/driver/<driver_name>: [A-Z].*'

  - the change log is important, it deserves some love.

Thanks.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
