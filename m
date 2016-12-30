From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/2] Use macros to describe gpios on rockchip platform
Date: Fri, 30 Dec 2016 13:31:27 +0100
Message-ID: <1558490.gPc1QP0JTO@phil>
References: <1477140706-6886-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477140706-6886-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 22. Oktober 2016, 20:51:46 CET schrieb Andy Yan:
> As patch 150696e2e3a4("Add GPIO pin index definition for rockchip pinctrl")
> has been applied, now we can use these macros to describe the corresponding
> gpio ranther than hard code numbers, this will make the dts easier to read
> and write.
> 
> Some ideas from Krzysztof's patch on EXYNOS[0].
> 
> [0]https://lkml.org/lkml/2016/9/4/71
> 
> 
> 
> Andy Yan (2):
>   ARM: dts: rockchip: use pin constants to describe gpios
>   ARM64: dts: rockchip: use pin constants to describe gpios

applied to dts branches for 4.11
I've also adapted the gpio interrupts accordingly inside the patches.


Thanks
Heiko
