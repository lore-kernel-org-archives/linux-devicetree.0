From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 4/6] pinctrl: rockchip: add bindings for rk3399 pinctrl
Date: Wed, 17 Feb 2016 07:47:45 +0100
Message-ID: <19942952.P4nUQKPo3g@phil>
References: <1455673992-16469-1-git-send-email-jay.xu@rock-chips.com> <1455673992-16469-5-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455673992-16469-5-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "jianqun.xu" <jay.xu@rock-chips.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, jwerner@chromium.org, broonie@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, linus.walleij@linaro.org, sjoerd.simons@collabora.co.uk, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jianqun,

Am Mittwoch, 17. Februar 2016, 09:53:10 schrieb jianqun.xu:
> From: Xu Jianqun <jay.xu@rock-chips.com>
> 
> Add devicetree bindings for pinctrl found on rk3399
> processors from rockchip.
> 
> Signed-off-by: Xu Jianqun <jay.xu@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt index
> 0cd701b..c68b955 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> @@ -22,7 +22,7 @@ Required properties for iomux controller:
>    - compatible: one of "rockchip,rk2928-pinctrl",
> "rockchip,rk3066a-pinctrl" "rockchip,rk3066b-pinctrl",
> "rockchip,rk3188-pinctrl"
>  		       "rockchip,rk3228-pinctrl", "rockchip,rk3288-pinctrl"
> -		       "rockchip,rk3368-pinctrl"
> +		       "rockchip,rk3368-pinctrl", "rockchip,rk3399-pinctrl"
>    - rockchip,grf: phandle referencing a syscon providing the
>  	 "general register files"

that is already contained in David's core pinctrl patch that already got 
applied to the pinctrl tree.


Heiko
