From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v5 0/6] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Thu, 07 May 2015 13:30:25 -0700
Message-ID: <7ha8xgi10e.fsf@linaro.org>
References: <1431007225-8513-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431007225-8513-1-git-send-email-bintian.wang@huawei.com>
	(Bintian Wang's message of "Thu, 7 May 2015 22:00:19 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Bintian Wang <bintian.wang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org, pebolle@tiscali.nl, arnd@arndb.de, marc.zyngier@arm.com, xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.c
List-Id: devicetree@vger.kernel.org

Bintian Wang <bintian.wang@huawei.com> writes:

> Hi6220 is one mobile solution of Hisilicon, this patchset contains
> initial support for Hi6220 SoC and HiKey development board, which
> supports octal ARM Cortex A53 cores. Initial support is minimal and
> includes just the arch configuration, clock driver, device tree
> configuration.
>
> PSCI is enabled in device tree and there is no problem to boot all the
> octal cores, and the CPU hotplug is also working now, you can download
> and compile the latest firmware based on the following link to run this
> patch set:
> https://github.com/96boards/documentation/wiki/UEFI 

Do you have any tips for booting this using the HiSi bootloader?  It
seems that I need to add the magic hisi,boardid property for dtbTool to
work.  Could you share what that magic value is?  and maybe add it to
the wiki someplace?

Thanks,

Kevin
