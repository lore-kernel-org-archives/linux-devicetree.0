From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] PCI: add missing DT binding for linux,pci-domain
 property
Date: Mon, 10 Nov 2014 15:58:29 +0100
Message-ID: <1415631509.20340.5.camel@pengutronix.de>
References: <1415287400-30426-1-git-send-email-l.stach@pengutronix.de>
	 <CAL_JsqKfV3aPuYxK2E8tS1fDjhpJFknqv1nHP+9NYHAfs_owYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKfV3aPuYxK2E8tS1fDjhpJFknqv1nHP+9NYHAfs_owYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 06.11.2014, 13:49 -0600 schrieb Rob Herring:
> On Thu, Nov 6, 2014 at 9:23 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > This property was added by 41e5c0f81d3e
> > (of/pci: Add pci_get_new_domain_nr() and of_get_pci_domain_nr())
> > without the required binding documentation. As this property
> > will be supported by a number of host bridge drivers going forward,
> > add it to the common PCI binding doc.
> >
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > This is a non-critical fix, but may still qualify for 3.18-rc as
> > the property was added in this release cycle.
> 
> Agreed.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 

So how should we proceed here? Are you going to pick it up or should
Bjorn route this through the PCI tree?

> >
> > v2:
> > - emphasize that the property must be present and unique systemwide
> >   if used
> > ---
> >  Documentation/devicetree/bindings/pci/pci.txt | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentation/devicetree/bindings/pci/pci.txt
> > index 41aeed38926d..68c364e2f5e5 100644
> > --- a/Documentation/devicetree/bindings/pci/pci.txt
> > +++ b/Documentation/devicetree/bindings/pci/pci.txt
> > @@ -7,3 +7,14 @@ And for the interrupt mapping part:
> >
> >  Open Firmware Recommended Practice: Interrupt Mapping
> >  http://www.openfirmware.org/1275/practice/imap/imap0_9d.pdf
> > +
> > +Additionally to the properties specified in the above standards a host bridge
> > +driver implementation may support the following properties:
> > +
> > +- linux,pci-domain:
> > +   If present this property assigns a fixed PCI domain number to a host bridge,
> > +   otherwise an unstable (across boots) unique number will be assigned.
> > +   It is required to either not set this property at all or set it for all
> > +   host bridges in the system, otherwise potentially conflicting domain numbers
> > +   may be assigned to root buses behind different host bridges. The domain
> > +   number for each host bridge in the system must be unique.
> > --
> > 2.1.1
> >

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
