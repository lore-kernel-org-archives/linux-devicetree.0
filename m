From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of/irq: improve error report on irq discovery process failure
Date: Mon, 5 Dec 2016 08:28:02 -0600
Message-ID: <CAL_JsqKg4+SANVuhfjFQRrC4Ax7OhAjwuBpo0Xes9UFevFAdWg@mail.gmail.com>
References: <1480946356-16778-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1480946356-16778-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Frank Rowand <frowand.list@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 5, 2016 at 7:59 AM, Guilherme G. Piccoli
<gpiccoli@linux.vnet.ibm.com> wrote:
> On PowerPC machines some PCI slots might not have level triggered
> interrupts capability (also know as level signaled interrupts),
> leading of_irq_parse_pci() to complain by presenting error messages
> on the kernel log - in this case, the properties "interrupt-map" and
> "interrupt-map-mask" are not present on device's node in the device
> tree.
>
> This patch introduces a different message for this specific case,
> and also reduces its level from error to warning. Besides, we warn
> (once) that possibly some PCI slots on the system have no level
> triggered interrupts available.
> We changed some error return codes too on function of_irq_parse_raw()
> in order other failure's cases can be presented in a more precise way.
>
> Before this patch, when an adapter was plugged in a slot without level
> interrupts capabilitiy on PowerPC, we saw a generic error message
> like this:
>
>     [54.239] pci 002d:70:00.0: of_irq_parse_pci() failed with rc=-22
>
> Now, with this applied, we see the following specific message:
>
>     [16.154] pci 0014:60:00.1: of_irq_parse_pci: no interrupt-map found,
>     INTx interrupts not available
>
> Finally, we standardize the error path in of_irq_parse_raw() by always
> taking the fail path instead of returning directly from the loop.
>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@linux.vnet.ibm.com>
> ---
>
> v2:
>   * Changed function return code to always return negative values;

Are you sure this is safe? This is tricky because of differing values
of NO_IRQ (0 or -1).

>   * Improved/simplified warning outputs;
>   * Changed some return codes and some error paths in of_irq_parse_raw()
> in order to be more precise/consistent;

This too could have some side effects on callers.

Not saying don't do these changes, just need some assurances this has
been considered.

Rob
