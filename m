From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] ARM: dts: rockchip: Use interpolated brightness tables
 for veyron
Date: Tue, 8 Oct 2019 11:05:24 -0700
Message-ID: <CAD=FV=Xi-M=Kk0axj=ukGMDr4p0a86LRdiL-6WyPZnL2vuDZGA@mail.gmail.com>
References: <20191003094137.v2.1.Ic9fd698810ea569c465350154da40b85d24f805b@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003094137.v2.1.Ic9fd698810ea569c465350154da40b85d24f805b@changeid>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 3, 2019 at 9:42 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Use interpolated brightness tables (added by commit 573fe6d1c25
> ("backlight: pwm_bl: Linear interpolation between
> brightness-levels") for veyron, instead of specifying every single
> step. Some devices/panels have intervals that are smaller than
> the specified 'num-interpolated-steps', the driver interprets
> these intervals as a single step.
>
> Another option would be to switch to a perceptual brightness curve
> (CIE 1931), with the caveat that it would change the behavior of
> the backlight. Also the concept of a minimum brightness level is
> currently not supported for CIE 1931 curves.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - added 0 as first step for devices/panels that require a minimum
>   PWM duty cycle
> - increased 'num-interpolated-steps' values by one, it's not the
>   number of steps between levels, but that number +1
>
>  arch/arm/boot/dts/rk3288-veyron-edp.dtsi   | 35 ++--------------------
>  arch/arm/boot/dts/rk3288-veyron-jaq.dts    | 35 ++--------------------
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts | 35 ++--------------------
>  arch/arm/boot/dts/rk3288-veyron-tiger.dts  | 35 ++--------------------
>  4 files changed, 8 insertions(+), 132 deletions(-)

I guess if someone wanted to they could try to increase the number of
steps and see if they got prettier backlight transition, but what's
there now doesn't bother me and has the advantage of matching what has
been in use forever.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
