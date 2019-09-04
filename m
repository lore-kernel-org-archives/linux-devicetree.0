From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] venus: use on-chip interconnect API
Date: Tue, 3 Sep 2019 21:22:03 -0700
Message-ID: <20190904042203.GC3081@tuxbook-pro>
References: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
 <20190814084701.25455-2-stanimir.varbanov@linaro.org>
 <cc85f55c-3d21-c3b2-6848-e48513263e39@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cc85f55c-3d21-c3b2-6848-e48513263e39@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Vikash Garodia <vgarodia@codeaurora.org>, Andy Gross <agross@kernel.org>, Aniket Masule <amasule@codeaurora.org>, Linux PM list <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 20 Aug 02:34 PDT 2019, Georgi Djakov wrote:

> Hi Stan,
> 
> On 8/14/19 11:47, Stanimir Varbanov wrote:
> > This aims to add a requests for bandwidth scaling depending
> > on the resolution and framerate (macroblocks per second). The
> > exact value ff the requested bandwidth is get from a
> 
> s/ff/of/
> 
> > pre-calculated tables for encoder and decoder.
> > 
> > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
> >  drivers/media/platform/qcom/venus/core.h    | 14 +++++
> >  drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
> >  3 files changed, 114 insertions(+), 1 deletion(-)
> 
> It looks like venus can be built-in, so how about the case when venus is
> built-in and the interconnect provider is a module? Maybe add a dependency in
> Kconfig to depend on INTERCONNECT || !INTERCONNECT?
> 

I've been struggling down this road for remoteproc et al for a long
time, I strongly suggest that you make the INTERCONNECT config bool, to
ensure that we don't see this problem for every client.

The interconnect framework should hide the fact that the provider is
module.


But with this in place is there actually a dependency? Won't the include
file provide stubs in the case of !INTERCONNECT?

Regards,
Bjorn

> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 0acc7576cc58..19cbe9d5d028 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -5,6 +5,7 @@
> >   */
> >  #include <linux/clk.h>
> >  #include <linux/init.h>
> > +#include <linux/interconnect.h>
> >  #include <linux/ioctl.h>
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> > @@ -239,6 +240,14 @@ static int venus_probe(struct platform_device *pdev)
> >  	if (IS_ERR(core->base))
> >  		return PTR_ERR(core->base);
> >  
> > +	core->video_path = of_icc_get(dev, "video-mem");
> > +	if (IS_ERR(core->video_path))
> > +		return PTR_ERR(core->video_path);
> > +
> > +	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
> > +	if (IS_ERR(core->cpucfg_path))
> > +		return PTR_ERR(core->cpucfg_path);
> > +
> >  	core->irq = platform_get_irq(pdev, 0);
> >  	if (core->irq < 0)
> >  		return core->irq;
> > @@ -273,6 +282,10 @@ static int venus_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = hfi_create(core, &venus_core_ops);
> >  	if (ret)
> >  		return ret;
> > @@ -355,6 +368,9 @@ static int venus_remove(struct platform_device *pdev)
> >  	pm_runtime_put_sync(dev);
> >  	pm_runtime_disable(dev);
> >  
> > +	icc_put(core->video_path);
> > +	icc_put(core->cpucfg_path);
> > +
> 
> Do you have any plans to scale the bandwidth on suspend/resume too?
> 
> Thanks,
> Georgi
