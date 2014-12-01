From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 0/2] rockchip: efuse: add driver to support rk3288 efuse
Date: Mon, 1 Dec 2014 21:26:21 +0100 (CET)
Message-ID: <798888970.2970.1417465581078.JavaMail.open-xchange@oxbaltgw06.schlund.de>
References: <1417419281-9243-1-git-send-email-jay.xu@rock-chips.com>
Reply-To: Stefan Wahren <stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417419281-9243-1-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@arm.linux.org.uk, robh+dt@kernel.org, Jianqun Xu <jay.xu@rock-chips.com>, heiko@sntech.de, grant.likely@linaro.org
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jianqun,

> Jianqun Xu <jay.xu@rock-chips.com> hat am 1. Dezember 2014 um 08:34
> geschrieben:
>
>
> In RK3288, there are two eFuse. One is organized as 32bits by 8 one-time
> programmable electrical fuses with random access interface, and the other
> is organized as 32bits by 32 one-time programmable electrical fuses.
>
> Jianqun Xu (2):
> rockchip: efuse: add documentation for rk3288 efuse driver
> rockchip: efuse: add efuse driver for rk3288 efuse
>
> .../bindings/fuse/rockchip,rk3288-efuse.txt | 14 ++
> arch/arm/mach-rockchip/efuse.c | 165 +++++++++++++++++++++
> arch/arm/mach-rockchip/efuse.h | 15 ++

is it possible that you forgot Kconfig and Makefile?

Stefan
