From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/2] dt-bindings: pcie: Add documentation for Mediatek PCIe
Date: Wed, 10 May 2017 10:08:46 +0200
Message-ID: <CAK8P3a193RxchvFAMWeZiP0sc0bd+VGg=_aVvipSgcbDpHXojg@mail.gmail.com>
References: <1494382020-26790-1-git-send-email-ryder.lee@mediatek.com> <1494382020-26790-3-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1494382020-26790-3-git-send-email-ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, linux-pci <linux-pci@vger.kernel.org>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Red Hung <red.hung@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 10, 2017 at 4:07 AM, Ryder Lee <ryder.lee@mediatek.com> wrote:

> +- ranges:
> +  - The first three entries are expected to translate the addresses for the root
> +    port registers, which are referenced by the assigned-addresses property of
> +    the root port nodes (see below).

I don't understand this part. Why do you need a static translation for these?
Shouldn't they just be listed in the 'reg' property of the parent node now that
you have the clk/reset/phy properties in the parent as well?

> +Required properties:
> +- device_type: Must be "pci"
> +- assigned-addresses: Address and size of the port configuration registers
> +- reg: Only the first four bytes are used to refer to the correct bus number
> +  and device number.
> +- #address-cells: Must be 3
> +- #size-cells: Must be 2
> +- #interrupt-cells: Must be 1
> +- interrupt-map-mask and interrupt-map: Standard PCI IRQ mapping properties
> +  Please refer to the standard PCI bus binding document for a more detailed
> +  explanation.

Child nodes do not normally have interrupt-map properties. Isn't this
already covered by the interrupt-map in the parent?

      Arnd
