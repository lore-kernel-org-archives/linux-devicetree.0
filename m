From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: correct voltage selector Firefly-RK3399
Date: Wed, 20 Jun 2018 01:21:31 +0200
Message-ID: <10782218.jfpm9omiT7@phil>
References: <20180604171523.28454-1-xypron.glpk@gmx.de> <19360053.2ABrQ075F2@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <19360053.2ABrQ075F2@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Vagrant Cascadian <vagrant@debian.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Pierre-Hugues Husson <phh@phh.me>, Jianqun Xu <jay.xu@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Heinrich,

Am Donnerstag, 14. Juni 2018, 14:55:27 CEST schrieb Heiko Stuebner:
> Am Montag, 4. Juni 2018, 19:15:23 CEST schrieb Heinrich Schuchardt:
> > Without this patch the Firefly-RK3399 board boot process hangs after these
> > lines:
> > 
> >    fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
> >    fan53555-reg: supplied by vcc_sys
> >    vcc1v8_s3: supplied by vcc_1v8
> > 
> > Blacklisting driver fan53555 allows booting.
> > 
> > The device tree uses a value of fcs,suspend-voltage-selector different to
> > any other board.
> > 
> > Changing this setting to the usual value is sufficient to enable booting.
> > 
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> 
> applied for 4.19.

and dropped again.

Sadly it looks like the patch causes conflicts with at least one firefly
board in a kernelci lab. My own is currently not ready to use, so I cannot
look myself right now.

The issue kernelci people described sounded quite a lot like the one
in your commit message, so my current theory is that the
suspend-voltage-selector must in some form corespond to the
cpu_b_sleep_h gpio setting we're currently not handling at all, which
would therefore depend on how the bootloader sets this up.


Heiko
