From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4] PCI: Xilinx-NWL-PCIe: Added support for Xilinx NWL PCIe Host Controller
Date: Sat, 17 Oct 2015 13:49:25 +0200
Message-ID: <5705956.6YyKSO4LdH@wuerfel>
References: <1445066538-24638-1-git-send-email-bharatku@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445066538-24638-1-git-send-email-bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, tinamdar-qTEPVZfXA3Y@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ravi Kiran Gummaluri <rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 17 October 2015 12:52:18 Bharat Kumar Gogada wrote:
> +       "msi_1, msi_0": interrupt asserted when msi is recieved

Better avoid underscores in DT, use "msi0" instead of "msi_0".

> +- interrupt-map-mask and interrupt-map: standard PCI properties to define the
> +       mapping of the PCI interface to interrupt numbers.
> +- ranges: ranges for the PCI memory regions (I/O space region is not
> +       supported by hardware)
> +       Please refer to the standard PCI bus binding document for a more
> +       detailed explanation
> +- msi-controller: indicates that this is MSI controller node
> +- msi-parent:  MSI parent of the root complex itself
> +- pcie_intc: Interrupt controller device node for Legacy interrupts
> +       - interrupt-controller: identifies the node as an interrupt controller
> +       - #interrupt-cells: should be set to 1
> +       - #address-cells: specifies the number of cells needed to encode an
> +               address. The value must be 0.

The name doesn't match: below, the name is "legacy-interrupt-controller",
not "pcie_intc". I suppose it should really be "interrupt-controller"
anyway.

> +
> +Example:
> +++++++++
> +
> +nwl_pcie: pcie@fd0e0000 {
> +       #address-cells = >;
> +       #size-cells = <2>;
> +       compatible = "xlnx,nwl-pcie-2.11";
> +       #interrupt-cells = <1>;
> +       msi-controller;
> +       device_type = "pci";
> +       interrupt-parent = <&gic>;
> +       interrupts = < 0 118 4
> +                      0 116 4
> +                      0 115 4          // MSI_1 [63...32]
> +                      0 114 4 >;       // MSI_0 [31...0]

Better write these as tuples:

	interrupts = <0 118 4>, <0 116 4>, <0 115 4>, <0 114 4>;

And maybe reverse the order? It looks that might be what the
soc integration person had in mind.

Also, what is interrupt <0 117 4>? Is that connected here as well?
Better list it as well then, even if you don't use it.

> +       interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +       interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc 0x1
> +                        0x0 0x0 0x0 0x2 &pcie_intc 0x2
> +                        0x0 0x0 0x0 0x3 &pcie_intc 0x3
> +                        0x0 0x0 0x0 0x4 &pcie_intc 0x4>;

> +       msi-parent = <&nwl_pcie>;
> +       reg = <0x0 0xfd0e0000 0x1000
> +              0x0 0xfd480000 0x1000
> +              0x0 0xE0000000 0x1000000>;

Same grouping for reg and interrupt-map as above for interrupts.

> +       reg-names = "breg", "pcireg", "cfg";
> +       ranges = <0x02000000 0x00000000 0xE1000000 0x00000000 0xE1000000 0 0x0F000000>;

No I/O space or prefetcheable memory?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
