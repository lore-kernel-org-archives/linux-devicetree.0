From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Add support for PCI in AArch64
Date: Tue, 20 May 2014 10:44:30 +0200
Message-ID: <5759329.P75jKFdv3B@wuerfel>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com> <4292818.mI6kZGgTzd@wuerfel> <CA+sq2Ce+8YB+02B7zhxTXwropZXv9spy-w=AJ8YXCP69kr-_1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+sq2Ce+8YB+02B7zhxTXwropZXv9spy-w=AJ8YXCP69kr-_1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sunil Kovvuri <sunil.kovvuri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Scott Lurndal <kdb-JdWt/H98ok1AfugRpC6u6w@public.gmane.org>, "yu.zhao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <yu.zhao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 20 May 2014 09:52:33 Sunil Kovvuri wrote:
> >> In sriov_enable() (drivers/pci/iov.c)
> >>
> >>  296        for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> >>  297                 bars |= (1 << (i + PCI_IOV_RESOURCES));
> >>  298                 res = dev->resource + PCI_IOV_RESOURCES + i;
> >>  299                 if (res->parent)
> >>  300                         nres++;
> >>  301         }
> >>  302         if (nres != iov->nres) {
> >>  303                 dev_err(&dev->dev, "not enough MMIO resources for
> >>  SR-IOV\n");
> >>  304                 return -ENOMEM;
> >>  305         }
> >>
> >> Here its checking if physical function's IOV resource has a parent or not.
> >> Which is pci-pci bridge in this case. Otherwise it doesn't consider
> >> that resource.
> >>
> >> Added below api to your patch.
> >> This will try to claim a resource while creating a PCI device which
> >> inturn sets 'res->parent'.
> >
> > This looks like the wrong approach. The PCI host controller should
> > really have been registered with the root 'iomem_resource' during
> > the probe of the host controller.
> >
> I didn't get this, if a SR-IOV device is connected to a PCI-PCI bridge
> and inturn bridge connected to root port. Then the parent bus is not root,
> but the bridge.  The issue is either hierarchy should not be checked for
> SR-IOV resources or someone should set the hierarchy (i.e parent resources).

Ah, I misunderstood the problem, I thought the PCI core was complaining
about lack of space in the resources, not about a lack of BARs.

It seems there is code like yours in a couple of architectures, but they
only claim the resources of bridges, not the actual devices as you
seem to be doing. Can you check if the x86 version of
pcibios_allocate_bus_resources() does the trick for you? Maybe we can
turn that into a generic helper.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
