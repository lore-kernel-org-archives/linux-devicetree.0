From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v9 0/6] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Mon, 01 Jun 2015 17:14:21 -0700
Message-ID: <7hd21fc6g2.fsf@deeprootsystems.com>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com>
	(Bintian Wang's message of "Sat, 30 May 2015 09:50:55 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Bintian Wang <bintian.wang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org, pebolle@tiscali.nl, arnd@arndb.de, marc.zyngier@arm.com, xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.c
List-Id: devicetree@vger.kernel.org

Bintian Wang <bintian.wang@huawei.com> writes:

> Hi6220 is one mobile solution of Hisilicon, this patchset contains
> initial support for Hi6220 SoC and HiKey development board, which
> supports octal ARM Cortex A53 cores. Initial support is minimal and
> includes just the arch configuration, device tree configuration, the
> clock driver has been picked up by clock maintainers in clk tree.
>
> PSCI is enabled in device tree and there is no problem to boot all the
> octal cores, and the CPU hotplug is also working now, you can download
> and compile the latest firmware based on the following link to run this
> patch set:
> https://github.com/96boards/documentation/wiki/UEFI
>
> Chnages v9:
> * Rebase to linus/master 4.1-rc1
> * Remove the clock driver from this version because the clock maintainers
>   have queued up the clock driver:
>   git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next-hi6220
> * This version also includes clock header file:
>   [PATCH v9 6/6] dt-bindings: Add header file of hi6220 clock driver
>   Although above patch is included in clock driver, I add to this series
>   because the device tree file includes it, there will be compile error
>   without it.
>   At last, we just need to keep one when merged together.

I know I already gave my tested-by on v8, but FYI, I also tested this
series on v4.1-rc1 merged with the clk-next-hi6220 branch currently in
the clk-next tree, and it's booting all 8 cores.

Next step: collect acks from DT maintainers for the bindings.

Kevin
