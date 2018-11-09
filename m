From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 4/6] bus: support HMS Anybus-S bus
Date: Fri, 9 Nov 2018 22:03:12 +0100
Message-ID: <CAK8P3a3=2PUy4Zv9r7oN3Jrp6+vf5iZ+3wi2VNee61mmnFsXNA@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-5-TheSven73@googlemail.com> <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
 <CAGngYiWxhSbLLsPaRZ90wEMhhF7e1jt06ZhhRcuhjM53-RYRwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiWxhSbLLsPaRZ90wEMhhF7e1jt06ZhhRcuhjM53-RYRwg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: svendev@arcx.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, noralf@tronnes.org, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.r>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 9, 2018 at 5:25 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> On Thu, Nov 8, 2018 at 9:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > > +struct anybus_mbox_hdr {
> > > +       u16 id;
> > > +       u16 info;
> > > +       u16 cmd_num;
> > > +       u16 data_size;
> > > +       u16 frame_count;
> > > +       u16 frame_num;
> > > +       u16 offset_high;
> > > +       u16 offset_low;
> > > +       u16 extended[8];
> > > +} __packed;
> >
> > I don't think you want this to be __packed, it won't change the layout
> > but instead force byte accesses on architectures that don't have
> > fast unaligned load/store instructions.
> >
> > Instead of the __packed, it's almost always better to ensure that
> > the structure itself is aligned to a 16-bit address.
> >
>
> A general question about __packed.
>
> My current understanding is this:
> (please tell me if it's incorrect or incomplete)
>
> + without __packed, the compiler is free to pad the struct in whatever
> way it feels is best.
> + with __packed, the fields have to be laid out EXACTLY as specified.

It's not up to the compiler but the ELF ABI. The rules are largely consisten
among the architectures we support, but there are a couple of notable
exceptions:

- ARM OABI requires 32-bit alignment for structures
- x86-32 aligns 64-bit members to 32-bit rather than 64-bit
- m68k has some oddities, I think they can pack certain
  members (don't remember the details)

> Is it possible that someone will compile this on an architecture that 'likes'
> 16-bit ints to be 32-bit aligned? If such an architecture does not currently
> exist, could it appear in the future?

I'm fairly sure Linux would not be portable to an architecture like this
without a major development effort.

> If the compiler changes the padding in the struct, the driver will
> break, as the struct layout is tightly defined by the anybus spec.
>
> Would it be better to stay safe, and keep __packed in case of such
> tightly defined structures?

Generally I think it does more harm than good. If you require
__packed attributes for correct structure layout,
then only apply it to those members that are not naturally
aligned, and mark the structure itself as __aligned(n) with
the alignment you expect if that makes a difference.

        Arnd
