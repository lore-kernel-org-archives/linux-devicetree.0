From: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: add USB3 OTG reset for Type-C
 PHY on rk3399
Date: Thu, 18 Jan 2018 18:21:46 +0100
Message-ID: <CAFqH_53gvJe-rU=z9q-Yz6aqwjtHtWt6gvQ0QvodGBxvou=BXA@mail.gmail.com>
References: <1515751704-13213-1-git-send-email-william.wu@rock-chips.com> <1515751704-13213-3-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515751704-13213-3-git-send-email-william.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Wu <william.wu@rock-chips.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Wang <frank.wang@rock-chips.com>, huangtao@rock-chips.com, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, daniel.meng@rock-chips.com, John.Youn@synopsys.com, lin.huang@rock-chips.com
List-Id: devicetree@vger.kernel.org

2018-01-12 11:08 GMT+01:00 William Wu <william.wu@rock-chips.com>:
> Add USB3 OTG reset for Type-C PHY. It can be used to hold the USB3
> OTG controller in reset state before initializing the Type-C PHY.
>
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index d340b58a..4e89d00 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1377,8 +1377,9 @@
>                 power-domains = <&power RK3399_PD_TCPD0>;
>                 resets = <&cru SRST_UPHY0>,
>                          <&cru SRST_UPHY0_PIPE_L00>,
> -                        <&cru SRST_P_UPHY0_TCPHY>;
> -               reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
> +                        <&cru SRST_P_UPHY0_TCPHY>,
> +                        <&cru SRST_A_USB3_OTG0>;
> +               reset-names = "uphy", "uphy-pipe", "uphy-tcphy", "usb3-otg";
>                 rockchip,grf = <&grf>;
>                 rockchip,typec-conn-dir = <0xe580 0 16>;
>                 rockchip,usb3tousb2-en = <0xe580 3 19>;
> @@ -1406,8 +1407,9 @@
>                 power-domains = <&power RK3399_PD_TCPD1>;
>                 resets = <&cru SRST_UPHY1>,
>                          <&cru SRST_UPHY1_PIPE_L00>,
> -                        <&cru SRST_P_UPHY1_TCPHY>;
> -               reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
> +                        <&cru SRST_P_UPHY1_TCPHY>,
> +                        <&cru SRST_A_USB3_OTG1>;
> +               reset-names = "uphy", "uphy-pipe", "uphy-tcphy", "usb3-otg";
>                 rockchip,grf = <&grf>;
>                 rockchip,typec-conn-dir = <0xe58c 0 16>;
>                 rockchip,usb3tousb2-en = <0xe58c 3 19>;
> --
> 2.0.0
>
>

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
