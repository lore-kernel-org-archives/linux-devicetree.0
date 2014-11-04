From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] PCI: add missing DT binding for linux,pci-domain
 property
Date: Tue, 04 Nov 2014 13:20:53 +0100
Message-ID: <1415103653.4226.1.camel@pengutronix.de>
References: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
	 <20141104120052.GE11102@e106497-lin.cambridge.arm.com>
	 <2606632.6m38glseTk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <2606632.6m38glseTk@wuerfel>
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
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
Right, this further complicates the semantics of this property, so I
would rather leave this out. Host bridge drivers using the generic PCI
domain code will work as documented and IMHO it's reasonable to enforce
this behavior for all new drivers.

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
