From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC] PCI express slot bindings
Date: Tue, 10 Jun 2014 09:47:58 +0200
Message-ID: <11304940.EOAagXgniH@wuerfel>
References: <5396455F.30303@computer.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5396455F.30303-bdq14YP6qtRg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sarah Newman <sarah.newman-bdq14YP6qtRg9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 09 June 2014 16:38:07 Sarah Newman wrote:
> Greetings,
> 
> I have a client whose board has two mini pci express slots.  Having reviewed the pinouts at
> http://www.allpinouts.org/index.php/PCI_Express_Card_and_PCI_Express_Mini_Card and some of the PCI
> express documentation I believe the below may be sufficient to adequately describe the interface.
> 
> Feedback on style and/or correctness would be deeply appreciated. I have not written any drivers yet
> and I'm not sure it would make sense to submit this as a patch until a minimal driver is present.
> 

Hi Sarah,

Have you had a look at the way that PCI slots are described in the original
Open Firmware binding? I think you should try to aim to have a binding that
is backwards compatible with that.

The original document is at
http://www.openfirmware.org/1275/bindings/pci/pci2_1.pdf

Unfortunately, this is one of the most confusing bindings we have for
newcomers, so please ask if you have problems understanding it.


An alternative would be to have it more like your binding but decouple it
from PCI some more, which would let us describe USB-only slots better.

> pcieslot-gpio.txt
> 
> Defines a pci express or mini pci express card slot.
> 
> This binding makes the assumption that pcie bridges are not dynamically
> added and removed such that pci addressing should remain constant.
>
> Required properties:
> - compatible: should contain "pcieslot-gpio"
> - #address-cells: set to <2>
> - #size-cells: set to <0>
> - reg: A cell where the first number is the pci bus and the second number is the slot.

I think it can work to have this node be the same as the node for the device
plugged into the slot, logically speaking. In the "flattened device tree"
variant of the above binding, we normally don't list device nodes for any
PCI devices other than the root, but we don't prohibit that either. I'd have
to check the code to see if the PCI core currently connects the 'struct device_node'
correctly to the 'struct pci_dev'. We probably do that on PowerPC but not on
ARM. Can you say which SoC or at least CPU architecture you are working on?

> Optional properties:
> - wake-up-gpio: GPIO for WAKE#.
>         Will be a falling edge interrupt enabled while the slot is enabled.
>         No special handling will occur for this interrupt at this time.
> - wdisable-gpio: GPIO for W_DISABLE# or W_DISABLE1#.  Active low.
> - wdisable2-gpio: GPIO for W_DISABLE2#. Active low.
> - reset-gpio: GPIO for PERST#.

Do I understand it right that you have hardware using actual GPIOs here,
or do you have a PCI host bridge that has pins for these purposes and you
plan to expose them as GPIOs so you can link them to this node?

I think the convention is to use 'gpios' rather than 'gpio', even if there
is just one of them.

> - vdd-supplies: List of regulator phandles required to power on/off the slot.

For both the regulators and gpios, I think you should refer to the 
entries as 'specifiers'. A specifier consists of a phandle to the
controller device node followed by a variable number (which is often
zero) of cells describing the individual resource.

> - hot-pluggable: If present, the slot may be powered on and off at after boot.
> - cd-gpio: GPIO for card detection on hot-swappable slots.
>    Implies hot-pluggable. Typically active low.
> - cd-inverted: If present, polarity on the CD line is active high.

Do we need the 'hot-pluggable' property if it's implied by cd-gpios?

What would be a use-case for non-hot-pluggable slots?

> - usb: usb controller associated with this slot.

Hmm, this seems rather asymmetric. As I understand it (haven't read
the spec in detail), a pcie mini slot is connected to both a USB
host controller and a pcie host controller, but isn't necessarily
the only device connected to them, as you could have intermediate
pcie switches or usb hubs.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
