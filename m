From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 4/6] bus: support HMS Anybus-S bus
Date: Fri, 9 Nov 2018 11:25:09 -0500
Message-ID: <CAGngYiWxhSbLLsPaRZ90wEMhhF7e1jt06ZhhRcuhjM53-RYRwg@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-5-TheSven73@googlemail.com> <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 9:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > +struct anybus_mbox_hdr {
> > +       u16 id;
> > +       u16 info;
> > +       u16 cmd_num;
> > +       u16 data_size;
> > +       u16 frame_count;
> > +       u16 frame_num;
> > +       u16 offset_high;
> > +       u16 offset_low;
> > +       u16 extended[8];
> > +} __packed;
>
> I don't think you want this to be __packed, it won't change the layout
> but instead force byte accesses on architectures that don't have
> fast unaligned load/store instructions.
>
> Instead of the __packed, it's almost always better to ensure that
> the structure itself is aligned to a 16-bit address.
>

A general question about __packed.

My current understanding is this:
(please tell me if it's incorrect or incomplete)

+ without __packed, the compiler is free to pad the struct in whatever
way it feels is best.
+ with __packed, the fields have to be laid out EXACTLY as specified.

Is it possible that someone will compile this on an architecture that 'likes'
16-bit ints to be 32-bit aligned? If such an architecture does not currently
exist, could it appear in the future?

If the compiler changes the padding in the struct, the driver will
break, as the struct layout is tightly defined by the anybus spec.

Would it be better to stay safe, and keep __packed in case of such
tightly defined structures?
