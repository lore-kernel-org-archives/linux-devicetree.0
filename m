From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pci-rcar-gen2: add device tree support
Date: Fri, 25 Apr 2014 22:05:50 +0200
Message-ID: <23319337.TNDCodMgFf@wuerfel>
References: <201404080141.21605.sergei.shtylyov@cogentembedded.com> <20140425174535.GF32246@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20140425174535.GF32246@google.com>
Sender: linux-sh-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, horms@verge.net.au, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-pci@vger.kernel.org, linux-sh@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, ben.dooks@codethink.co.uk, linux-doc@vger.kernel.org, rob@landley.net, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On Friday 25 April 2014 11:45:35 Bjorn Helgaas wrote:
> > +This is the bridge used internally to connect the USB controllers to the
> > +AHB. There is one bridge instance per USB port connected to the internal
> > +OHCI and EHCI controllers.
> > +
> > +Required properties:
> > +- compatible: "renesas,pci-r8a7790" for the R8A7790 SoC;
> > +           "renesas,pci-r8a7791" for the R8A7791 SoC.
> > +- reg:       A list of physical regions to access the device: the first is
> > +     the operational registers for the OHCI/EHCI controllers and the
> > +     second is for the bridge configuration and control registers.
> > +- interrupts: interrupt for the device.
> > +- clocks: The reference to the device clock.
> > +- bus-range: The PCI bus number range; as this is a single bus, the range
> > +           should be specified as the same value twice.

Actually, this doesn't conform to the generic PCI binding, which requires
a number of additional properties.

	Arnd
