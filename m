From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 4/6] clk: hi6220: Clock driver support for Hisilicon hi6220 SoC
Date: Mon, 13 Apr 2015 15:30:23 +0200
Message-ID: <2254597.TWaxeZsKvK@wuerfel>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com> <1428916660-25910-5-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428916660-25910-5-git-send-email-bintian.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bintian Wang <bintian.wang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org, xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.com, dan.zhao@hisilicon.com, huxinwei@huawei.com, z.liuxinliang@huawei.com, heyunlei@huawe
List-Id: devicetree@vger.kernel.org

On Monday 13 April 2015 17:17:38 Bintian Wang wrote:
> +#define HI6220_CFG_CSI2PHY     8
> +#define HI6220_ISP_SCLK_GATE   9
> +#define HI6220_ISP_SCLK_GATE1  10
> +#define HI6220_ADE_CORE_GATE   11
> +#define HI6220_CODEC_VPU_GATE  12
> +#define HI6220_MED_SYSPLL      13
> +
> +/* mux clocks */
> +#define HI6220_1440_1200       20
> +#define HI6220_1000_1200       21
> +#define HI6220_1000_1440       22
> +
> +/* divider clocks */
> +#define HI6220_CODEC_JPEG      30
> +#define HI6220_ISP_SCLK_SRC    31
> +#define HI6220_ISP_SCLK1       32
> 

The numbers seem rather arbitrary, and you have both holes as well as duplicate
numbers here. I would suggest you do one of two things instead:

a) have a separate header file per clock driver and make all the
   numbers unique and consecutive within that header

b) use the same numbers as the hardware registers so you can put the
   numbers directly into the dts and don't need a header to create
   an artificial ABI between the clock driver and the boot loader.

	Arnd
