From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: corrected uart1 clock-names for rk3328
Date: Fri, 06 Jul 2018 10:52:33 +0200
Message-ID: <4047306.zuHpop0b3Q@phil>
References: <1530864237-14891-1-git-send-email-huibin.hong@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530864237-14891-1-git-send-email-huibin.hong@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Huibin Hong <huibin.hong@rock-chips.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, sugar.zhang@rock-chips.com, david.wu@rock-chips.com, finley.xiao@rock-chips.com, robin.murphy@arm.com, william.wu@rock-chips.com, rocky.hao@rock-chips.com, klaus.goger@theobroma-systems.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Huibin,

Am Freitag, 6. Juli 2018, 10:03:57 CEST schrieb Huibin Hong:
> Corrected the uart clock-names or the uart driver might fail.
> 
> Signed-off-by: Huibin Hong <huibin.hong@rock-chips.com>

thanks for catching that issue. I've added a Fixes-tag and a stable-cc
and applied the patch for 4.19


Thanks
Heiko
