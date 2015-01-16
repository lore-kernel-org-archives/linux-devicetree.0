From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Add support for kosagi novena
Date: Fri, 16 Jan 2015 11:44:58 +0100
Message-ID: <1421405098.4015.4.camel@pengutronix.de>
References: <1419237127-21763-1-git-send-email-xobs@kosagi.com>
	 <20150116004615.GF29776@google.com> <54B8EA1C.7070700@kosagi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B8EA1C.7070700-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Zhu <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bunnie-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 16.01.2015, 18:38 +0800 schrieb Sean Cross:
> On 16/01/2015 08:46, Bjorn Helgaas wrote:
> > On Mon, Dec 22, 2014 at 04:32:03PM +0800, Sean Cross wrote:
> >> The Kosagi Novena mainboard contains an i.MX6, along with a PCI Express slot.
> >> This patchset adds regulator support to the PCI Express slot, and adds
> >> device tree support for the Novena mainboard.
> >>
> >> Changes since v1:
> >>     - Add 'kosagi' to vendor prefixes
> >>     - Add LCD panel to simple-panel
> >>     - Renamed power-supply to bus-supply
> >>     - Replaced devm_regulator_get() with devm_regulator_get_optional()
> >>     - Moved regulator_enable to imx6_add_pcie_port()
> >>     - Removed fpga@1 from spi definition in dts -- will use overlays instead
> >>
> >> Sean Cross (4):
> >>   drm/panel: simple: Add Innolux N133HSE panel support
> >>   devicetree: bindings: Add vendor prefix for Kosagi
> >>   PCI: imx6: Add power-supply support
> > I guess we're waiting on a response to Arnd's question about making this
> > more generic, so I'm dropping these from my queue pending that.
> >
> > Then we need a strategy for merging it since it crosses PCI/ARM/GPU.
> > Please propose a strategy; it looks like the PCI part doesn't technically
> > depend on the preceeding patches, but it's fine with me if you want to keep
> > it all together.
> >
> The PCI part was there because without it, the system hard-locks during
> boot without it.
> 
> However, I'm not sure that the power-supply is the correct approach,
> because I can still see lockups even with the switch in place. I still
> haven't found out the root cause of that problem.
> 
> One workaround is to simply enable that GPIO in the bootloader and leave
> it on permanently.  Doing this mimics behavior on other platforms where
> PCIe is permanently powered up, and since the patches are decoupled the
> PCI patch can be applied at a later time.
> 
> I'd prefer to drop the PCI patch for now.  Would you like me to submit a
> v3 with simply the drm/panel and devicetree patches?
> 
Please keep the PCIe supply regulator in your DT, but just mark it
always-on.
I looked into moving the bus-supply into the common designware driver,
but that needs some more work. I'll send out a series for this in the
next days. We can then always hook up the regulator properly after this
is done.

Please wait a bit until sending V3, I want to have another look at the
V2 novena DT.

Regards,
Lucas

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
