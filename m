From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 06/11] irqchip: bcm7120-l2: Change DT binding to allow
 non-contiguous IRQEN/IRQSTAT
Date: Wed, 26 Nov 2014 13:06:32 -0800
Message-ID: <CAJiQ=7C5cMxwE3O4RE8KxPpK+KHx4yqSj7HH-4mXTfZN6VBn7A@mail.gmail.com>
References: <1416796846-28149-1-git-send-email-cernekee@gmail.com>
 <1416796846-28149-7-git-send-email-cernekee@gmail.com> <CAOiHx=ntm7AO5BU2Ge0JDC5nDgXSZwQDm05s5VTM8mLqYmCZRw@mail.gmail.com>
 <CAJiQ=7CvpFWxDY1uad2bZz8MBG0Mvg2Jx8WBp6gHi-kD4TDvXA@mail.gmail.com>
 <CAOiHx=m+At9u=eepphG89kcusOKbBi1qqxT8k-Qyx-OMdMAJKw@mail.gmail.com>
 <CAOiHx=k_4r=jtQdi0ABvfKAw0JtHY9Z46pVUfetDmKz4d0XoFQ@mail.gmail.com>
 <CAJiQ=7DXQX8h-1+K4-NSWjFqmr8nDCU62KzcyKKXiuvLUSHpEg@mail.gmail.com> <CAOiHx=mRonqUR_u8msKiSJVLoJMJT8CXhJeo6oQMFF+AxRE=6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=mRonqUR_u8msKiSJVLoJMJT8CXhJeo6oQMFF+AxRE=6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 26, 2014 at 12:13 PM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>>> Could then mean either irq0 is for interrupts 0..31 (mask/status0) and
>>> irq1 for interrupts 32 .. 64 (mask/status1), or irq0 is for interrupts
>>> 0..31 on cpu0, and irq1 is for interrupts 0..31 on cpu1, and then
>>> would require an additional property to tell them apart, for which we
>>> then also could just use a different compatible name, and have (IMHO)
>>> a lot less headache.  (I wonder why we couldn't just have had more
>>> than one instance of 7120-l2 in the dts for the first case)
>>
>> I don't think we've used this driver to implement the first case yet.
>>
>> The initial use of the driver was for the BCM7xxx IRQ0 block, which is
>> wired up according to the ASCII art diagram in
>> Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
>> .  i.e. different sets of bits in a single irqstatus0/irqmask0 pair
>> map to different parent IRQs.  The bits handled by each parent IRQ are
>> indicated in the brcm,int-map-mask property.
>>
>> And now on BCM3384, of course, we're seeing the output from two 32-bit
>> irqstatus/irqmask words ORed together into a single parent IRQ, for
>> periph_intc.  The other instances do have their own DT nodes.
>
> Ah indeed, I read it wrong. But it still the same "problem" of regs +
>> 1 parent interrupts already having a different meaning for bcm7120
> than what they will have for bcm63xx.
>
> I just successfully* booted bcm63xx with my proposed changes to
> bcm7120-l2-intc with a hacked together bcm6358-l2-intc probe routine,
> and I now think even less that having these two in one driver merged
> is a good idea. Especially if we want to support the affinity stuff.
> There seems to be quite a bit that will need to be changed for it.

My current line of thinking is:

compatible="bcm7120-l2-intc" will expect a STB IRQ device with
multiple outputs, and a brcm,int-map-mask property.  IRQEN at 0x00,
IRQMASK at 0x04, single reg range: <addr 0x8>.

compatible="bcm3380-l2-intc" will expect one or more reg pairs of
<irqen_addr 0x4 irqstat_addr 0x4>, single output, no
brcm,int-map-mask, no brcm,int-fwd-mask.  In the short term this can
be used to support bcm63xx controllers with one CPU.  This can easily
be handled by irq-bcm7120-l2.c (I'll just split out the reg parsing
logic).

compatible="bcm6358-l1-intc", "bcm63381-l1-intc", etc. can be
supported by a separate driver at some future date.  Similar to my new
"bcm7038-l1-intc" driver, this would eliminate many of the special
cases found in irq-bcm7120-l2.c, and it would add SMP affinity
support.  reg ranges would look something like <cpu0_block 0x20
cpu1_block 0x20>.  Each range corresponds to a single parent IRQ.
When this driver is ready, the DTS files can be upgraded to use the
new code.  In the unlikely event that the old DTB gets baked into a
released bootloader image, that's still OK because we aren't changing
the "bcm3380-l2-intc" bindings.

IIRC there wasn't a nice way to implement SMP affinity with
kernel/irq/generic-chip.c either, which is why I dropped it from the
7038 driver.

> * took me a while to find your OF_DECLARE_2() for the mips-intc - sneaky ;p.

I'm not real happy about how that currently looks, but I didn't know
of another way to use mips_cpu_irq_of_init() in conjunction with
irqchip_init() (covering the L1/L2 drivers).  We only want to call
of_irq_init() once, and it should be called with a list of all irqchip
drivers built into the kernel.

> P.S: I wonder how this patchset is supposed to go, as it depends on
> earlier bcm7120/generic irqchip patches marked in patchwork as "other
> subsystem".

Right, I noted this somewhere in the cover-letter...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
