From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: Add platform support for Fujitsu MB86S7X SoCs
Date: Thu, 17 Jul 2014 19:12:45 +0200
Message-ID: <13232839.EhWsHsNIV6@wuerfel>
References: <1405232911-4569-1-git-send-email-mollie.wu@linaro.org> <13950816.fBdtyDiPqD@wuerfel> <CAJe_ZhdM88x883DqxerW-JWpVeiFR9yA7s_=gpPZ7w1qPDJR=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_ZhdM88x883DqxerW-JWpVeiFR9yA7s_=gpPZ7w1qPDJR=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 17 July 2014 22:24:43 Jassi Brar wrote:
> On 17 July 2014 19:18, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Thursday 17 July 2014 19:02:53 Jassi Brar wrote:

> >> From a few hundred micro-sec for CPU reset, to potentially tens of
> >> milli-sec for some I2C transaction ... yes we do have for I2C over
> >> mailbox! ;)
> >>
> >> Probably bailing out of the loop and returning -ETIMEOUT to the
> >> caller, before a WARN(), is the simplest way to die.
> >
> > If you can have multiple miliseconds here, I think the code should
> > be changed to run in non-atomic context and use msleep(1) or
> > usleep_range() as a back-off. Is that possible?
> >
> I don't think we could sleep there but that should be ok because the
> code is used only when we don't have mailbox framework ready i.e, in
> very early boot before timers are ready and also as late as during
> reboot/poweroff. Also I realize long delays like those for I2C would
> never use this code - they would always have mailbox usable during
> their lifetime.

Ok, just add a comment then, and a warning if things take too long.

> >> >> >> +struct mb86s7x_peri_clk {
> >> >> >> +     u32 payload_size;
> >> >> >> +     u32 cntrlr;
> >> >> >> +     u32 domain;
> >> >> >> +     u32 port;
> >> >> >> +     u32 en;
> >> >> >> +     u64 freqency;
> >> >> >> +} __packed;
> >> >> >
> >> >> > Just mark the last member by itself __packed. I assume you didn't
> >> >> > actually mean to change the alignment of the data structure to one
> >> >> > byte, but just want to say that the last one is misaligned.
> >> >> >
> >> >> This and others, are data packets that are passed between local and
> >> >> remote via SharedMemory. __packed is only meant to specify that these
> >> >> data structures have no holes in them.
> >> >
> >> > That would be '__packed __attribute__((aligned(4)))'. A struct of 'u32'
> >> > already has no padding on any architecture that is supported by Linux.
> >> > The only reason you need the packing here is because the u64 member is
> >> > unaligned. Note that marking the entire structure as packed means that
> >> > accesses are no longer atomic because the compiler may prefer to do them
> >> > one byte at a time, which can break the protocol on the shared memory
> >> > area.
> >> >
> >> We are not worried about the atomic access because the side sending
> >> the data doesn't touch it until the other side indicates it has
> >> consumed it.
> >
> > It's still wrong though ;-)
> >
> The remote f/w expects data to be contiguous and we can't assume how
> it reads the packet. So our firstmost priority is to have no holes in
> the region... like, say, USB descriptors.

The structures being contiguous is guaranteed by the ELF ABI, unless
you have unaligned members.

You can be explicit about it, but then you should also provide a
new minimum alignment (e.g. 4 bytes) for the structure to avoid
having the compiler turn everything into bytewise accesses.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
