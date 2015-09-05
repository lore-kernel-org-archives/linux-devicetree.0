From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 0/2] arm64: Support Hisilicon Hip05-D02 board
Date: Sat, 5 Sep 2015 10:18:54 +0100
Message-ID: <20150905101854.4f5011bb@arm.com>
References: <1441421939-6236-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441421939-6236-1-git-send-email-dingtianhong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ding Tianhong <dingtianhong@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob.herring@linaro.org, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, xuwei5@hisilicon.com, leo.yan@linaro.org, zhizhou.zh@gmail.com, linuxarm@huawei.com
List-Id: devicetree@vger.kernel.org

On Sat, 5 Sep 2015 10:58:57 +0800
Ding Tianhong <dingtianhong@huawei.com> wrote:

> Hip05-D02 Development Board is based on Cortex-A57, this patchset
> contains initial support for Hip05-D02 Soc and Board. Initial support
> is minimal and includes just the arch configuration, device tree
> configuration.
> 
> PSCI is enabled in device tree and there is no problem to boot all the
> 16 cores, and the CPU hotplug is also working now, you can download and
> compile the latest firmware based on the following link to run this
> patch set.
> 
> https://github.com/hisilicon/estuary/blob/master/README
> 
> v1->v2:
> - 1. Change the compatible name for per CPU.
>   2. Remove the GIC_CPU_MASK_SIMPLE(xx) which is not used for gicv3
>      from hip05.dtsi.

Please always indicate the version number in the email subject ("PATCH
v2" is the usual scheme). It makes it otherwise difficult to keep track
of what version I am looking at.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
