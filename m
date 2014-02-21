From: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [Patch v6 2/2] dmaengine: add Qualcomm BAM dma driver
Date: Fri, 21 Feb 2014 11:22:06 -0600
Message-ID: <20140221172206.GB3102@qualcomm.com>
References: <1392964986-5207-1-git-send-email-agross@codeaurora.org>
 <1392964986-5207-3-git-send-email-agross@codeaurora.org>
 <20140221093352.GE7541@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140221093352.GE7541-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 21, 2014 at 09:33:52AM +0000, Mark Rutland wrote:
> On Fri, Feb 21, 2014 at 06:43:05AM +0000, Andy Gross wrote:

[snip]
> > +       bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
> 
> The binding document should describe the "bam_clk" string in the
> clock-names description.
> 

OK.

> > +       ret = of_property_read_u32(pdev->dev.of_node, "qcom,ee", &bdev->ee);
> > +       if (ret) {
> > +               dev_err(bdev->dev, "EE unspecified\n");
> 
> It would be nice to expand EE to what it stands for, at least in the
> error but possibly the binding too.

I can expand it to execution environment.  This is a trustzone thing and is
required from a security perspective.

> > +static const struct of_device_id bam_of_match[] = {
> > +       { .compatible = "qcom,bam-v1.4.0", },
> > +       { .compatible = "qcom,bam-v1.4.1", },
> 
> What are the differences between the two?
> 
> Is v1.4.1 an extension of v1.4.0?

On second look, the 1.4.1 has hardware fixes.  So the software API is the same.
I thought there were some configuration changes, but that isn't the case.

> Could you have the following in DTs:
> 
>   compatible = "qcom,bam-v1.4.1", "qcom,bam-v1.4.0";
> 
> Then you'd only need the v1.4.0 string in the driver for now.

Good point.  That's easy to change.

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
