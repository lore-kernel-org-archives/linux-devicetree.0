From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 5/8] coresight: use const for device_node structures
Date: Wed, 19 Apr 2017 07:13:27 +0800
Message-ID: <20170418231327.GA8524@leoy-linaro>
References: <1491485461-22800-1-git-send-email-leo.yan@linaro.org>
 <1491485461-22800-6-git-send-email-leo.yan@linaro.org>
 <20170418152447.GB22806@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170418152447.GB22806-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mathieu,

On Tue, Apr 18, 2017 at 09:24:47AM -0600, Mathieu Poirier wrote:
> On Thu, Apr 06, 2017 at 09:30:58PM +0800, Leo Yan wrote:
> > Almost low level functions from open firmware have used const to
> > qualify device_node structures, so add const for device_node
> > parameters in of_coresight related functions.
> > 
> > Reviewed-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> I agree with these changes but the patch needs to be split up - please see
> below.
> 
> > ---
> >  drivers/hwtracing/coresight/of_coresight.c | 6 +++---
> >  include/linux/coresight.h                  | 8 ++++----
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
> > index 78d2399..46eec0f 100644
> > --- a/drivers/hwtracing/coresight/of_coresight.c
> > +++ b/drivers/hwtracing/coresight/of_coresight.c
> > @@ -52,7 +52,7 @@ of_coresight_get_endpoint_device(struct device_node *endpoint)
> >  			       endpoint, of_dev_node_match);
> >  }
> >  
> > -static void of_coresight_get_ports(struct device_node *node,
> > +static void of_coresight_get_ports(const struct device_node *node,
> >  				   int *nr_inport, int *nr_outport)
> 
> Move this to a patch by itself as it is not related to this driver.
> 
> >  {
> >  	struct device_node *ep = NULL;
> > @@ -101,7 +101,7 @@ static int of_coresight_alloc_memory(struct device *dev,
> >  	return 0;
> >  }
> >  
> > -int of_coresight_get_cpu(struct device_node *node)
> > +int of_coresight_get_cpu(const struct device_node *node)
> 
> Move this to the previous patch in this set.  There is not need to undo what you
> just did there.
> 
> >  {
> >  	int cpu;
> >  	bool found;
> > @@ -128,7 +128,7 @@ int of_coresight_get_cpu(struct device_node *node)
> >  EXPORT_SYMBOL_GPL(of_coresight_get_cpu);
> >  
> >  struct coresight_platform_data *of_get_coresight_platform_data(
> > -				struct device *dev, struct device_node *node)
> > +			struct device *dev, const struct device_node *node)
> 
> Same here, move this to a new patch (the same one as of_coresight_get_ports()).

Yeah, this is better than my form. Will change.

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
