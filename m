From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Question] orphan platform data header
Date: Mon, 22 Jul 2019 09:24:15 +0200
Message-ID: <CAK8P3a35jUoK0zSXoJ9HDxSpvuUCRFos97tnjQWc9ERxwZ6y+Q@mail.gmail.com>
References: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
 <CAK8P3a2AeUpmNfFLJSvHT=AJ0kFRT2B=TWDm0HsTwoHt2jQ0gQ@mail.gmail.com>
 <CAK7LNATPbCjwzVnAigsQ8tQRXjC31uxgPg3jgi7pwp+N1RPgWw@mail.gmail.com>
 <CAK8P3a3cURmbGZc-6ESLjrF465VLnBroD4QENyfsSsCrNenRrA@mail.gmail.com>
 <CAK7LNARN=iNmresDJ2=J1wOb2QYoZ7yw4O0Q9sYVPo0jRKDf=w@mail.gmail.com>
 <CAK8P3a133ekPqkLWfC2ee0mT3iLbFzSjJ9FDokSyaX+hMVigKA@mail.gmail.com> <21af683a-a188-7aa9-9c82-98c02b8717f8@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <21af683a-a188-7aa9-9c82-98c02b8717f8@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 8:46 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 21.07.19 16:15, Arnd Bergmann wrote:
>
> > That is different: the hardware attaches to a serial port and may well
> > be usable, and the user space side just contains a copy of the header,
> > see https://github.com/nwdigitalradio/ax25-tools/tree/master/yamdrv
>
> I believe that such header copies in userland applications are
> conceptionally wrong. Whenever something changes, both sides need
> to be kept in sync.
>
> Maybe we should talk to the hamradio folks to get this cleaned up.
> IMHO, this header should go to uapi.

Having copies of driver specific uapi headers is rather common,
and you won't have much success trying to get everyone to change
that.

The reasons why those applications do it are:

- The kernel already gives ABI guarantees so anything built with an
   old header file is expected to keep working indefinitely.
- Using a new header file won't help unless the application also
   knows about the added interfaces
- If an application uses more recent additions to the kernel headers,
  it either has to have a matching version of that header, or use a long
  series of #ifdef checks to deal with arbitrary versions.

> > It seems more useful to keep looking for drivers with a platform_data
> > header file that is no longer included by any platform for candidates
> > that may be obsolete.
>
> Some folks see platform_data old legacy that should be removed, but I
> don't aggree. For example w/ apu2 board driver (and corresponding
> amd-fch-gpio driver) I even had to introduce a pdata struct, so the
> board driver could configure the gpio driver.

The case that we are interested in is drivers that previously used
platform data in legacy board files that have since been replaced
with dtb based boots.

> Certainly, I would have
> preferred doing everything via DT, but that's not available on x86/acpi
> targets (if anybody knows a way to inject a DT snippet just for one
> driver in such a scenario, please let me know).

It's been done before, but usually with overlays that don't necessarily
make it any better than platform data. If you have a set of drivers where
one of them creates a platform device for the other driver, then platform
data is usually the easiest way, and I'm not aware of any move to
get rid of that.

As an alternative, you can use the generalized property support
from include/linux/property.h that works on top of DT, ACPI or
plain platform devices.

        Arnd
