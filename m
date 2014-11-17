From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Mon, 17 Nov 2014 11:47:12 -0800
Message-ID: <CAJiQ=7CmFNhufdeoeH_6SuYOhf3Luwc2zwy_+8au1V8RW78rOw@mail.gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
 <2018325.yOrLZndTTm@wuerfel> <CAJiQ=7An5eZ3j2+Zkx1crV9pBSVodkEQ+6ESGcFk5z0tDV7cHA@mail.gmail.com>
 <14461008.6cZzGdpat2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <14461008.6cZzGdpat2@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 10:55 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> >> And unless there is one, having a
>> >> multiplatform kernel does not make much sense, as there is no sane way
>> >> to tell apart different platforms on boot.
>> >
>> > How do you normally tell boards apart on MIPS when you don't use DT?
>>
>> On BCM7xxx (STB) kernels, we could assume the chip ID was in a known
>> register, and also we could call back into the bootloader to get a
>> somewhat-accurate board name.
>>
>> On BCM63xx there is logic in arch/mips/bcm63xx/cpu.c to try to guess
>> the chip identity from the CPU type/revision (because the latter can
>> be read directly from CP0).
>>
>> These systems were never really designed to support multiplatform
>> kernels.  The ARM BCM7xxx variants, by contrast, were.
>
> Guessing the chip doesn't really help you all that much of course
> as long as you don't know the board, and once you know that,
> the chip is implied.

This mostly depends on the desired feature set, and the delta from one
board to the next.  Many of the reference board sections are largely
copied from a working design, but sometimes there are changes that
affect us.  Other times there are tweaks that can be autodetected,
like a different flash chip.

The analog interfaces like SATA/USB/Ethernet don't tend to vary all
that much (although some may be missing ports on the board, or
disabled on the chip).

The pin muxing situation leaves a lot of room for board differences,
and on these platforms it isn't really handled in a central place.
This gets even more challenging when combined with some of the power
management requirements.

The peripherals that I added in my patch submission are among the
easiest / safest of the bunch.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
