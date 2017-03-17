From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: add i2s nodes support for RK3368 SoCs
Date: Fri, 17 Mar 2017 12:12:14 +0100
Message-ID: <1768708.lMtUnYkT1T@phil>
References: <1489721564-32203-1-git-send-email-jay.xu@rock-chips.com> <1489721564-32203-3-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489721564-32203-3-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianqun Xu <jay.xu@rock-chips.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 17. März 2017, 11:32:43 CET schrieb Jianqun Xu:
> I2S of RK3368 SoCs keep same as RK3066 SoCs found on Rockchip,
> add nodes to support them.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

applied for 4.12 after moving the clocks property above "dma*"


Thanks
Heiko
