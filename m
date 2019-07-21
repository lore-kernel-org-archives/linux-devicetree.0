From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Question] orphan platform data header
Date: Sun, 21 Jul 2019 21:12:20 +0900
Message-ID: <CAK7LNARN=iNmresDJ2=J1wOb2QYoZ7yw4O0Q9sYVPo0jRKDf=w@mail.gmail.com>
References: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
 <CAK8P3a2AeUpmNfFLJSvHT=AJ0kFRT2B=TWDm0HsTwoHt2jQ0gQ@mail.gmail.com>
 <CAK7LNATPbCjwzVnAigsQ8tQRXjC31uxgPg3jgi7pwp+N1RPgWw@mail.gmail.com> <CAK8P3a3cURmbGZc-6ESLjrF465VLnBroD4QENyfsSsCrNenRrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3cURmbGZc-6ESLjrF465VLnBroD4QENyfsSsCrNenRrA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 21, 2019 at 6:10 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Jul 21, 2019 at 5:45 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > On Sat, Jul 20, 2019 at 10:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Sat, Jul 20, 2019 at 5:26 AM Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> > > > So, what shall we do?
> > > >
> > > > Drop the board-file support? Or, keep it
> > > > in case somebody is still using their board-files
> > > > in downstream?
> >>
> > > For this file, all boards got converted to DT, and the old setup
> > > code removed in commit ebc278f15759 ("ARM: mvebu: remove static
> > > LED setup for netxbig boards"), four years ago, so it's a fairly
> > > easy decision to make it DT only.
> >
> > I see another case, which is difficult
> > to make a decision.
> >
> > For example, drivers/spi/spi-tle62x0.c
> >
> > This driver supports only board-file, but the board-file
> > is not found in upstream.
> >
> > Unless I am terribly missing something,
> > there is no one who passes tle62x0_pdata
> > to this driver.
> >
> > $ git grep tle62x0_pdata
> > drivers/spi/spi-tle62x0.c:      struct tle62x0_pdata *pdata;
> > include/linux/spi/tle62x0.h:struct tle62x0_pdata {
> >
> > But, removing board-file support
> > makes this driver completely useless...
>
> Adding Ben Dooks to Cc.
>
> I suspect this driver is completely obsolete and should be removed.
>
> For some reason, it's not an SPI controller driver like all the other
> files in that directory, but implements low-level access to the state
> of a particular SPI device.
>
> However, there should not really be a low-level driver for it that
> just exports the pins to user space. It should either be a gpiolib
> driver to let other drivers talk to the pins, or a high-level driver that
> exposes the intended functionality (watchdog, regulator, ...)
> to those respective subsystems.
>
>        Arnd


Another example that I have no idea
how it works:

drivers/net/hamradio/yam.c

yam_ioctl() reads data from user-space,
but the data structures for ioctl are
defined in include/linux/yam.h

This header is not exported to user-space
since it is outside of the uapi directory.

I dug the git history, but it has never
exported to user-space in the past.

I do not know how user-space programs can
pass-in data to the kernel.

If we want to fix this, we could move it
to include/uapi/linux/yam.h

But, if nobody has reported any problem about this,
it might be a good proof that nobody is using this driver.

Maybe, can we simply drop odd drivers??


-- 
Best Regards
Masahiro Yamada
