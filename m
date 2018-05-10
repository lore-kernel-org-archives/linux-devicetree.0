From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v1 3/5] arm64: dts: rockchip: Add gpio-syscon10 to rk3328
Date: Thu, 10 May 2018 13:50:47 +0100
Message-ID: <76f2bbde-e158-a186-f136-9fb610a810c5@arm.com>
References: <1525943800-14095-1-git-send-email-djw@t-chip.com.cn>
 <1525943800-14095-4-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525943800-14095-4-git-send-email-djw@t-chip.com.cn>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn, linux-rockchip@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Sugar Zhang <sugar.zhang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Finley Xiao <finley.xiao@rock-chips.com>, David Wu <david.wu@rock-chips.com>, William Wu <william.wu@rock-chips.com>, Rocky Hao <rocky.hao@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10/05/18 10:16, djw@t-chip.com.cn wrote:
> From: Levin Du <djw@t-chip.com.cn>
> 
> Adding a new gpio controller named "gpio-syscon10" to rk3328, providing
> access to the pins defined in the syscon GRF_SOC_CON10.

This is the GPIO_MUTE pin, right? The public TRM is rather vague, but 
cross-referencing against the datasheet and schematics implies that it's 
the "gpiomut_*" part of the GRF bit names which is most significant.

It might be worth using a more descriptive name here, since "syscon10" 
is pretty much meaningless at the board level.

Robin.

> Boards using these special pins to control regulators or LEDs, can now
> utilize existing drivers like gpio-regulator and leds-gpio.
> 
> Signed-off-by: Levin Du <djw@t-chip.com.cn>
> 
> ---
> 
> Changes in v1:
> - Split from V0 and add to rk3328.dtsi for general use.
> 
>   arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index b8e9da1..73a822d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -309,6 +309,12 @@
>   			mode-loader = <BOOT_BL_DOWNLOAD>;
>   		};
>   
> +		gpio_syscon10: gpio-syscon10 {
> +			compatible = "rockchip,gpio-syscon";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio,syscon-dev = <0 0x0428 0>;
> +		};
>   	};
>   
>   	uart0: serial@ff110000 {
> 
