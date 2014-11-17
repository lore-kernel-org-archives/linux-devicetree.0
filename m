From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Mon, 17 Nov 2014 19:55:15 +0100
Message-ID: <14461008.6cZzGdpat2@wuerfel>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com> <2018325.yOrLZndTTm@wuerfel> <CAJiQ=7An5eZ3j2+Zkx1crV9pBSVodkEQ+6ESGcFk5z0tDV7cHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJiQ=7An5eZ3j2+Zkx1crV9pBSVodkEQ+6ESGcFk5z0tDV7cHA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 17 November 2014 09:19:17 Kevin Cernekee wrote:
> On Mon, Nov 17, 2014 at 8:13 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > This is not just DT, it's actually an implementation of a boot
> > interface. The situation here seems much more to what we had on
> > PowerPC a long time ago than what we had on ARM before the DT
> > conversion. I think the best approach here would be to move the
> > platform specific bits into the decompressor code, and allow
> > multiple implementations of that. This way you can have the
> > generic vmlinux file that has a common DT parser, and you wrap
> > that into one decompressor per platform, some of which can have
> > their own board detection logic or pre-boot setup where necessary.
> >
> > To be honest, I think having multiple DT files linked into the
> > kernel is a really bad idea, because it doesn't solve the
> > scalability problem at all. What we did on ARM was to force those
> > hacks out into external projects such as the PXA impedence
> > matcher [https://github.com/zonque/pxa-impedance-matcher]. This
> > can handle all weird boot protocol and adapt them to the normal
> > well-defined interfaces we have in the kernel.
> 
> To some extent this is how BCM3384 was done[1].
> 
> There is a tradeoff here: to add support for the older platforms it is
> easy to build a new DTB file into the kernel image, but it is a lot of
> trouble to write a new 3rd stage bootloader.  Do we want to maximize
> our list of supported boards, or are we shooting for a super clean
> kernel implementation right off the bat?

Right, when the norm is that you can't detect the board, having
the wrapper in the kernel is the better approach, as PowerPC, which
has a few dozen ways of linking the compressed kernel, while the
vmlinux file uses a common method and passes everything in DT.

That way you can have the best of both.

> >> And unless there is one, having a
> >> multiplatform kernel does not make much sense, as there is no sane way
> >> to tell apart different platforms on boot.
> >
> > How do you normally tell boards apart on MIPS when you don't use DT?
> 
> On BCM7xxx (STB) kernels, we could assume the chip ID was in a known
> register, and also we could call back into the bootloader to get a
> somewhat-accurate board name.
> 
> On BCM63xx there is logic in arch/mips/bcm63xx/cpu.c to try to guess
> the chip identity from the CPU type/revision (because the latter can
> be read directly from CP0).
> 
> These systems were never really designed to support multiplatform
> kernels.  The ARM BCM7xxx variants, by contrast, were.

Guessing the chip doesn't really help you all that much of course
as long as you don't know the board, and once you know that,
the chip is implied.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
