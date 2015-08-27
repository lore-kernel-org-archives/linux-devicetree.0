From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: chipidea: add xilinx zynq platform data
Date: Thu, 27 Aug 2015 12:33:40 +0800
Message-ID: <20150827043339.GA29157@shlinux2>
References: <1440602865-30468-1-git-send-email-nathan.sullivan@ni.com>
 <CALHRZuqFtaRFNd9D=a+x2rZ2848ZOGYbTkSWCHxNPcW_NvocxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALHRZuqFtaRFNd9D=a+x2rZ2848ZOGYbTkSWCHxNPcW_NvocxA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sundeep subbaraya <sundeep.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 27, 2015 at 10:59:22AM +0530, sundeep subbaraya wrote:
> Hi,
> 
> 
> On Wed, Aug 26, 2015 at 8:57 PM, Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org> wrote:
> > The Xilinx Zynq udc does not need the CI_HDRC_DISABLE_STREAMING flag,
> > unlike the default platform data.  Add platform data specific to the
> > Zynq udc.
> >
> > Based on a patch by the same name from the Xilinx vendor tree.
> 
> I am that Xilinx guy who sent this patch :). It is in Xilinx tree as
> temporary fix and
> I did not debug further why UDC works only when streaming is enabled.
> Probably this is right time to post my question here.
> I was expecting like:
> Streaming disabled - both low bandwidth and high bandwidth systems
> should work fine
> Streaming enabled - only for high bandwidth systems
> but this is not the case, Zynq UDC works only when Streaming is enabled.
> Please correct me if I am wrong.

You are right, stream mode disabled should work at anytime.
It is so strange why zynq UDC only works when stream mode is enabled.

Peter
> 
> Thanks,
> Sundeep
> 
> >
> > Signed-off-by: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_usb2.c |   25 +++++++++++++++++++------
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
> > index 9eae1a1..4456d2c 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/dma-mapping.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/usb/chipidea.h>
> > @@ -30,18 +31,36 @@ static const struct ci_hdrc_platform_data ci_default_pdata = {
> >         .flags          = CI_HDRC_DISABLE_STREAMING,
> >  };
> >
> > +static struct ci_hdrc_platform_data ci_zynq_pdata = {
> > +       .capoffset      = DEF_CAPOFFSET,
> > +};
> > +
> > +static const struct of_device_id ci_hdrc_usb2_of_match[] = {
> > +       { .compatible = "chipidea,usb2"},
> > +       { .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata},
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
> > +
> >  static int ci_hdrc_usb2_probe(struct platform_device *pdev)
> >  {
> >         struct device *dev = &pdev->dev;
> >         struct ci_hdrc_usb2_priv *priv;
> >         struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
> >         int ret;
> > +       const struct of_device_id *match;
> >
> >         if (!ci_pdata) {
> >                 ci_pdata = devm_kmalloc(dev, sizeof(*ci_pdata), GFP_KERNEL);
> >                 *ci_pdata = ci_default_pdata;   /* struct copy */
> >         }
> >
> > +       match = of_match_device(ci_hdrc_usb2_of_match, &pdev->dev);
> > +       if (match && match->data) {
> > +               /* struct copy */
> > +               *ci_pdata = *(struct ci_hdrc_platform_data *)match->data;
> > +       }
> > +
> >         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >         if (!priv)
> >                 return -ENOMEM;
> > @@ -96,12 +115,6 @@ static int ci_hdrc_usb2_remove(struct platform_device *pdev)
> >         return 0;
> >  }
> >
> > -static const struct of_device_id ci_hdrc_usb2_of_match[] = {
> > -       { .compatible = "chipidea,usb2" },
> > -       { }
> > -};
> > -MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
> > -
> >  static struct platform_driver ci_hdrc_usb2_driver = {
> >         .probe  = ci_hdrc_usb2_probe,
> >         .remove = ci_hdrc_usb2_remove,
> > --
> > 1.7.10.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
