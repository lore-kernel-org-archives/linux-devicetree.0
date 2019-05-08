From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v2 00/11] dts: Update DT bindings for CoreSight
 replicator and funnel
Date: Thu, 9 May 2019 07:17:06 +0800
Message-ID: <20190508231706.GA5840@leoy-ThinkPad-X240s>
References: <20190508021902.10358-1-leo.yan@linaro.org>
 <9c56323b-7b14-c662-b824-ed60fbb1638f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9c56323b-7b14-c662-b824-ed60fbb1638f@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mathieu.poirier@linaro.org, mike.leach@linaro.org, xuwei5@hisilicon.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org, david.brown@linaro.org, linus.walleij@linaro.org, liviu.dudau@arm.com, Sudeep.Holla@arm.com, Lorenzo.Pieralisi@arm.com, orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, guodong.xu@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, cphealy@gmail.com, andrew@lunn.ch, lee.jones@linaro.org, zhang.chunyan@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 03:29:12PM +0100, Suzuki K Poulose wrote:
> 
> On 08/05/2019 03:18, Leo Yan wrote:
> > Since the DT bindings consolidatoins for CoreSight replicator and funnel
> > is ready for kernel v5.2 merge window [1], this patch set is to update
> > the related CoreSight DT bindings for platforms; IIUC, this patch set
> > will be safe for merging into kernel v5.2 because the dependency
> > patches in [1] will be landed into mainline kernel v5.2 cycle.
> > 
> > In this patch set, it tries to update below two compatible strings to
> > the latest strings:
> > 
> >    s/"arm,coresight-replicator"/"arm,coresight-static-replicator"
> >    s/"arm,coresight-funnel"/"arm,coresight-dynamic-funnel"
> > 
> > Please note, some platforms have two continuous patches, one is for
> > updating static replicator compatible string and another is for dynamic
> > funnel change; and other platforms have only one patch since it only
> > needs to change for dynamic funnel.
> 
> This is now misleading ;-), but that doesn't matter.

Oops ...

> For the entire series :
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks for reviewing!
