From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v2 04/11] ARM: dts: ste: Update coresight DT bindings
Date: Thu, 16 May 2019 21:21:56 +0800
Message-ID: <20190516132156.GF12557@leoy-ThinkPad-X240s>
References: <20190508021902.10358-1-leo.yan@linaro.org>
 <20190508021902.10358-5-leo.yan@linaro.org>
 <CACRpkda4aEfgW6e7EfqC=FE_=QzKi5UTDLLzHEryQ6kpcKYzVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda4aEfgW6e7EfqC=FE_=QzKi5UTDLLzHEryQ6kpcKYzVg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Mike Leach <mike.leach@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Linux ARM <linux-arm-kernel@lists>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Thu, May 16, 2019 at 02:53:48PM +0200, Linus Walleij wrote:
> On Wed, May 8, 2019 at 4:20 AM Leo Yan <leo.yan@linaro.org> wrote:
> 
> > CoreSight DT bindings have been updated, thus the old compatible strings
> > are obsolete and the drivers will report warning if DTS uses these
> > obsolete strings.
> >
> > This patch switches to the new bindings for CoreSight dynamic funnel and
> > static replicator, so can dismiss warning during initialisation.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Will I need to carry this patch or will you send it to ARM SoC?

Please pick this patch into your tree and I will monitor rest
patches with other maintainers.  Thanks a lot!

Thanks,
Leo Yan
