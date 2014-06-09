From: Sarah Newman <sarah.newman-bdq14YP6qtRg9hUCZPvPmw@public.gmane.org>
Subject: [RFC] PCI express slot bindings
Date: Mon, 09 Jun 2014 16:38:07 -0700
Message-ID: <5396455F.30303@computer.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Greetings,

I have a client whose board has two mini pci express slots.  Having reviewed the pinouts at
http://www.allpinouts.org/index.php/PCI_Express_Card_and_PCI_Express_Mini_Card and some of the PCI
express documentation I believe the below may be sufficient to adequately describe the interface.

Feedback on style and/or correctness would be deeply appreciated. I have not written any drivers yet
and I'm not sure it would make sense to submit this as a patch until a minimal driver is present.

Thanks, Sarah

--
pcieslot-gpio.txt

Defines a pci express or mini pci express card slot.

This binding makes the assumption that pcie bridges are not dynamically
added and removed such that pci addressing should remain constant.

Required properties:
- compatible: should contain "pcieslot-gpio"
- #address-cells: set to <2>
- #size-cells: set to <0>
- reg: A cell where the first number is the pci bus and the second number is the slot.

Optional properties:
- wake-up-gpio: GPIO for WAKE#.
	Will be a falling edge interrupt enabled while the slot is enabled.
	No special handling will occur for this interrupt at this time.
- wdisable-gpio: GPIO for W_DISABLE# or W_DISABLE1#.  Active low.
- wdisable2-gpio: GPIO for W_DISABLE2#. Active low.
- reset-gpio: GPIO for PERST#.
- vdd-supplies: List of regulator phandles required to power on/off the slot.
- hot-pluggable: If present, the slot may be powered on and off at after boot.
- cd-gpio: GPIO for card detection on hot-swappable slots.
   Implies hot-pluggable. Typically active low.
- cd-inverted: If present, polarity on the CD line is active high.
- usb: usb controller associated with this slot.
- smb: system management bus associated with this slot.

Example:

	pcislots {
   		#address-cells = <2>;
		#size-cells = <0>;

		slot@3,0 {
			compatible = "pcieslot-gpio";
			reg = <3 0>;
			wake-up-gpio = <&gpio1 5 0>;
			disable1-gpio = <&gpio4 14 0>;
			vdd-supplies = <&pcie1_fixed_3v3>;
			usb = <&usbotg>;
			smb = <&i2c3>;
		};
	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
