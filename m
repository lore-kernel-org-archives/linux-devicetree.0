From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/2] Use SPDX-License-Identifier for rockchip devicetree files
Date: Fri, 15 Dec 2017 09:29:02 -0800
Message-ID: <CAD=FV=WA44n8MYtGZTQN3r0F86E=xDcdWhQDLDOkyqS=aaCXfQ@mail.gmail.com>
References: <20171215114427.32059-1-klaus.goger@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215114427.32059-1-klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joseph Chen <chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Emil Renner Berthing <kernel-sKpHZLTYfq0@public.gmane.org>, Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>Jaehoon Chung <jh>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Dec 15, 2017 at 3:44 AM, Klaus Goger
<klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org> wrote:
> This patch series replaces all the license text in rockchip devicetree
> files text with a proper SPDX-License-Identifier.
> It follows the guidelines submitted[1] by Thomas Gleixner that are not
> yet merged.
>
> These series also fixes the issue with contradicting statements in most
> licenses. The introduction text claims to be GPL or X11[2] but the
> following verbatim copy of the license is actually a MIT[3] license.
> The X11 license includes a advertise clause and trademark information
> related to the X Consortium. As these X Consortium specfic points are
> irrelevant for us we stick with the actuall license text.
>
> [1] https://patchwork.kernel.org/patch/10091607/
> [2] https://spdx.org/licenses/X11.html
> [3] https://spdx.org/licenses/MIT.html
>
>
> Klaus Goger (2):
>   arm64: dts: rockchip: use SPDX-License-Identifier
>   ARM: dts: rockchip: use SPDX-License-Identifier
>
>  arch/arm/boot/dts/rk3036-evb.dts                   | 40 +---------------------
>  arch/arm/boot/dts/rk3036-kylin.dts                 | 40 +---------------------
>  arch/arm/boot/dts/rk3036.dtsi                      | 40 +---------------------
>  arch/arm/boot/dts/rk3066a-bqcurie2.dts             | 39 +--------------------
>  arch/arm/boot/dts/rk3066a-marsboard.dts            | 39 +--------------------
>  arch/arm/boot/dts/rk3066a-mk808.dts                | 39 +--------------------
>  arch/arm/boot/dts/rk3066a-rayeager.dts             | 39 +--------------------
>  arch/arm/boot/dts/rk3066a.dtsi                     | 39 +--------------------
>  arch/arm/boot/dts/rk3188-px3-evb.dts               | 39 +--------------------
>  arch/arm/boot/dts/rk3188-radxarock.dts             | 39 +--------------------
>  arch/arm/boot/dts/rk3188.dtsi                      | 39 +--------------------
>  arch/arm/boot/dts/rk3228-evb.dts                   | 40 +---------------------
>  arch/arm/boot/dts/rk3229-evb.dts                   | 40 +---------------------
>  arch/arm/boot/dts/rk3229.dtsi                      | 39 +--------------------
>  arch/arm/boot/dts/rk322x.dtsi                      | 40 +---------------------
>  arch/arm/boot/dts/rk3288-evb-act8846.dts           | 40 +---------------------
>  arch/arm/boot/dts/rk3288-evb-rk808.dts             | 40 +---------------------
>  arch/arm/boot/dts/rk3288-evb.dtsi                  | 40 +---------------------
>  arch/arm/boot/dts/rk3288-fennec.dts                | 40 +---------------------
>  arch/arm/boot/dts/rk3288-firefly-beta.dts          | 39 +--------------------
>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi  | 39 +--------------------
>  arch/arm/boot/dts/rk3288-firefly-reload.dts        | 39 +--------------------
>  arch/arm/boot/dts/rk3288-firefly.dts               | 39 +--------------------
>  arch/arm/boot/dts/rk3288-firefly.dtsi              | 39 +--------------------
>  arch/arm/boot/dts/rk3288-miqi.dts                  | 39 +--------------------
>  arch/arm/boot/dts/rk3288-phycore-rdk.dts           | 39 +--------------------
>  arch/arm/boot/dts/rk3288-phycore-som.dtsi          | 39 +--------------------
>  arch/arm/boot/dts/rk3288-popmetal.dts              | 39 +--------------------
>  arch/arm/boot/dts/rk3288-r89.dts                   | 39 +--------------------
>  arch/arm/boot/dts/rk3288-rock2-som.dtsi            | 40 +---------------------
>  arch/arm/boot/dts/rk3288-rock2-square.dts          | 40 +---------------------
>  arch/arm/boot/dts/rk3288-tinker.dts                | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi  |  5 +--
>  arch/arm/boot/dts/rk3288-veyron-brain.dts          | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi    | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-jaq.dts            | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-jerry.dts          | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-mickey.dts         | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts         | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-pinky.dts          | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-sdmmc.dtsi         | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron-speedy.dts         | 39 +--------------------
>  arch/arm/boot/dts/rk3288-veyron.dtsi               | 39 +--------------------
>  arch/arm/boot/dts/rk3288-vyasa.dts                 | 39 +--------------------
>  arch/arm/boot/dts/rk3288.dtsi                      | 40 +---------------------
>  arch/arm/boot/dts/rk3xxx.dtsi                      | 39 +--------------------
>  arch/arm/boot/dts/rv1108-evb.dts                   | 40 +---------------------
>  arch/arm/boot/dts/rv1108.dtsi                      | 40 +---------------------
>  arch/arm64/boot/dts/rockchip/rk3328-evb.dts        | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi           | 39 +--------------------
>  .../arm64/boot/dts/rockchip/rk3368-evb-act8846.dts | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    | 39 +--------------------
>  .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3368-r88.dts        | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi           | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399-evb.dts        | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi   | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi       | 39 +--------------------
>  .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      | 39 +--------------------
>  .../dts/rockchip/rk3399-sapphire-excavator.dts     | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  | 39 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 39 +--------------------
>  69 files changed, 69 insertions(+), 2603 deletions(-)

This is just removing the verbatim license text and adding a link to
another file with the text?  ...and correcting the name of the
alternate license to be the MIT license...  I'm no lawyer, but if
that's what everyone in the kernel agrees is the way they want it
going forward then I have no objections to anything I was involved in.
Thus:

Acked-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
