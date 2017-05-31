From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] firmware: qcom: scm: Expose download-mode control
Date: Wed, 31 May 2017 15:02:20 -0700
Message-ID: <20170531220220.GW12920@tuxbook>
References: <20170527063308.10483-1-bjorn.andersson@linaro.org>
 <20170527063308.10483-2-bjorn.andersson@linaro.org>
 <20170531162726.GZ20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170531162726.GZ20170-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 31 May 09:27 PDT 2017, Stephen Boyd wrote:

> On 05/26, Bjorn Andersson wrote:
> > In order to aid post-mortem debugging the Qualcomm platforms provides a
> > "memory download mode", where the boot loader will provide an interface
> > for custom tools to "download" the content of RAM to a host machine.
> > 
> > The mode is triggered by writing a magic value somehwere in RAM, that is
> > read in the boot code path after a warm-restart. Two mechanism for
> > setting this magic value are supported in modern platforms; a direct SCM
> > call to enable the mode or through a secure io write of a magic value.
> > 
> > In order for a normal reboot not to trigger "download mode" the magic
> > must be cleared during a clean reboot.
> > 
> > Download mode has to be enabled by including qcom_scm.download_mode=1 on
> > the command line.
> 
> Why the kernel command line parameter? If we keep the kernel
> command line param, perhaps we can also gain a config option to
> make it default enabled or default disabled so that we don't have
> to specify it on the commandline to get the feature all the time.
> 

I put a command line parameter there because most people will not have
the tools to catch what's given to them by this. Making it a config
option definitely makes more sense than forcing certain groups of
engineers to always slap a kernel parameter in there.

> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> > index 20f26fbce875..388817d1d00e 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> > @@ -18,6 +18,8 @@ Required properties:
> >   * Core, iface, and bus clocks required for "qcom,scm"
> >  - clock-names: Must contain "core" for the core clock, "iface" for the interface
> >    clock and "bus" for the bus clock per the requirements of the compatible.
> > +- qcom,dload-mode-addr: Specifies the address (2 cells) for the download mode
> > +			magic (optional)
> 
> Was it decided that reg was improper? Or a phandle to a node that
> has a reg property?
> 

I didn't want to slap an optional reg on the scm node, but based on the
DT comment this should be a syscon reference instead.

> >  
> >  Example for MSM8916:
> >  
> > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> > index e18d63935648..98f4747acddb 100644
> > --- a/drivers/firmware/qcom_scm.c
> > +++ b/drivers/firmware/qcom_scm.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/cpumask.h>
> >  #include <linux/export.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/module.h>
> >  #include <linux/types.h>
> >  #include <linux/qcom_scm.h>
> >  #include <linux/of.h>
> > @@ -28,6 +29,9 @@
> >  
> >  #include "qcom_scm.h"
> >  
> > +static bool download_mode;
> > +module_param(download_mode, bool, 0700);
> 
> 0700? Not 0600? And what if we have it == 1 on the command line
> and then write 0 at runtime with module param? Shouldn't we
> handle that with a callback and turn off download mode there?
> Otherwise when we reboot we will reboot into download mode?
> 

Rather than adding the extra logic I think it makes more sense to just
make perm 0, that way it's not possible to change in runtime.

> 
> > +
> >  #define SCM_HAS_CORE_CLK	BIT(0)
> >  #define SCM_HAS_IFACE_CLK	BIT(1)
> >  #define SCM_HAS_BUS_CLK		BIT(2)
> > @@ -365,6 +393,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	struct qcom_scm *scm;
> >  	unsigned long clks;
> >  	int ret;
> > +	u64 val;
> >  
> >  	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
> >  	if (!scm)
> > @@ -418,9 +447,22 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  
> >  	__qcom_scm_init();
> >  
> > +	ret = of_property_read_u64(pdev->dev.of_node, "qcom,dload-mode-addr", &val);
> > +	if (!ret)
> > +		scm->dload_mode_addr = val;
> 
> How about:
> 
> 	of_property_read_u64(pdev->dev.of_node, "qcom,dload-mode-addr",
> 			     &scm->dload_mode_addr)
> 

That looks better.

> > +
> > +	if (download_mode)
> > +		qcom_scm_set_download_mode(true);
> > +
> >  	return 0;
> >  }
> >  
> > +void qcom_scm_shutdown(struct platform_device *pdev)
> 
> static?
> 

Yes.

Thanks,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
