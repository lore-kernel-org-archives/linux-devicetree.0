From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 7/9] arm64: dts: rockchip: add pd_edp node for rk3399
Date: Mon, 14 Nov 2016 09:26:28 -0800
Message-ID: <CAD=FV=WDsPF1dHgZePKq20tQjguHm7yyBEA9-+sNoDm7HdspXg@mail.gmail.com>
References: <1478697721-2323-1-git-send-email-wxt@rock-chips.com> <1478697721-2323-8-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478697721-2323-8-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Eddie Cai <eddie.cai@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>, zhangqing <zhangqing@rock-chips.com>, David Wu <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>, Brian Norris <briannorris@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Caesar,

On Wed, Nov 9, 2016 at 5:21 AM, Caesar Wang <wxt@rock-chips.com> wrote:
> From: zhangqing <zhangqing@rock-chips.com>
>
> 1. add pd node for RK3399 Soc
> 2. create power domain tree
> 3. add qos node for domain

No step #3 since there doesn't appear to be a qos node for eDP.  Your
patch doesn't add one and I can't find one in the TRM.

> 4. add the pd support for edp
>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> ---
>
> Changes in v2: None
>
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 74deb44..09ebf4e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -835,6 +835,10 @@
>                         };
>
>                         /* These power domains are grouped by VD_LOGIC */
> +                       pd_edp@RK3399_PD_EDP {
> +                               reg = <RK3399_PD_EDP>;
> +                               clocks = <&cru PCLK_EDP_CTRL>;

Are you sure that PCLK_EDP isn't needed as well?  After the super
hard-to-debug problems we just faced with the missing GMAC clock in
the power domains, I figure it's at least worth a check.  ;)

> +                       };
>                         pd_emmc@RK3399_PD_EMMC {
>                                 reg = <RK3399_PD_EMMC>;
>                                 clocks = <&cru ACLK_EMMC>;
> @@ -1364,6 +1368,7 @@
>                 status = "disabled";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&edp_hpd>;
> +               power-domains = <&power RK3399_PD_EDP>;
>
>                 ports {
>                         #address-cells = <1>;

Other than the question about the clock and the nits about the commit
message, this all looks fine to me.  Feel free to add my Reviewed-by
if you fix those things.


-Doug
