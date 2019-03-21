From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v2 2/3] coresight: funnel: Support static funnel
Date: Thu, 21 Mar 2019 10:09:22 +0800
Message-ID: <20190321020922.GA5571@leoy-ThinkPad-X240s>
References: <1553085490-42870-1-git-send-email-shiwanglai@hisilicon.com>
 <1553085490-42870-3-git-send-email-shiwanglai@hisilicon.com>
 <ecfa879e-9fd9-0815-d2da-bb9870d6ae59@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ecfa879e-9fd9-0815-d2da-bb9870d6ae59@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: shiwanglai@hisilicon.com, mathieu.poirier@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, alexander.shishkin@linux.intel.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, suzhuangluan@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On Wed, Mar 20, 2019 at 01:52:58PM +0000, Suzuki K Poulose wrote:
> 
> 
> On 20/03/2019 12:38, Wanglai Shi wrote:
> > From: Leo Yan <leo.yan@linaro.org>
> > 
> > Since CoreSight hardware topology can use a 'hidden' funnel in the
> > trace data path, this kind funnel doesn't have register for accessing
> > and is used by default from hardware design perspective.  Below is an
> > example for related hardware topology:
> > 
> >    +------+  +------+
> >    | cpu0 |->| ETM  |-\
> >    +------+  +------+  \-> +--------+  +-----+
> >     ......                 | Funnel |->| ETF |-\    Hidden funnel
> >    +------+  +------+  /-> +--------+  +-----+  \        |
> >    | cpu3 |->| ETM  |-/                          \       V
> >    +------+  +------+                             \-> +--------+
> >                                                       | Funnel |-> ...
> >    +------+  +------+                             /-> +--------+
> >    | cpu4 |->| ETM  |-\                          /
> >    +------+  +------+  \-> +--------+  +-----+  /
> >     ......                 | Funnel |->| ETF |-/
> >    +------+  +------+  /-> +--------+  +-----+
> >    | cpu7 |->| ETM  |-/
> >    +------+  +------+
> > 
> > The CoreSight funnel driver only supports dynamic funnel with
> > registration register resource, thus it cannot support for the static
> > funnel case and it's impossible to create trace data path for this case.
> > 
> > This patch is to extend CoreSight funnel driver to support both for
> > static funnel and dynamic funnel.  For the dynamic funnel it reuses the
> > code existed in the driver, for static funnel the driver will support
> > device probe if without providing register resource and the driver skips
> > registers accessing when detect the register base is NULL.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Will add the tag in next version, and very appreciate you shared me
offline the replicator code for reference!

> > -static const struct amba_id funnel_ids[] = {
> > +static int static_funnel_probe(struct platform_device *pdev)
> > +{
> > +	int ret;
> > +
> > +	pm_runtime_get_noresume(&pdev->dev);
> > +	pm_runtime_set_active(&pdev->dev);
> > +	pm_runtime_enable(&pdev->dev);
> > +
> > +	/* Static funnel do not have programming base */
> > +	ret = funnel_probe(&pdev->dev, NULL);
> > +
> > +	if (ret) {
> > +		pm_runtime_put_noidle(&pdev->dev);
> > +		pm_runtime_disable(&pdev->dev);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct of_device_id static_funnel_match[] = {
> > +	{.compatible = "arm,coresight-funnel"},
> 
> There is a potential issue with re-using the "compatible" string
> already reserved for the normal programmable funnel. We may handle
> a programmable funnel as non-programmable one, which is not good.
> 
> Do we need to use "arm,coresight-static-funnel" ?

This suggestion makes sense, will do this.

> Otherwise, looks good to me.

Thanks for reviewing.

Thanks,
Leo Yan
