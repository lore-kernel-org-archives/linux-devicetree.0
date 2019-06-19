Return-Path: <SRS0=RfLZ=US=huawei.com=xuwei5@kernel.org>
Subject: Re: [PATCH v2 07/11] arm64: dts: hi6220: Update coresight DT bindings
References: <20190508021902.10358-1-leo.yan@linaro.org>
 <20190508021902.10358-8-leo.yan@linaro.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <bab80295-7c83-3a3f-cb76-aa64fb93a5e7@hisilicon.com>
Date: Wed, 19 Jun 2019 17:11:59 +0100
MIME-Version: 1.0
In-Reply-To: <20190508021902.10358-8-leo.yan@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Mark Rutland  <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mathieu Poirier" <mathieu.poirier@linaro.org>, Mike Leach <mike.leach@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Guodong Xu <guodong.xu@linaro.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi Leo,

On 5/8/2019 3:18 AM, Leo Yan wrote:
> CoreSight DT bindings have been updated, thus the old compatible strings
> are obsolete and the drivers will report warning if DTS uses these
> obsolete strings.
> 
> This patch switches to the new bindings for CoreSight dynamic funnel and
> static replicator, so can dismiss warning during initialisation.
> 
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Guodong Xu <guodong.xu@linaro.org>
> Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Applied to the hisilicon dt tree.
Thanks!

Best Regards,
Wei
