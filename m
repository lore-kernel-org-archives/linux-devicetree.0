From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2] drivers: pci: move PCI domain assignment to generic PCI code
Date: Wed, 12 Nov 2014 15:38:26 +0100
Message-ID: <2433793.KkIZdJTcBW@wuerfel>
References: <1415637706-2195-1-git-send-email-lorenzo.pieralisi@arm.com> <176983067.8qgFVmI6qY@wuerfel> <20141112141429.GF6759@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20141112141429.GF6759@red-moon>
Sender: linux-pci-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 November 2014 14:14:29 Lorenzo Pieralisi wrote:
> > 
> > Since this is now in the file in which it gets called, you can mark the
> > function itself as 'static' and remove the extern declaration and inline
> > wrapper from the header file. You can also avoid the #ifdef by doing
> 
> It is not, it is in driver/pci/pci.c, it is called in probe.c.
> 
> Maybe I can move the function to probe.c, but this would leave the
> domain handling in two separate files.
> 
> I can't remove the #ifdeffery in that domain_nr in pci_bus is #ifdeffed
> too, unless I remove that #ifdef and I compile it in all the time.
> 

Right, I see. Unless Bjorn has some other preference, I'd just leave it
with your current version then.

	Arnd
