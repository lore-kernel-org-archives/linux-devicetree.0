From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform
 devices
Date: Mon, 08 Jun 2015 19:47:13 +0100
Message-ID: <20150608184713.446B7C406AA@trevor.secretlab.ca>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
	<1433686811-12303-3-git-send-email-grant.likely@linaro.org>
	<CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ricardo,

Comments below...

On Sun, 7 Jun 2015 20:13:15 +0200
, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> Hello Grant
> 
> I would ask you to go through all the discussion related to this bug.
> Here is a summary (please anyone involved correct me if I am wrong)
> 
> 1) I send a patch to fix the oops if release resource is executed with
> a resource without parent
> 2) Bjorn says that we should fix the issue of the problem, which he
> pointed out being that we use platform_device_del() after using
> of_device_add()

Bjorn's comments on v3 of your patchset were correct. The proposed bug
fix hacked the __release_resource function directly, when the bug is in
the platform_bus_type code.

> 3) I resend a patchset to use platform_devide_add()
> 4) 3 series of cleanouts after the help from Rob and Bjorn
> 5) Greg adds the series (v5) to his device core tree

The series is still wrong.

Greg, please drop Ricardo's series. It isn't correct and it will cause
breakage.

There are two issues that need to be delt with:

First, there is the immediate bug fix which should go to Linus before
v4.1. I believe my patch handles it correctly. I've included a test
case, but I would like to have acks from Rob and Pantelis before merging
it. Ricardo's v5 patch 2/4 comes close to solving it, but it still
doesn't make the unregister path symmetric with the register path.

Second, there is the issue of making devicetree platform_devices request
resources.  That's harder, and we are *NOT* ready to merge anything. Nor
is it a time critical issue.

> 6) You complaint that that series can break miss behaved platforms

Yes, because it will.

> 7) I send a couple of patches that fix your problem and leaves the
> window open to blacklist the platforms that miss behave.

I've replied to that series. It isn't a good solution either.
> 
> now you send a patch that takes us to back to step 1), and adds some
> code that is already merged into gregk's
> https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git/tree/drivers/base/platform.c?h=driver-core-testing#n314

My patch is different. In v3 __release_resource was hacked directly. By
v5 you were fixing platform_device_{add,del}, which is the right thing,
but still isn't symmetric. My patch I think handles the bug fix
correctly.

> Wouldn't you agree that it will be a better solution to give your
> feedback regarding https://lkml.org/lkml/2015/6/5/246 and fix this
> issue together?

That I've done. I'm not happy with it. Sorry.

> that solution has been reviewed by a bunch of people, removes code
> duplication and afaik, is tested, does not break any platform, and I
> believe that is closer to an scenario when we can remove
> of_device_add() and all the devices behave similarly.
> 
> 
> Best Regards
> 
> 
> 
> On Sun, Jun 7, 2015 at 4:20 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > The unregister path of platform_device is broken. On registration, it
> > will register all resources with either a parent already set, or
> > type==IORESOURCE_{IO,MEM}. However, on unregister it will release
> > everything with type==IORESOURCE_{IO,MEM}, but ignore the others. There
> > are also cases where resources don't get registered in the first place,
> > like with devices created by of_platform_populate()*.
> >
> > Fix the unregister path to be symmetrical with the register path by
> > checking the parent pointer instead of the type field to decide which
> > resources to unregister. This is safe because the upshot of the
> > registration path algorithm is that registered resources have a parent
> > pointer, and non-registered resources do not.
> >
> > * It can be argued that of_platform_populate() should be registering
> >   it's resources, and they argument has some merit. However, there are
> >   quite a few platforms that end up broken if we try to do that due to
> >   overlapping resources in the device tree. Until that is fixed, we need
> >   to solve the immediate problem.
> >
> > Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> > Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/base/platform.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index ebf034b97278..7403de94832c 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -375,9 +375,7 @@ int platform_device_add(struct platform_device *pdev)
> >
> >         while (--i >= 0) {
> >                 struct resource *r = &pdev->resource[i];
> > -               unsigned long type = resource_type(r);
> > -
> > -               if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> > +               if (r->parent)
> >                         release_resource(r);
> >         }
> >
> > @@ -408,9 +406,7 @@ void platform_device_del(struct platform_device *pdev)
> >
> >                 for (i = 0; i < pdev->num_resources; i++) {
> >                         struct resource *r = &pdev->resource[i];
> > -                       unsigned long type = resource_type(r);
> > -
> > -                       if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> > +                       if (r->parent)
> >                                 release_resource(r);
> >                 }
> >         }
> > --
> > 2.1.4
> >
> 
> 
> 
> -- 
> Ricardo Ribalda

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
