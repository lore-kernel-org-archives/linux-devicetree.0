From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add support for ROC-RK3399-PC
 board
Date: Tue, 31 Jul 2018 14:51:02 -0600
Message-ID: <20180731205102.GA13177@rob-hp-laptop>
References: <1532916721-24117-1-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532916721-24117-1-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn
Cc: linux-rockchip@lists.infradead.org, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jianqun Xu <jay.xu@rock-chips.com>, Jacob Chen <jacob-chen@iotwrt.com>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ezequiel Garcia <ezequiel@collabora.com>, Jagan Teki <jagan@amarulasolutions.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Shawn Lin <shawn.lin@rock-chips.com>, Matthias Brugger <mbrugger@suse.com>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infrade
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 10:12:01AM +0800, djw@t-chip.com.cn wrote:
> From: Levin Du <djw@t-chip.com.cn>
> 
> ROC-RK3399-PC is a power efficient 4GB LPDDR4 single board
> computer with USB 3.0 and Gigabit Ethernet in a form factor
> compatible with the Raspberry Pi. It is based on the Rockchip
> RK3399 SoC, powered by the Type-C port.
> 
> The devicetree currently supports peripherals of:
> 
> - Ethernet
> - HDMI
> - SD Card
> - UART2 debug
> - Type-C
> - eMMC
> 
> USB3 in Type-C port currently only works with normal orientation,
> not flip one.
> 
> Signed-off-by: Levin Du <djw@t-chip.com.cn>
> 
> ---
> 
> Changes in v2:
> - remove custom brightness-levels (use calculated one in pwm_bl driver)
> - remove redundant 'dr_mode="otg"' in usbdrd_dwc3_0
> 
> Changes in v1:
> - remove bootargs
> - use interpolation for brightness level
> - add vcc_vbus_typec1 regulator
> - fix phy-supply of u2phy0_otg and u2phy1_otg
> - remove vcc_hub_en dummy regualtor
> - add hub_rst (changed to output high) to pinctrl status of vcc5v0_host
> - remove vsel-gpios props in fan53xx
> - remove mp8859 in i2c
> - fusb302: fix interrupt setting
> - fusb302: add vbus-supply
> - remove extcon in tcphy0 and tcphy1
> - remove #sound-dai-cells in i2s*
> - use RK_PXX style bit number for cd-gpios in SDMMC
> - clean commented status lines
> 
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts     | 682 +++++++++++++++++++++
>  3 files changed, 687 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts

Reviewed-by: Rob Herring <robh@kernel.org>
