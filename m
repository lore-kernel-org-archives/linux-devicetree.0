From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v2 00/11] dts: Update DT bindings for CoreSight
 replicator and funnel
Date: Wed, 29 May 2019 18:14:45 +0800
Message-ID: <20190529101445.GC15808@leoy-ThinkPad-X240s>
References: <20190508021902.10358-1-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508021902.10358-1-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Mike Leach <mike.leach@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gma>
Cc: Guodong Xu <guodong.xu@linaro.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee.jones@linaro.org>, Chunyan Zhang <zhang.chunyan@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 10:18:51AM +0800, Leo Yan wrote:
> Since the DT bindings consolidatoins for CoreSight replicator and funnel
> is ready for kernel v5.2 merge window [1], this patch set is to update
> the related CoreSight DT bindings for platforms; IIUC, this patch set
> will be safe for merging into kernel v5.2 because the dependency
> patches in [1] will be landed into mainline kernel v5.2 cycle.

[...]

> Leo Yan (11):
>   ARM: dts: hip04: Update coresight DT bindings
>   ARM: dts: imx7s: Update coresight DT bindings
>   ARM: dts: qcom-apq8064: Update coresight DT bindings
>   ARM: dts: ste: Update coresight DT bindings
>   ARM: dts: vexpress-v2p-ca15_a7: Update coresight DT bindings
>   ARM: dts: qcom-msm8974: Update coresight DT bindings
>   arm64: dts: hi6220: Update coresight DT bindings
>   arm64: dts: juno: Update coresight DT bindings
>   arm64: dts: qcom-msm8916: Update coresight DT bindings
>   arm64: dts: sc9836: Update coresight DT bindings
>   arm64: dts: sc9860: Update coresight DT bindings

Gentle ping for maintainers.

Hi Andy, David,

Could you pick up patches 03, 06, 09/11 for QCOM DT bindings?

Hi Sudeep,

Could you pick up patches 05, 08/11 for Arm DT bindings?

Hi Chunyan, Orson, Baolin,

Could you pick up patches 10, 11/11 for Unisoc DT bindings?

Thanks a lot for Shawn and Linus have picked up 02, 04/11 separately.

Thanks,
Leo Yan
