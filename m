From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 2/4] arm64: dts: rockchip: add GRF GPIO controller to rk3328
Date: Sat, 04 Aug 2018 15:16:01 +0200
Message-ID: <4016409.aba6YNvtTb@phil>
References: <1533016762-5268-1-git-send-email-djw@t-chip.com.cn> <1533016762-5268-3-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533016762-5268-3-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn
Cc: linux-rockchip@lists.infradead.org, Wayne Chou <zxf@t-chip.com.cn>, Simon Xue <xxm@rock-chips.com>, David Wu <david.wu@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Rocky Hao <rocky.hao@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Levin,

Am Dienstag, 31. Juli 2018, 07:59:20 CEST schrieb djw@t-chip.com.cn:
> From: Levin Du <djw@t-chip.com.cn>
> 
> Adding a GRF GPIO controller labled "grf_gpio" to rk3328, currently
> providing access to the GPIO_MUTE pin, which is manupulated by the
> GRF_SOC_CON10 register.
> 
> The GPIO_MUTE pin is referred to as <&grf_gpio 0>.
> 
> Signed-off-by: Levin Du <djw@t-chip.com.cn>

applied to my dts64 branch, with 2 changes:
- reordered, please sort nodes without address alphabetically
- removed default disabled status
  The controlled pin is always present on the soc, so doesn't need
  to be enabled on a per-board level


Heiko
