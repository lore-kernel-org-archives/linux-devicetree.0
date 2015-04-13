From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 3/6] clk: hi6220: Document devicetree bindings for hi6220 clock
Date: Mon, 13 Apr 2015 17:32:35 +0200
Message-ID: <7304398.GVjUsTVoce@wuerfel>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com> <1428916660-25910-4-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428916660-25910-4-git-send-email-bintian.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bintian Wang <bintian.wang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org, xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.com, dan.zhao@hisilicon.com, huxinwei@huawei.com, z.liuxinliang@huawei.com, heyunlei@huawe
List-Id: devicetree@vger.kernel.org

On Monday 13 April 2015 17:17:37 Bintian Wang wrote:
> +- compatible: the compatible should be one of the following strings to
> +       indicate the clock controller functionality.
> +
> +       - "hisilicon,aoctrl"
> +       - "hisilicon,sysctrl"
> +       - "hisilicon,mediactrl"
> +       - "hisilicon,pmctrl"
> +
> 

These ones already have bindings, you can't reuse the strings.
Please work with someone in hisilicon to set up a registry of
device names so you can avoid conflicts in the future.

	Arnd
