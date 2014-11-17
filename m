From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Mon, 17 Nov 2014 13:57:07 -0800
Message-ID: <CAJiQ=7AhyAyN6Hnvtdowdh6oPknbPFMe-_PrPdzyCGe5H7eE1g@mail.gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
 <14461008.6cZzGdpat2@wuerfel> <CAJiQ=7CmFNhufdeoeH_6SuYOhf3Luwc2zwy_+8au1V8RW78rOw@mail.gmail.com>
 <2622492.TiaF5tO0a3@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2622492.TiaF5tO0a3@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 12:33 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> This mostly depends on the desired feature set, and the delta from one
>> board to the next.  Many of the reference board sections are largely
>> copied from a working design, but sometimes there are changes that
>> affect us.  Other times there are tweaks that can be autodetected,
>> like a different flash chip.
>>
>> The analog interfaces like SATA/USB/Ethernet don't tend to vary all
>> that much (although some may be missing ports on the board, or
>> disabled on the chip).
>>
>> The pin muxing situation leaves a lot of room for board differences,
>> and on these platforms it isn't really handled in a central place.
>> This gets even more challenging when combined with some of the power
>> management requirements.
>>
>> The peripherals that I added in my patch submission are among the
>> easiest / safest of the bunch.
>
> Right, that is exactly the danger: it's easy to get the basics working
> like this, but the differences between SoCs are not what we need DT
> for anyway, those are easily abstracted in kernel code if necessary,
> hardcoded by some soc version identifier.

That depends on how many SoC's we're talking about...

On MIPS we have literally dozens.  Most of the "building blocks" are
pretty similar, but the MMIO addresses, IRQ mappings, and
quantity/revision of each peripheral vary.  DT is ideal for
representing these differences and for rapidly bringing up a new
system.

> What you end up with in your approach is a kernel that can support
> multiple SoCs but only some boards per SoC, and otherwise you still
> depend on compile-time configuration.

Agreed, but for legacy platforms this is somewhat inevitable.  These
systems are already in production so there is no manpower available to
go back and test every single one-off board.  It is most likely that a
small subset of "interesting" boards will receive the best support.
For instance, I see an arch/arm/boot/dts/bcm2835-rpi-b.dts, but that's
hardly the only BCM2835-based platform found in the wild.

The limited board support doesn't negate the value of having a generic
BMIPS kernel available upstream; this build still eliminates
duplicated efforts on many of the basic items (CPU/SMP/caching, IRQ
controllers, UART).  It also allows easy reuse of DT-ready peripherals
that are common to the CM/DSL/STB MIPS and ARM chips, which was the
original goal of the BCM3384 port.

Going forward I would expect that with this build available in
mainline, it will open up new opportunities for modernizing the
bootloaders on each product line.

> Aside from pin configuration,
> you have to have a per-board dtb file if you have any i2c or spi
> connected components, PCI devices with custom interrupt lines,
> LEDs, GPIO buttons, or anything else on a nondiscoverable bus.

Correct.

For better or for worse, most of these don't use Linux kernel drivers on STB.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
