From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: pcie: Add documentation for Mediatek PCIe
Date: Tue, 25 Apr 2017 14:18:19 +0200
Message-ID: <CAK8P3a1vgi9VBZfRNq0dDKzmfe8FkHQtgz6fEXW9fyUnBHtaQQ@mail.gmail.com>
References: <1492935543-18190-1-git-send-email-ryder.lee@mediatek.com> <1492935543-18190-3-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492935543-18190-3-git-send-email-ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 23, 2017 at 10:19 AM, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Add documentation for PCIe host driver available in MT7623
> series SoCs.
>
> Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/pci/mediatek,mt7623-pcie.txt          | 153 +++++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt
>
> diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt
> new file mode 100644
> index 0000000..ee93ba2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt
> @@ -0,0 +1,153 @@
> +Mediatek MT7623 PCIe controller
> +
> +Required properties:
> +- compatible: Should contain "mediatek,mt7623-pcie".

Did mediatek license the IP block from someone else or was it
developed in-house? Is there a name and/or version identifier
for the block itself other than identifying it as the one in mt7623?

> +- device_type: Must be "pci"
> +- reg: Base addresses and lengths of the pcie controller.
> +- interrupts: A list of interrupt outputs of the controller.

Please be more specific about what each interrupt is for, and how
many there are.

> +Required properties:
> +- device_type: Must be "pci"
> +- assigned-addresses: Address and size of the port configuration registers
> +- reg: Only the first four bytes are used to refer to the correct bus number
> +  and device number.
> +- #address-cells: Must be 3
> +- #size-cells: Must be 2
> +- ranges: Sub-ranges distributed from the PCIe controller node. An empty
> +  property is sufficient.
> +- clocks: Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +  - sys_ck
> +- resets: Must contain an entry for each entry in reset-names.
> +  See ../reset/reset.txt for details.

This seems odd: you have a device that is simply identified as "pci"
without any more specific ID, but you require additional properties
(clocks, reset, ...) that are not part of the standard PCI binding.

Can you clarify how the port devices related to the root device in
this hardware design?

Have you considered moving the nonstandard properties into the host
bridge node and having that device deal with setting up the links
to the other drivers? That way we could use the regular pcie
port driver for the children.

> +- reset-names: Must include the following entries:
> +  - pcie-reset
> +- num-lanes: Number of lanes to use for this port.
> +- phys: Must contain an entry for each entry in phy-names.
> +- phy-names: Must include an entry for each sub node. Entries are of the form
> +  "pcie-phyN": where N ranges from 0 to the value specified for port number.
> +  See ../phy/phy-mt7623-pcie.txt for details.

I think the name should not include the number of the port but rather
be always the same here.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
