From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] pci: designware: add driver for DWC controller in
 ECAM shift mode
Date: Thu, 28 Sep 2017 10:03:39 +0100
Message-ID: <20170928090339.GA21499@arm.com>
References: <20170828180437.2646-1-ard.biesheuvel@linaro.org>
 <20170828180437.2646-2-ard.biesheuvel@linaro.org>
 <20170926173200.GL15970@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170926173200.GL15970-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Graeme Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joao Pinto <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 12:32:00PM -0500, Bjorn Helgaas wrote:
> [+cc Will]
> 
> On Mon, Aug 28, 2017 at 07:04:36PM +0100, Ard Biesheuvel wrote:
> > Some implementations of the Synopsys Designware PCIe controller implement
> > a so-called ECAM shift mode, which allows a static memory window to be
> > configured that covers the configuration space of the entire bus range.
> > 
> > If the firmware performs all the low level configuration that is required
> > to expose this controller in a fully ECAM compatible manner, we can
> > simply describe it as "pci-host-ecam-generic" and be done with it.
> > However, it appears that in some cases (one of which is the Armada 80x0),
> > the IP is synthesized with an ATU window size that does not allow the
> > first bus to be mapped in a way that prevents the device on the
> > downstream port from appearing more than once.
> > 
> > So implement a driver that relies on the firmware to perform all low
> > level initialization, and drives the controller in ECAM mode, but
> > overrides the config space accessors to take the above quirk into
> > account.
> > 
> > Note that, unlike most drivers for this IP, this driver does not expose
> > a fake bridge device at B/D/F 00:00.0. There is no point in doing so,
> > given that this is not a true bridge, and does not require any windows
> > to be configured in order for the downstream device to operate correctly.
> > Omitting it also prevents the PCI resource allocation routines from
> > handing out BAR space to it unnecessarily.
> 
> This is a tangent, but does this mean the other drivers do not need to
> expose a fake 00:00.0 device either?
> 
> s/Designware/DesignWare/ in comments, changelogs, Kconfig text, etc.
> 
> > Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > Cc: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Joao Pinto <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/pci/dwc/Kconfig                | 11 +++
> >  drivers/pci/dwc/Makefile               |  1 +
> >  drivers/pci/dwc/pcie-designware-ecam.c | 77 ++++++++++++++++++++
> 
> This really doesn't have any DesignWare specifics in it, and it seems
> more related to drivers/pci/host/pci-host-generic.c than to anything
> in drivers/pci/dwc.  Maybe it should be
> drivers/pci/host/pci-host-generic-quirks.c or something?  That's
> unwieldy, I admit.
> 
> Putting it in pci/dwc would make Jingoo and Joao the default
> maintainers; I don't know how they feel about that.  We would probably
> have to tweak MAINTAINERS if we *didn't* put it in pci/dwc.
> 
> Any thoughts on this, Will?

The idea of a "generic quirk" makes me smile, I must admit :)

I think there are two options:

  1. Use the full DWC driver, and don't rely on firmware
-or-
  2. Rely on firmware, but teach pci-host-generic to deal with the funny
     config space

For (2), we probably want to describe this as generically as possible
in case some other SoCs run into the same problem.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
