From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Question] orphan platform data header
Date: Sun, 21 Jul 2019 16:15:05 +0200
Message-ID: <CAK8P3a133ekPqkLWfC2ee0mT3iLbFzSjJ9FDokSyaX+hMVigKA@mail.gmail.com>
References: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
 <CAK8P3a2AeUpmNfFLJSvHT=AJ0kFRT2B=TWDm0HsTwoHt2jQ0gQ@mail.gmail.com>
 <CAK7LNATPbCjwzVnAigsQ8tQRXjC31uxgPg3jgi7pwp+N1RPgWw@mail.gmail.com>
 <CAK8P3a3cURmbGZc-6ESLjrF465VLnBroD4QENyfsSsCrNenRrA@mail.gmail.com> <CAK7LNARN=iNmresDJ2=J1wOb2QYoZ7yw4O0Q9sYVPo0jRKDf=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARN=iNmresDJ2=J1wOb2QYoZ7yw4O0Q9sYVPo0jRKDf=w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 21, 2019 at 2:13 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Sun, Jul 21, 2019 at 6:10 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sun, Jul 21, 2019 at 5:45 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > > On Sat, Jul 20, 2019 at 10:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Sat, Jul 20, 2019 at 5:26 AM Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>
> Another example that I have no idea
> how it works:
>
> drivers/net/hamradio/yam.c
>
> yam_ioctl() reads data from user-space,
> but the data structures for ioctl are
> defined in include/linux/yam.h

That is different: the hardware attaches to a serial port and may well
be usable, and the user space side just contains a copy of the header,
see https://github.com/nwdigitalradio/ax25-tools/tree/master/yamdrv

> If we want to fix this, we could move it
> to include/uapi/linux/yam.h

We could do that, or just leave it alone, as nobody would
tell the difference.

> But, if nobody has reported any problem about this,
> it might be a good proof that nobody is using this driver.
>
> Maybe, can we simply drop odd drivers??

Both the kernel driver and the user space side have a maintainer, and
I see no indication that it is actually broken. The driver is clearly
a relic from old times (earlier than 2.4) and we would not merge
this driver today.

It seems more useful to keep looking for drivers with a platform_data
header file that is no longer included by any platform for candidates
that may be obsolete.

        Arnd
