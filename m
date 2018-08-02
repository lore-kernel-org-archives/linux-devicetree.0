From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add io-domain to roc-rk3328-cc
Date: Thu, 02 Aug 2018 14:54:06 +0200
Message-ID: <3471113.4LqEKgWTCV@phil>
References: <1533016762-5268-1-git-send-email-djw@t-chip.com.cn> <1533016762-5268-4-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533016762-5268-4-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn
Cc: linux-rockchip@lists.infradead.org, Wayne Chou <zxf@t-chip.com.cn>, devicetree@vger.kernel.org, David Wu <david.wu@rock-chips.com>, Liang Chen <cl@rock-chips.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rocky Hao <rocky.hao@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Joseph Chen <chenjh@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 31. Juli 2018, 07:59:21 CEST schrieb djw@t-chip.com.cn:
> From: Levin Du <djw@t-chip.com.cn>
> 
> It is necessary for the io domain setting of the SoC to match the voltage
> supplied by the regulators.
> 
> Signed-off-by: Levin Du <djw@t-chip.com.cn>

applied to my dts64 branch, possibly still for 4.19.
Other dts patches need to wait for the syscon-gpio change to land.

Thanks
Heiko
