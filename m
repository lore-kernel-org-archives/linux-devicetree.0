From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: correct voltage selector Firefly-RK3399
Date: Thu, 14 Jun 2018 14:55:27 +0200
Message-ID: <19360053.2ABrQ075F2@phil>
References: <20180604171523.28454-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180604171523.28454-1-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Vagrant Cascadian <vagrant@debian.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Pierre-Hugues Husson <phh@phh.me>, Jianqun Xu <jay.xu@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, 4. Juni 2018, 19:15:23 CEST schrieb Heinrich Schuchardt:
> Without this patch the Firefly-RK3399 board boot process hangs after these
> lines:
> 
>    fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
>    fan53555-reg: supplied by vcc_sys
>    vcc1v8_s3: supplied by vcc_1v8
> 
> Blacklisting driver fan53555 allows booting.
> 
> The device tree uses a value of fcs,suspend-voltage-selector different to
> any other board.
> 
> Changing this setting to the usual value is sufficient to enable booting.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

applied for 4.19.

I've amended your commit message with the info from your reply about
the vendor kernel using the same value and added an appropriate Fixes
tag to possibly get it merged into stable.


Thanks
Heiko
