From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add support for ROC-RK3399-PC board
Date: Wed, 01 Aug 2018 13:57:12 +0200
Message-ID: <3845549.84TLR0FYli@phil>
References: <1532916721-24117-1-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532916721-24117-1-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn
Cc: linux-rockchip@lists.infradead.org, Wayne Chou <zxf@t-chip.com.cn>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jianqun Xu <jay.xu@rock-chips.com>, Jacob Chen <jacob-chen@iotwrt.com>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ezequiel Garcia <ezequiel@collabora.com>, Jagan Teki <jagan@amarulasolutions.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Shawn Lin <shawn.lin@rock-chips.com>, Matthias Brugger <mbrugger@suse.com>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infrade
List-Id: devicetree@vger.kernel.org

Am Montag, 30. Juli 2018, 04:12:01 CEST schrieb djw@t-chip.com.cn:
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

applied with Rob's review-tag.

Might still make it into 4.19 but also may have to wait for 4.20


Heiko
