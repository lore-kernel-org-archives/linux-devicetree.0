From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: add sdmmc UHS support for roc-rk3328-cc
Date: Sat, 04 Aug 2018 15:18:32 +0200
Message-ID: <3379811.jaOMd9KUxU@phil>
References: <1533016762-5268-1-git-send-email-djw@t-chip.com.cn> <1533016762-5268-5-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533016762-5268-5-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn
Cc: linux-rockchip@lists.infradead.org, Wayne Chou <zxf@t-chip.com.cn>, devicetree@vger.kernel.org, David Wu <david.wu@rock-chips.com>, Liang Chen <cl@rock-chips.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rocky Hao <rocky.hao@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Joseph Chen <chenjh@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Levin,

Am Dienstag, 31. Juli 2018, 07:59:22 CEST schrieb djw@t-chip.com.cn:
> From: Levin Du <djw@t-chip.com.cn>
> 
> In roc-rk3328-cc board, the signal voltage of sdmmc is supplied by the
> vcc_sdio regulator, which is a mux between 1.8V and 3.3V, controlled by
> a special output only gpio pin labeled "gpiomut_pmuio_iout",
> corresponding bit 1 of the syscon GRF_SOC_CON10.
> 
> This special pin can now be reference as <&grf_gpio 0>, thanks to the
> gpio-syscon driver, which makes writing regulator-gpio possible.
> 
> If the signal voltage changes, the io domain needs to change
> correspondingly.
> 
> To use this feature, the following options are required in kernel config:
>  - CONFIG_GPIO_SYSCON=y
>  - CONFIG_POWER_AVS=y
>  - CONFIG_ROCKCHIP_IODOMAIN=y
> 
> Signed-off-by: Levin Du <djw@t-chip.com.cn>

[...]

> @@ -277,3 +295,7 @@
>  &usb_host0_ohci {
>  	status = "okay";
>  };
> +
> +&grf_gpio {
> +	status = "okay";
> +};
> 

applied to my dts64 branch after dropping the grf_gpio enablement,
see comment in patch2 regarding the always present pin.


Thanks
Heiko
