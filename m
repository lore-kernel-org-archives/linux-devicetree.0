From: "Jingoo Han" <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] pci: designware: add driver for DWC controller in ECAM shift mode
Date: Thu, 28 Sep 2017 23:29:31 -0400
Message-ID: <000101d338d3$2aa0c2f0$7fe248d0$@gmail.com>
References: <20170828180437.2646-1-ard.biesheuvel@linaro.org> <20170828180437.2646-2-ard.biesheuvel@linaro.org> <20170926173200.GL15970@bhelgaas-glaptop.roam.corp.google.com> <CAKv+Gu8CCcm_R3S1PbXZFqzvjAJVfU_bKpimVxbeQ78ciAgJyA@mail.gmail.com> <20170928174847.GW15970@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928174847.GW15970-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Content-Language: en-us
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Bjorn Helgaas' <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Ard Biesheuvel' <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: 'linux-pci' <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Marcin Wojtas' <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, 'Leif Lindholm' <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Graeme Gregory' <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Joao Pinto' <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, 'Rob Herring' <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Will Deacon' <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, September 28, 2017 1:49 PM, Bjorn Helgaas wrote:
> On Thu, Sep 28, 2017 at 08:51:43AM -0700, Ard Biesheuvel wrote:
> > On 26 September 2017 at 10:32, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > > On Mon, Aug 28, 2017 at 07:04:36PM +0100, Ard Biesheuvel wrote:
> > >> Some implementations of the Synopsys Designware PCIe controller
> implement
> > >> a so-called ECAM shift mode, which allows a static memory window to
> be
> > >> configured that covers the configuration space of the entire bus
> range.
> 
> > >> Note that, unlike most drivers for this IP, this driver does not
> expose
> > >> a fake bridge device at B/D/F 00:00.0. There is no point in doing so,
> > >> given that this is not a true bridge, and does not require any
> windows
> > >> to be configured in order for the downstream device to operate
> correctly.
> > >> Omitting it also prevents the PCI resource allocation routines from
> > >> handing out BAR space to it unnecessarily.
> > >
> > > This is a tangent, but does this mean the other drivers do not need to
> > > expose a fake 00:00.0 device either?
> >
> > To be honest, I am not so sure anymore. I am seeing some issues in
> > ASPM code making the assumption that any device which is not a root
> > port has a parent. If this is mandated by the spec, I guess there
> > isn't a whole lot we can do except expose a fake root port on b/d/f
> > 0/0/0. This used to work fine, though, and I have to confirm whether
> > the issues I am seeing currently are due to different hardware or
> > changes in the software.
> 
> I agree that our ASPM code had some assumptions that any non-root port
> device should have a parent.  I think the spec also makes that
> assumption, but I haven't found an explicit mandate.  And there *are*
> systems lacking root ports:
> 
> http://lkml.kernel.org/r/1439808478-23253-1-git-send-email-
> wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
> 
> We fixed one such assumption in that thread, but I wouldn't be
> surprised if more remain.  If there are, I think we should fix the
> code to remove the assumption.
> 
> > > This really doesn't have any DesignWare specifics in it, and it seems
> > > more related to drivers/pci/host/pci-host-generic.c than to anything
> > > in drivers/pci/dwc.  Maybe it should be
> > > drivers/pci/host/pci-host-generic-quirks.c or something?  That's
> > > unwieldy, I admit.
> >
> > I don't care where we put it, and I am fine with owning it if you
prefer.
> 
> I think Will's idea of teaching pci-host-generic to deal with this is
> perfect.

I agree. I cannot find any reason to create new dwc-specific file.
Reusing 'pci-host-generic.c' looks better.
Maybe 'pci-host-generic.c with quirks' will be good.

Best regards,
Jingoo Han

> 
> > >> +config PCIE_DW_HOST_ECAM
> > >> +     bool "Synopsys DesignWare PCIe controller in ECAM mode"
> > >> +     depends on OF && PCI
> > >> +     select PCI_HOST_COMMON
> > >> +     select IRQ_DOMAIN
> > >> +     help
> > >> +       Add support for Synopsys DesignWare PCIe controllers
> configured
> > >> +       by the firmware into ECAM shift mode. In some cases, these
are
> > >> +       fully ECAM compliant, in which case the pci-host-generic
> driver
> > >> +       may be used instead.
> > >
> > > This doesn't quite read right.  It sounds like a controller in ECAM
> > > shift mode might be fully ECAM compliant, but I don't think that's
> > > what you intended.
> >
> > Yes, that is what I mean. ECAM shift mode results in a fully compliant
> > ECAM config space iff the IP was synthesized with a 32 KB granularity
> > for the iATU windows. The default is 64 KB, though, in which case you
> > need this driver.
> 
> OK.  I'm trying to figure out how I as a user would know whether to
> select this option.  Maybe the config option will go away if you add
> the smarts to pci-host-generic?
> 
> Bjorn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
