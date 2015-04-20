From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v2 1/6] arm64: Enable Hisilicon ARMv8 SoC family in Kconfig and defconfig
Date: Mon, 20 Apr 2015 14:10:22 -0700
Message-ID: <7hvbgqfqv5.fsf@deeprootsystems.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com>
	<1428916660-25910-2-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428916660-25910-2-git-send-email-bintian.wang@huawei.com>
	(Bintian Wang's message of "Mon, 13 Apr 2015 17:17:35 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Bintian Wang <bintian.wang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org, xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.com, dan.zhao@hisilicon.com, huxinwei@huawei.
List-Id: devicetree@vger.kernel.org

Bintian Wang <bintian.wang@huawei.com> writes:

> This patch introduces ARCH_HISI to enable Hisilicon SoC family in
> Kconfig and defconfig.
>
> Signed-off-by: Bintian Wang <bintian.wang@huawei.com>
> Reviewed-by: Haojian Zhuang <haojian.zhuang@linaro.org>
> Reviewed-by: Wei Xu <xuwei5@hisilicon.com>

[...]

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index be1f12a..36ebd9b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -36,6 +36,7 @@ CONFIG_ARCH_MEDIATEK=y
>  CONFIG_ARCH_THUNDER=y
>  CONFIG_ARCH_VEXPRESS=y
>  CONFIG_ARCH_XGENE=y
> +CONFIG_ARCH_HISI=y

nit: please keep CONFIG_ARCH_* sorted alphabetically.

Thanks,

Kevin
