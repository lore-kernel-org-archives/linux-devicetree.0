From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: enable touchpad button for rk3399-gru-kevin
Date: Tue, 10 Oct 2017 11:33:49 +0200
Message-ID: <4174027.Z5MyPRUDcj@phil>
References: <20171009184028.11829-1-kernel@esmil.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171009184028.11829-1-kernel@esmil.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Emil Renner Berthing <kernel@esmil.dk>, Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <briannorris@chromium.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Emil,

Am Montag, 9. Oktober 2017, 20:40:28 CEST schrieb Emil Renner Berthing:
> Adding the linux,gpio-keymap entry also has
> the side-effect of making the driver register
> the touchpad as a touchpad rather than another
> touchscreen.
> 
> The index for BTN_LEFT was found by trial and error.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

looks good to me. I'll just give the ChromeOS people a chance to
respond before applying [maybe they can even tell what the other
keys are :-) ]


Heiko

> ---
>  arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> index 5c8621766908..1c58d12551f5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> @@ -278,6 +278,10 @@ ap_i2c_dig: &i2c2 {
>  		pinctrl-0 = <&trackpad_int_l>;
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +		linux,gpio-keymap = <KEY_RESERVED
> +				     KEY_RESERVED
> +				     KEY_RESERVED
> +				     BTN_LEFT>;
>  		wakeup-source;
>  	};
>  };
> 
