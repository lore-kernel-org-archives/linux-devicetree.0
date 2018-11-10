From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH anybus v3 4/6] bus: support HMS Anybus-S bus
Date: Sat, 10 Nov 2018 11:55:42 +0100
Message-ID: <CAMuHMdVgEQzf_CR79R0dtWVDTtQUj-YUbYPSqg2XkzxQoDz0Lw@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-5-TheSven73@googlemail.com> <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
 <CAGngYiWxhSbLLsPaRZ90wEMhhF7e1jt06ZhhRcuhjM53-RYRwg@mail.gmail.com> <CAK8P3a3=2PUy4Zv9r7oN3Jrp6+vf5iZ+3wi2VNee61mmnFsXNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3=2PUy4Zv9r7oN3Jrp6+vf5iZ+3wi2VNee61mmnFsXNA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: thesven73@gmail.com, svendev@arcx.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Greg KH <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, Maxime Ripard <maxim>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 9, 2018 at 10:03 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Nov 9, 2018 at 5:25 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> > On Thu, Nov 8, 2018 at 9:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > +struct anybus_mbox_hdr {
> > > > +       u16 id;
> > > > +       u16 info;
> > > > +       u16 cmd_num;
> > > > +       u16 data_size;
> > > > +       u16 frame_count;
> > > > +       u16 frame_num;
> > > > +       u16 offset_high;
> > > > +       u16 offset_low;
> > > > +       u16 extended[8];
> > > > +} __packed;
> > >
> > > I don't think you want this to be __packed, it won't change the layout
> > > but instead force byte accesses on architectures that don't have
> > > fast unaligned load/store instructions.
> > >
> > > Instead of the __packed, it's almost always better to ensure that
> > > the structure itself is aligned to a 16-bit address.
> > >
> >
> > A general question about __packed.
> >
> > My current understanding is this:
> > (please tell me if it's incorrect or incomplete)
> >
> > + without __packed, the compiler is free to pad the struct in whatever
> > way it feels is best.
> > + with __packed, the fields have to be laid out EXACTLY as specified.
>
> It's not up to the compiler but the ELF ABI. The rules are largely consisten
> among the architectures we support, but there are a couple of notable
> exceptions:
>
> - ARM OABI requires 32-bit alignment for structures
> - x86-32 aligns 64-bit members to 32-bit rather than 64-bit
> - m68k has some oddities, I think they can pack certain
>   members (don't remember the details)

M68k aligns 16-bit and larger members to 16-bit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
