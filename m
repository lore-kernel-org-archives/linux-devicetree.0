From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] PCI: add missing DT binding for linux,pci-domain
 property
Date: Thu, 06 Nov 2014 16:08:57 +0100
Message-ID: <1415286537.671.3.camel@pengutronix.de>
References: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
	 <20141104120052.GE11102@e106497-lin.cambridge.arm.com>
	 <2606632.6m38glseTk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2606632.6m38glseTk@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 04.11.2014, 13:07 +0100 schrieb Arnd Bergmann:
> On Tuesday 04 November 2014 12:00:52 Liviu Dudau wrote:
> > 
> > While the description is potentially correct, what it fails to explain is that the
> > choice of using the property or generating an unstable (across boots) unique
> > number is actually the choice of the host bridge driver at the moment. I know that
> > my earlier implementations were defaulting to the automatic numbering, but that has
> > been dropped from the final series as Rob Herring was objecting to it.
> > 
> > There is still scope to adopt a wide policy here, but for now it should say something
> > to the tune:
> > 
> >    If present this property assigns a fixed PCI domain number to a host bridge,
> >    otherwise an unstable (across boots) unique number will be assigned.
> >    If you decide to use the property to assign a fixed PCI domain number to a host
> >    bridge you have to ensure that all the host bridge drivers present in the system
> >    follow the same policy. Otherwise, potentially conflicting domain numbers
> >    may be assigned to root busses behind different host bridges.
> 
> But with the latest change to the domain handling, all drivers would implement
> this. I would just mention that Linux kernels older than 3.19 are probably
> going to ignore this property.
> 
Hm, I don't think we should stick those things into the binding docs, as
those should not be Linux specific. IMHO the time when the parsing of a
property gets implemented is a implementation detail that has nothing to
do with the binding. Besides vendors always screw with this timeframes
by doing backports.

Regards,
Lucas

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
