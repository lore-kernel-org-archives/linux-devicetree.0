From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/7] Rename RK1108 to RV1108
Date: Mon, 13 Feb 2017 13:51:53 +0100
Message-ID: <2809087.MHZWQWdaOC@phil>
References: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>, robh+dt@kernel.org
Cc: linus.walleij@linaro.org, shawn.lin@rock-chips.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, sboyd@codeaurora.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Montag, 13. Februar 2017, 18:59:26 CET schrieb Andy Yan:
> Rockchip finally named this soc as RV1108, so change
> RK1108/rk1108 to RV1108/rv1108 for compatible.

renaming existing bindings (that have been in multiple kernel versions 
already) always is a hot topic. So I'll be hoping for Rob to give a go-ahead 
for it :-) .

Just to confirm, the rk1108/rv1108 is completely new to the market, so we're 
not breaking any existing devices, right?


Heiko



> Andy Yan (7):
>   dt-bindings: rockchip-dw-mshc: rename RK1108 to RV1108
>   dt-bindings: rk1108-cru: rename RK1108 to RV1108
>   clk: rockchip: rename RK1108 to RV1108
>   dt-bindings: rockchip,pinctrl: rename RK1108 to RV1108
>   pinctrl: rockchip: rename RK1108 to RV1108
>   ARM: dts: rename RK1108 to RV1108
>   ARM: rockchip: reanme RK1108 to RV1108
> 
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +-
>  ...chip,rk1108-cru.txt => rockchip,rv1108-cru.txt} |  12 +-
>  .../devicetree/bindings/mmc/rockchip-dw-mshc.txt   |   2 +-
>  .../bindings/pinctrl/rockchip,pinctrl.txt          |  16 +-
>  arch/arm/boot/dts/Makefile                         |   2 +-
>  .../boot/dts/{rk1108-evb.dts => rv1108-evb.dts}    |   7 +-
>  arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi}     |  24 +-
>  drivers/clk/rockchip/Makefile                      |   2 +-
>  .../clk/rockchip/{clk-rk1108.c => clk-rv1108.c}    | 414
> ++++++++++----------- drivers/clk/rockchip/clk.h                         | 
> 28 +-
>  drivers/pinctrl/pinctrl-rockchip.c                 |  76 ++--
>  .../clock/{rk1108-cru.h => rv1108-cru.h}           |   6 +-
>  12 files changed, 300 insertions(+), 293 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{rockchip,rk1108-cru.txt =>
> rockchip,rv1108-cru.txt} (83%) rename arch/arm/boot/dts/{rk1108-evb.dts =>
> rv1108-evb.dts} (89%) rename arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi}
> (94%)
>  rename drivers/clk/rockchip/{clk-rk1108.c => clk-rv1108.c} (57%)
>  rename include/dt-bindings/clock/{rk1108-cru.h => rv1108-cru.h} (97%)


