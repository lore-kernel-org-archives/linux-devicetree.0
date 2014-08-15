From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: Deep-copy names of platform devices
Date: Fri, 15 Aug 2014 11:45:07 +0100
Message-ID: <20140815104507.E6F84C40A89@trevor.secretlab.ca>
References: <1407891444-7311-1-git-send-email-stepanm@codeaurora.org>
	<53EAC37C.4020203@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53EAC37C.4020203@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Stepan Moskovchenko <stepanm@codeaurora.org>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 12 Aug 2014 18:46:36 -0700, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 08/12/14 17:57, Stepan Moskovchenko wrote:
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index f685e55..3e116f6 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -54,7 +54,7 @@ int of_device_add(struct platform_device *ofdev)
> >
> >  	/* name and id have to be set so that the platform bus doesn't get
> >  	 * confused on matching */
> > -	ofdev->name = dev_name(&ofdev->dev);
> > +	ofdev->name = kstrdup(dev_name(&ofdev->dev), GFP_KERNEL);
> >  	ofdev->id = -1;
> >
> >  	/* device_add will assume that this device is on the same node as
> > @@ -76,6 +76,7 @@ EXPORT_SYMBOL(of_device_register);
> >  void of_device_unregister(struct platform_device *ofdev)
> >  {
> >  	device_unregister(&ofdev->dev);
> > +	kfree(ofdev->name);
> 
> This probably ought to be swapped because we don't know if ofdev isn't
> pointing to freed memory after device_unregister().

Actually, the only safe place to free the memory is inside the
platform_device release function. platform_device_release() in
drivers/base/platform.c. Unfortunately there isn't a good way from that
function to figure out if the name has been allocated the 'OF' way.

It is not safe to free it here because there could still be references
to the platform_device after device_unregister exits.

g.
