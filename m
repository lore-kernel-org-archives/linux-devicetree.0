From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v4] hwspinlock: qcom: Add support for Qualcomm HW Mutex
 block
Date: Tue, 30 Sep 2014 15:27:55 -0700
Message-ID: <20140930222754.GX28481@sonymobile.com>
References: <1412051728-3289-1-git-send-email-bjorn.andersson@sonymobile.com>
 <542B2B4A.7060002@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <542B2B4A.7060002-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Holmberg <eholmber-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Cavin, Courtney" <Courtney.Cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 30 Sep 15:14 PDT 2014, Jeffrey Hugo wrote:

> On 9/29/2014 10:35 PM, Bjorn Andersson wrote:

[..]

> > +static int qcom_hwspinlock_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *node = pdev->dev.of_node;
> > +	const struct of_device_id *match;
> > +	struct hwspinlock_device *bank;
> > +	struct hwspinlock *hwlock;
> > +	struct resource *res;
> > +	void __iomem *iobase;
> > +	unsigned stride, i;
> > +	size_t array_size;
> > +	u32 num_locks;
> > +	int ret;
> > +
> > +	match = of_match_device(qcom_hwspinlock_of_match, &pdev->dev);
> Didn't this have error handling in v2?

It did, but as this is a platform_device and we only support DTthere is no way
match will be NULL if we end up here. So the possible check would be to see
that data is non-null, but for this driver that wouldn't make sense.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
