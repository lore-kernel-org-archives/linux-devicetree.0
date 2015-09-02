From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: rk3288: pull up cts lines
Date: Wed, 2 Sep 2015 15:57:30 -0700
Message-ID: <CAD=FV=WEc4tSn7HhFkVWRJwb7Z33Kq4u3ubsYKb2xyJLAQrVPg@mail.gmail.com>
References: <1441232406-32628-1-git-send-email-amstan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441232406-32628-1-git-send-email-amstan@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru M Stan <amstan@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jeffy Chen <jeffy.chen@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Neil Hendin <nhendin@chromium.org>
List-Id: devicetree@vger.kernel.org

Alex,

On Wed, Sep 2, 2015 at 3:20 PM, Alexandru M Stan <amstan@chromium.org> wrote:
> The flow control lines from a user accessible UART are optional,
> the user might not have anything connected to those pins.
> In order to prevent random interrupts happening and noise affecting
> that pin it should be pulled up.
>
> Note that the default state for those pins on the rk3288 is pulled up,
> so this patch merely restores them.
>
> Suggested-by: Neil Hendin <nhendin@chromium.org>
> Signed-off-by: Alexandru M Stan <amstan@chromium.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 906e938..a059367 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -1211,11 +1211,11 @@
>                         };
>
>                         uart0_cts: uart0-cts {
> -                               rockchip,pins = <4 18 RK_FUNC_1 &pcfg_pull_none>;
> +                               rockchip,pins = <4 18 RK_FUNC_1 &pcfg_pull_up>;
>                         };
>
>                         uart0_rts: uart0-rts {
> -                               rockchip,pins = <4 19 RK_FUNC_1 &pcfg_pull_none>;
> +                               rockchip,pins = <4 19 RK_FUNC_1 &pcfg_pull_up>;

I would probably do just CTS.  That would match the TX / RX lines
where the RX is pulled but not the TX.

You might also mention in the commit message that this really should
be safe since we're already doing something similar for RX.


-Doug
