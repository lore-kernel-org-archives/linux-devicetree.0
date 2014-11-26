From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 06/11] irqchip: bcm7120-l2: Change DT binding to allow
 non-contiguous IRQEN/IRQSTAT
Date: Wed, 26 Nov 2014 10:54:15 -0800
Message-ID: <CAJiQ=7DXQX8h-1+K4-NSWjFqmr8nDCU62KzcyKKXiuvLUSHpEg@mail.gmail.com>
References: <1416796846-28149-1-git-send-email-cernekee@gmail.com>
 <1416796846-28149-7-git-send-email-cernekee@gmail.com> <CAOiHx=ntm7AO5BU2Ge0JDC5nDgXSZwQDm05s5VTM8mLqYmCZRw@mail.gmail.com>
 <CAJiQ=7CvpFWxDY1uad2bZz8MBG0Mvg2Jx8WBp6gHi-kD4TDvXA@mail.gmail.com>
 <CAOiHx=m+At9u=eepphG89kcusOKbBi1qqxT8k-Qyx-OMdMAJKw@mail.gmail.com> <CAOiHx=k_4r=jtQdi0ABvfKAw0JtHY9Z46pVUfetDmKz4d0XoFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=k_4r=jtQdi0ABvfKAw0JtHY9Z46pVUfetDmKz4d0XoFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 26, 2014 at 2:25 AM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> On Wed, Nov 26, 2014 at 10:45 AM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>> As far as I can see, we have three distinct layouts here:
>>
>> a) An arbitrary number of 32-bit Mask/Status-pairs (3384/6838). No per
>> thread support (well, not sure about 60333).
>>
>> b) An arbitrary length (32 to 128 bit) Mask register, followed by a
>> same length Status register (63xx except 63381, 6818, 6828); repeated
>> for each thread.
>>
>> c) A single arbitrary length (currently only 128 bit) Status register,
>> followed by per thread same length Mask registers (63381).
>>
>> On a first glance this could translate to three distinct
>> drivers/compatible properties, where each expects different reg = <>;
>> contents.
>>
>> For a), it should be enough to expand the current 7120-l2 driver to
>> accept/use more than one 0x8 length register, which should simplify
>> the register map setup.
>>
>> For b) we could add a a new compatible name (maybe bcm6358-l2, because
>> that was AFAICT the first one with blocks) that will use the 8 to 32
>> byte length regs (one for each block). For now we could ignore the SMP
>> capability of it and make it a variant of the 7120-l2 driver, and when
>> we add SMP support, split it into a second different driver if we want
>> to avoid having all the spinlock for register accesses even for a).
>>
>> We could then even easily document/add the extra block registers /
>> interrrupts in documentation / the dtsi files before actually
>> supporting them, because we only have a fixed amount of regs/irqs to
>> expect in the !SMP case and can easily ignore the extra
>> registers/interrupts.
>>
>> For c) we could add a a third compatible name (bcm63381-l2), also with
>> its own setup routine. I would guess it doesn't matter if both
>> thread's irqstatus register pointers point to the same region.
>
> This split-up is especially tempting to me after I had a closer look
> at the current 7120-l2 driver, which already accepts more than one
> interrupt, but uses it in a different way. So even if we try to make
> it very flexible with only one compatible property,
>
>    reg = <irqstatus0 irqmask0 irqstatus1 irqmask1>;
>    interrupts = <irq0>, <irq1>;
>
> Could then mean either irq0 is for interrupts 0..31 (mask/status0) and
> irq1 for interrupts 32 .. 64 (mask/status1), or irq0 is for interrupts
> 0..31 on cpu0, and irq1 is for interrupts 0..31 on cpu1, and then
> would require an additional property to tell them apart, for which we
> then also could just use a different compatible name, and have (IMHO)
> a lot less headache.  (I wonder why we couldn't just have had more
> than one instance of 7120-l2 in the dts for the first case)

I don't think we've used this driver to implement the first case yet.

The initial use of the driver was for the BCM7xxx IRQ0 block, which is
wired up according to the ASCII art diagram in
Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
.  i.e. different sets of bits in a single irqstatus0/irqmask0 pair
map to different parent IRQs.  The bits handled by each parent IRQ are
indicated in the brcm,int-map-mask property.

And now on BCM3384, of course, we're seeing the output from two 32-bit
irqstatus/irqmask words ORed together into a single parent IRQ, for
periph_intc.  The other instances do have their own DT nodes.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
