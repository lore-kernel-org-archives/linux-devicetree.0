From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Question] orphan platform data header
Date: Sun, 21 Jul 2019 11:09:55 +0200
Message-ID: <CAK8P3a3cURmbGZc-6ESLjrF465VLnBroD4QENyfsSsCrNenRrA@mail.gmail.com>
References: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
 <CAK8P3a2AeUpmNfFLJSvHT=AJ0kFRT2B=TWDm0HsTwoHt2jQ0gQ@mail.gmail.com> <CAK7LNATPbCjwzVnAigsQ8tQRXjC31uxgPg3jgi7pwp+N1RPgWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATPbCjwzVnAigsQ8tQRXjC31uxgPg3jgi7pwp+N1RPgWw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 21, 2019 at 5:45 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Sat, Jul 20, 2019 at 10:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sat, Jul 20, 2019 at 5:26 AM Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> > > So, what shall we do?
> > >
> > > Drop the board-file support? Or, keep it
> > > in case somebody is still using their board-files
> > > in downstream?
>>
> > For this file, all boards got converted to DT, and the old setup
> > code removed in commit ebc278f15759 ("ARM: mvebu: remove static
> > LED setup for netxbig boards"), four years ago, so it's a fairly
> > easy decision to make it DT only.
>
> I see another case, which is difficult
> to make a decision.
>
> For example, drivers/spi/spi-tle62x0.c
>
> This driver supports only board-file, but the board-file
> is not found in upstream.
>
> Unless I am terribly missing something,
> there is no one who passes tle62x0_pdata
> to this driver.
>
> $ git grep tle62x0_pdata
> drivers/spi/spi-tle62x0.c:      struct tle62x0_pdata *pdata;
> include/linux/spi/tle62x0.h:struct tle62x0_pdata {
>
> But, removing board-file support
> makes this driver completely useless...

Adding Ben Dooks to Cc.

I suspect this driver is completely obsolete and should be removed.

For some reason, it's not an SPI controller driver like all the other
files in that directory, but implements low-level access to the state
of a particular SPI device.

However, there should not really be a low-level driver for it that
just exports the pins to user space. It should either be a gpiolib
driver to let other drivers talk to the pins, or a high-level driver that
exposes the intended functionality (watchdog, regulator, ...)
to those respective subsystems.

       Arnd
