From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform
 devices
Date: Tue, 09 Jun 2015 12:00:44 +0100
Message-ID: <20150609110044.61031C40580@trevor.secretlab.ca>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
	<1433686811-12303-3-git-send-email-grant.likely@linaro.org>
	<CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
	<20150608184713.446B7C406AA@trevor.secretlab.ca>
	<CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 8 Jun 2015 22:09:13 +0200
, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> Hello Grant
> 
> 
> On Mon, Jun 8, 2015 at 8:47 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Hi Ricardo,
> >
> > Comments below...
> >
> > On Sun, 7 Jun 2015 20:13:15 +0200
> > , Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >  wrote:
> >> Hello Grant
> >>
> >> I would ask you to go through all the discussion related to this bug.
> >> Here is a summary (please anyone involved correct me if I am wrong)
> >>
> >> 1) I send a patch to fix the oops if release resource is executed with
> >> a resource without parent
> >> 2) Bjorn says that we should fix the issue of the problem, which he
> >> pointed out being that we use platform_device_del() after using
> >> of_device_add()
> >
> > Bjorn's comments on v3 of your patchset were correct. The proposed bug
> > fix hacked the __release_resource function directly, when the bug is in
> > the platform_bus_type code.
> >
> 
> The bug is not in the platform subsystem but in the of subsystem. Your
> patch fixes it in the platform subsystem, so it is as bad as fixing it
> directly on the resource interface.

Not exactly. There is a bug in the platform subsystem: Register and
unregister are not symmetrical, which when combined with the defect in
the OF code results in an oops. It is appropriate to fix the
non-symmetrical code path.

> >> 3) I resend a patchset to use platform_devide_add()
> >> 4) 3 series of cleanouts after the help from Rob and Bjorn
> >> 5) Greg adds the series (v5) to his device core tree
> >
> > The series is still wrong.
> >
> > Greg, please drop Ricardo's series. It isn't correct and it will cause
> > breakage.
> 
> The series can be kept, only
> 
> patch "of/platform: Use platform_device interface"
> 
> needs to be reverted.

No, it's better to drop the whole series. There are still issues and it
will conflict with merging the bugfix for v4.1.

> >
> > There are two issues that need to be delt with:
> >
> > First, there is the immediate bug fix which should go to Linus before
> > v4.1. I believe my patch handles it correctly. I've included a test
> > case, but I would like to have acks from Rob and Pantelis before merging
> > it. Ricardo's v5 patch 2/4 comes close to solving it, but it still
> > doesn't make the unregister path symmetric with the register path.
> 
> Could you please be more specific. what is not symmetric after
> applying the patchset?

register path:

Insert all resources with a parent, if no parent and type == MEM or
IO, then use iomem_resource/ioport_resource as the parent. At the end of
registration, each resource with a parent assigned will be inserted.

unregister path:

Without patch 2/3: Remove all resources with type == MEM or IO. If it
hasn't been inserted then the kernel will oops. Neglects to remove
non-MEM/IO resources.

With patch 2/3: Remove all resources that have a parent and type == MEM
or IO.  Neglects to remove non-MEM/IO resources that were inserted in
the register path.

In both the with and without cases the remove behaviour doesn't not
strictly reverse the insert behaviour, which is not what we want.

I do realize that patch 1/3 of the series stops inserting non-MEM/IO
resources in the register path, but do you know if it is safe to change
that behaviour? There are users who use set parent explicitly, and don't
depend on the default IO and MEM resource roots. For example, I was able
to quickly find devices setting their own root with:

$ git grep '\.parent = .*res'
arch/arm/mach-sa1100/neponset.c:        sa1111_resources[0].parent = sa1111_res;
arch/arm/mach-sa1100/neponset.c:        smc91x_resources[0].parent = smc91x_res;
arch/arm/mach-sa1100/neponset.c:        smc91x_resources[1].parent = smc91x_res;
arch/ia64/sn/kernel/io_init.c:          res[0].parent = &ioport_resource;
arch/ia64/sn/kernel/io_init.c:          res[1].parent = &iomem_resource;
arch/mips/pci/pci-ar2315.c:     apc->mem_res.parent = res;
arch/mips/pci/pci-ar71xx.c:     apc->io_res.parent = res;
arch/mips/pci/pci-ar71xx.c:     apc->mem_res.parent = res;
arch/mips/pci/pci-ar724x.c:     apc->io_res.parent = res;
arch/mips/pci/pci-ar724x.c:     apc->mem_res.parent = res;
arch/mips/pci/pci-rc32434.c:    .parent = &rc32434_res_pci_mem1,
drivers/mfd/mfd-core.c:                 res[r].parent = cell->resources[r].parent;
drivers/uwb/whci.c:     umc->resource.parent = &card->pci->resource[bar];

And that was just a quick search. All of those examples are still type
MEM/IO, so it isn't a definitive answer. Due-diligence still needs to be
done before patch 1/3 would be acceptable.

In the mean time, the simple bug fix is by far the least risky option.

> > Second, there is the issue of making devicetree platform_devices request
> > resources.  That's harder, and we are *NOT* ready to merge anything. Nor
> > is it a time critical issue.
> >
> >> 6) You complaint that that series can break miss behaved platforms
> >
> > Yes, because it will.
> >
> >> 7) I send a couple of patches that fix your problem and leaves the
> >> window open to blacklist the platforms that miss behave.
> >
> > I've replied to that series. It isn't a good solution either.
> 
> I have also replied, please provide a testcase and we will figure it
> if it is not handled properly. So far it works fine on my tests.
> 
> >>
> >> now you send a patch that takes us to back to step 1), and adds some
> >> code that is already merged into gregk's
> >> https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git/tree/drivers/base/platform.c?h=driver-core-testing#n314
> >
> > My patch is different. In v3 __release_resource was hacked directly. By
> > v5 you were fixing platform_device_{add,del}, which is the right thing,
> > but still isn't symmetric. My patch I think handles the bug fix
> > correctly.
> 
> There is no need to apply your patch, that behaviour is already
> impletented in my patchset. If we want to pospone the non registry of
> resources on of devices we just need to revert
> 
> "of/platform: Use platform_device interface"
> 
> I believe reverting 1 patch is patch is better than reverting 4
> reviewed patches and applying a new one.

That series is not in mainline. It is not applied yet. We don't merge
things that aren't ready.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
