From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/4] pci: iProc: define Broadcom iProc PCIe binding
Date: Fri, 12 Dec 2014 13:14:58 +0100
Message-ID: <3375037.6pjWmlOLA3@wuerfel>
References: <1418351817-14898-2-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418351817-14898-2-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 11 December 2014 18:36:54 Ray Jui wrote:
> index 0000000..040bc0f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
> @@ -0,0 +1,74 @@
> +* Broadcom iProc PCIe controller
> +
> +Required properties:
> +- compatible: Must be "brcm,iproc-pcie"
> +- reg: base address and length of the PCIe controller and the MDIO interface
> +  that controls the PCIe PHY
> +- #interrupt-cells: set to <1>
> +- interrupts: interrupt IDs

How many, and what are they?

> +- interrupt-map-mask and interrupt-map, standard PCI properties to define the
> +  mapping of the PCIe interface to interrupt numbers
> +- bus-range: PCI bus numbers covered
> +- #address-cells: set to <3>
> +- #size-cells: set to <2>
> +- device_type: set to "pci"
> +- ranges: ranges for the PCI memory and I/O regions
> +- phy-addr: MDC/MDIO adddress of the PCIe PHY

It looks like the phy controller is separate from the PCI controller,
and you even list the same register range for both PHYs. Better make
that a separate driver and put the phy address into the "phys" reference.

> +- have-msi-inten-reg: Required for legacy iProc PCIe controllers that need the
> +  MSI interrupt enable register to be set explicitly
> +
> +The Broadcom iProc PCie driver adapts the multi-domain structure, i.e., each
> +interface has its own domain and therefore has its own device node
> +Example:
> +
> +SoC specific DT Entry:
> +
> +       pcie0: pcie@18012000 {
> +               compatible = "brcm,iproc-pcie";
> +               reg = <0x18012000 0x1000>,
> +                       <0x18002000 0x1000>;

I guess the addresses should be relative to the BCMA bus, and this node
get moved under that. Please see Hauke's patch series, we've discussed
this in great length already.

> +               #interrupt-cells = <1>;
> +               interrupts = <GIC_SPI 96 IRQ_TYPE_NONE>,
> +                            <GIC_SPI 97 IRQ_TYPE_NONE>,
> +                            <GIC_SPI 98 IRQ_TYPE_NONE>,
> +                            <GIC_SPI 99 IRQ_TYPE_NONE>,
> +                            <GIC_SPI 100 IRQ_TYPE_NONE>,
> +                            <GIC_SPI 101 IRQ_TYPE_NONE>;



> +               interrupt-map-mask = <0 0 0 0>;
> +               interrupt-map = <0 0 0 0 &gic GIC_SPI 100 IRQ_TYPE_NONE>;

This interrupt is also listed in the "interrupts" above, which is
probably a mistake, unless the IRQ line is shared between all PCI
devices and the PCI host itself.

> +               bus-range = <0x00 0xFF>;
> +
> +               #address-cells = >;
> +               #size-cells = <2>;
> +               device_type = "pci";
> +               ranges = <0x81000000 0 0          0x28000000 0 0x00010000   /* downstream I/O */
> +                         0x82000000 0 0x20000000 0x20000000 0 0x04000000>; /* non-prefetchable memory */
> +               phy-addr = <5>;
> +       };
> 

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
