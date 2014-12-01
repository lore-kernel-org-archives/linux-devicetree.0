From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v10 4/4] ARM: dts: rockchip: add suspend settings for rk3288-evb-rk808
Date: Mon, 1 Dec 2014 14:19:38 -0800
Message-ID: <CAD=FV=XHUze3ovhFSN7_9rvM6tpKrF90ii1XbHPxw4q-7ob+dA@mail.gmail.com>
References: <1417423940-1669-1-git-send-email-zyw@rock-chips.com>
	<1417423940-1669-5-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417423940-1669-5-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Chris,

On Mon, Dec 1, 2014 at 12:52 AM, Chris Zhong <zyw@rock-chips.com> wrote:
> Add suspend-voltages and necessary pin-states for suspend on
> rk3288-evb-rk808 boards. global_pwroff would be pulled high when
> RK3288 entering suspend, this pin is a sleep signal for RK808, so
> RK808 could goto sleep mode, and some regulators would be disable.
>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>
> ---
>
> Changes in v10:
> - remove regulator-suspend-mem-enabled and regulator-suspend-mem-microvolt
> - enable the lcd, codec, sdmmc power during suspend
>
> Changes in v9:
> - update the subject and description
>
> Changes in v8:
> - keep all except cpu&tp power rail on during suspend
> - add regulator-on-in-suspend before set suspend voltage
> - add a reference of ddrio_pwroff and ddr0_retention
>
> Changes in v7:
> - add regulator-state-mem sub node for suspend
>
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>  arch/arm/boot/dts/rk3288-evb-rk808.dts | 53 +++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)

I'm still not 100% clear on why it wakes up by itself, but I guess (?)
that could be solved in a separate patch.  I did confirm that if I
hacked the wakeup source to be just from GPIOs that it stayed asleep
and could be awakened by the power button.  I tested on linux-next
with evb-rk808.

Reviewed-by: Doug Anderson <dianders@chromium.org>
Tested-by: Doug Anderson <dianders@chromium.org>

-Doug
