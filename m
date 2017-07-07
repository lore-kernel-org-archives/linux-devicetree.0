From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] Add support for BCM7271 style interrupt controller
Date: Fri, 7 Jul 2017 12:39:44 -0700
Message-ID: <d8fe8d17-b330-4099-4cfe-647e18ce87ad@gmail.com>
References: <20170707192016.13001-1-opendmb@gmail.com>
 <a801afb1-2f54-2137-6fed-d8f83fe3f8ea@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a801afb1-2f54-2137-6fed-d8f83fe3f8ea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/07/2017 12:34 PM, Doug Berger wrote:
> Sorry, messed up the CC list.
> 
> On 07/07/2017 12:20 PM, Doug Berger wrote:
>> This patch set extends the functionality of the irq-brcmstb-l2 interrupt
>> controller driver to cover a hardware variant first introduced in the
>> BCM7271 SoC.  The main difference between this variant and the block
>> found in earlier brcmstb SoCs is that this variant only supports level
>> sensitive interrupts and therefore does not latch the interrupt state
>> based on edges.  Since there is no longer a need to ack interrupts with
>> a register write to clear the latch the register map has been changed.
>>
>> Therefore the change to add support for the new hardware block is to
>> abstract the register accesses to accommodate different maps and to
>> identify the block with a new device-tree compatible string.
>>
>> I also took the opportunity to make some small efficiency enhancements
>> to the driver.  One of these was to make use of the slightly more
>> efficient irq_mask_ack method.  However, I discovered that the defined
>> irq_gc_mask_disable_reg_and_ack() generic irq function was insufficient
>> for my needs.  The first three commits of this set are intended to be a
>> correction and extension of the existing generic irq implementation to
>> provide a set of functions that can be used by interrupt controller
>> drivers for their irq_mask_ack method.
>>
>> I believe these first three commits should be added to the irq/core
>> repository and the remaining commits should be added to the Broadcom
>> github repository but have included the complete set here for improved
>> context.  This entire set is therefore based on the irq/core master
>> branch.  Please let me know if you would like a different packaging.

The irqchip maintainers (Thomas, Jason, Marc Z.) will probably want to
get irqchip drivers changes through their tree:

IRQCHIP DRIVERS
M:      Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
M:      Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
M:      Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
L:      linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
S:      Maintained
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
irq/core
T:      git git://git.infradead.org/users/jcooper/linux.git irqchip/core
F:      Documentation/devicetree/bindings/interrupt-controller/
F:      drivers/irqchip/

Will reply to the individual patches, thanks for getting this out.

>>
>> If the changes to genirq are not acceptable I can implement the
>> irq_mask_ask method locally in the irq-brcmstb-l2 driver and submit
>> that on its own.
>>
>> Doug Berger (5):
>>   genirq: generic chip: add generic irq_mask_ack functions
>>   genirq: generic chip: remove irq_gc_mask_disable_reg_and_ack()
>>   irqchip: brcmstb-l2: Remove some processing from the handler
>>   irqchip: brcmstb-l2: Abstract register accesses
>>   irqchip: brcmstb-l2: Add support for the BCM7271 L2 controller
>>
>> Florian Fainelli (1):
>>   irqchip/tango: Use irq_gc_mask_disable_and_ack_set
>>
>>  .../bindings/interrupt-controller/brcm,l2-intc.txt |   3 +-
>>  drivers/irqchip/irq-brcmstb-l2.c                   | 145 ++++++++++++++-------
>>  drivers/irqchip/irq-tango.c                        |   2 +-
>>  include/linux/irq.h                                |   7 +-
>>  kernel/irq/generic-chip.c                          | 110 +++++++++++++++-
>>  5 files changed, 214 insertions(+), 53 deletions(-)
>>
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
