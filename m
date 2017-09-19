From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/3] Add support for BCM7271 style interrupt controller
Date: Mon, 18 Sep 2017 17:59:57 -0700
Message-ID: <20170919010000.32072-1-opendmb@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>, Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set extends the functionality of the irq-brcmstb-l2 interrupt
controller driver to cover a hardware variant first introduced in the
BCM7271 SoC.  The main difference between this variant and the block
found in earlier brcmstb SoCs is that this variant only supports level
sensitive interrupts and therefore does not latch the interrupt state
based on edges.  Since there is no longer a need to ack interrupts with
a register write to clear the latch the register map has been changed.

Therefore the change to add support for the new hardware block is to
abstract the register accesses to accommodate different maps and to
identify the block with a new device-tree compatible string.

I also took the opportunity to make some small efficiency enhancements
to the driver.  One of these was to make use of the slightly more
efficient irq_mask_ack method.  However, I discovered that the defined
irq_gc_mask_disable_reg_and_ack() generic irq function was insufficient
for my needs.  Previous submissions offered candidate solutions to
address my needs within the generic irqchip library, but since those
submissions appear to have stalled I am submitting this version that
includes the function in the driver to prevent controversy and allow
the new functionality to be included. 

Changes in v4:

- The first three commits were removed from the patch set to remove any
  dependencies on changing the generic irqchip or irqchip-tango imple-
  mentations. If there is a will to make those changes in the future
  they can be applied at that time, but they needn't hold up the accept-
  ance of this patch set.
  
Changes in v3:

- I did not submit a v3 patch set, but Marc Gonzalez included a PATCH v3
  in a response to the v2 patch so I am skipping ahead to v4 to avoid
  confusion.
  
Changes in v2:

- removed unused permutations of irq_mask_ack methods
- added Reviewed-by and Acked-by responses from first submission

Doug Berger (3):
  irqchip: brcmstb-l2: Remove some processing from the handler
  irqchip: brcmstb-l2: Abstract register accesses
  irqchip: brcmstb-l2: Add support for the BCM7271 L2 controller

 .../bindings/interrupt-controller/brcm,l2-intc.txt |   3 +-
 drivers/irqchip/irq-brcmstb-l2.c                   | 171 +++++++++++++++------
 2 files changed, 126 insertions(+), 48 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
