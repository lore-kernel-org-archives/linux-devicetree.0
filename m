From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: add startup delay to
 rk3288-veyron panel-regulators"
Date: Thu, 20 Jun 2019 13:31:09 -0700
Message-ID: <CAD=FV=Wi21Emjg7CpCJfSRiKr_EisR20UO1tbPjAeJzdJNbSVw@mail.gmail.com>
References: <20190620182056.61552-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620182056.61552-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jun 20, 2019 at 11:21 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> This reverts commit 1f45e8c6d0161f044d679f242fe7514e2625af4a.
>
> This 100 ms mystery delay is not on downstream kernels and no longer
> seems needed on upstream kernels either [1].  Presumably something in the
> meantime has made things better.  A few possibilities for patches that
> have landed in the meantime that could have made this better are
> commit 3157694d8c7f ("pwm-backlight: Add support for PWM delays
> proprieties."), commit 5fb5caee92ba ("pwm-backlight: Enable/disable
> the PWM before/after LCD enable toggle."), and commit 6d5922dd0d60
> ("ARM: dts: rockchip: set PWM delay backlight settings for Veyron")
>
> Let's revert and get our 100 ms back.
>
> [1] https://lkml.kernel.org/r/2226970.BAPq4liE1j@diego
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  arch/arm/boot/dts/rk3288-veyron-jaq.dts    | 1 -
>  arch/arm/boot/dts/rk3288-veyron-jerry.dts  | 1 -
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts | 1 -
>  arch/arm/boot/dts/rk3288-veyron-speedy.dts | 1 -
>  4 files changed, 4 deletions(-)

Maybe wait before applying.  I've been running reboot tests now with
this patch applied (among others) and with enough reboots I managed to
see:

[    5.682418] rockchip-dp ff970000.dp: eDP link training failed (-5)

I'll see if I can confirm that it's this patch and why things are
different compared to downstream.

-Doug
