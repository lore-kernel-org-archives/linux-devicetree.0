From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 3/3] Add dts node for smmu on hi6220 SoC
Date: Tue, 20 Oct 2015 11:00:06 +0200
Message-ID: <39316856.jTQkIxu0yn@wuerfel>
References: <1445330724-129401-1-git-send-email-puck.chen@hisilicon.com> <1445330724-129401-3-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445330724-129401-3-git-send-email-puck.chen@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Feng <puck.chen@hisilicon.com>
Cc: yudongbin@hisilicon.com, saberlily.xia@hisilicon.com, suzhuangluan@hisilicon.com, kong.kongxinwei@hisilicon.com, xuyiping@hisilicon.com, z.liuxinliang@hisilicon.com, puck.chen@aliyun.com, weidong2@hisilicon.com, w.f@huawei.com, joro@8bytes.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, xuwei5@hisilicon.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, qijiwen@hisilicon.com, peter.panshilin@hisilicon.com, dan.zhao@hisilicon.com, linuxarm@huawei.com
List-Id: devicetree@vger.kernel.org

On Tuesday 20 October 2015 16:45:24 Chen Feng wrote:
> +
> +               smmu@f4210000 {

I think the canonical name for an IOMMU device is 'iommu', not 'smmu'.

> +                       compatible = "hisilicon,hi6220-smmu";
> +                       reg = <0x0 0xf4210000 0x0 0x1000>;
> +                       interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sys_ctrl HI6220_MMU_CLK>,
> +                                <&media_ctrl HI6220_MED_MMU>,
> +                                <&sys_ctrl HI6220_MEDIA_PLL_SRC>;
> +                       clock-names = "smmu_clk",
> +                                     "media_sc_clk",
> +                                     "smmu_peri_clk";


Better avoid underscores in strings, and drop the "_clk" postfix in
the clock names.

I did not receive patch 1/3 this time, but I see in version 1, that
you forgot to document the strings:

> +- clock-names: The name to enable clock with clock framework.

This needs to list the names of the clock inputs to the smmu.

	Arnd
