From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Mon, 17 Nov 2014 21:33:54 +0100
Message-ID: <2622492.TiaF5tO0a3@wuerfel>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com> <14461008.6cZzGdpat2@wuerfel> <CAJiQ=7CmFNhufdeoeH_6SuYOhf3Luwc2zwy_+8au1V8RW78rOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJiQ=7CmFNhufdeoeH_6SuYOhf3Luwc2zwy_+8au1V8RW78rOw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Jonas Gorski <jogo@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Fraser <jfraser@broadcom.com>, Dmitry Torokhov <dtor@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Monday 17 November 2014 11:47:12 Kevin Cernekee wrote:
> On Mon, Nov 17, 2014 at 10:55 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> >> >> And unless there is one, having a
> >> >> multiplatform kernel does not make much sense, as there is no sane way
> >> >> to tell apart different platforms on boot.
> >> >
> >> > How do you normally tell boards apart on MIPS when you don't use DT?
> >>
> >> On BCM7xxx (STB) kernels, we could assume the chip ID was in a known
> >> register, and also we could call back into the bootloader to get a
> >> somewhat-accurate board name.
> >>
> >> On BCM63xx there is logic in arch/mips/bcm63xx/cpu.c to try to guess
> >> the chip identity from the CPU type/revision (because the latter can
> >> be read directly from CP0).
> >>
> >> These systems were never really designed to support multiplatform
> >> kernels.  The ARM BCM7xxx variants, by contrast, were.
> >
> > Guessing the chip doesn't really help you all that much of course
> > as long as you don't know the board, and once you know that,
> > the chip is implied.
> 
> This mostly depends on the desired feature set, and the delta from one
> board to the next.  Many of the reference board sections are largely
> copied from a working design, but sometimes there are changes that
> affect us.  Other times there are tweaks that can be autodetected,
> like a different flash chip.
> 
> The analog interfaces like SATA/USB/Ethernet don't tend to vary all
> that much (although some may be missing ports on the board, or
> disabled on the chip).
> 
> The pin muxing situation leaves a lot of room for board differences,
> and on these platforms it isn't really handled in a central place.
> This gets even more challenging when combined with some of the power
> management requirements.
> 
> The peripherals that I added in my patch submission are among the
> easiest / safest of the bunch.

Right, that is exactly the danger: it's easy to get the basics working
like this, but the differences between SoCs are not what we need DT
for anyway, those are easily abstracted in kernel code if necessary,
hardcoded by some soc version identifier.

What you end up with in your approach is a kernel that can support
multiple SoCs but only some boards per SoC, and otherwise you still
depend on compile-time configuration. Aside from pin configuration,
you have to have a per-board dtb file if you have any i2c or spi
connected components, PCI devices with custom interrupt lines, 
LEDs, GPIO buttons, or anything else on a nondiscoverable bus.

	Arnd
