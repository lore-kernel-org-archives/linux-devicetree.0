From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 1/6] misc: support the Arcx anybus bridge
Date: Thu, 8 Nov 2018 14:40:00 +0100
Message-ID: <CAK8P3a3uS5wbNwmGGdYqEFdVi0ErzG7_6yaMheAACh6Tta+DZQ@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-2-TheSven73@googlemail.com> <20181105212049.GA320@bogus>
 <CAGngYiUZTm-r0KJ07tKsPmgKCUWcqAOx2S82iLPRjkcDiw0R3g@mail.gmail.com>
 <CAL_JsqLgz9Z3J0x+QFU6jHOoHn6A1KASc+HbVLnW1=ow0RHv6w@mail.gmail.com>
 <CAGngYiXczK6dsfyDGxe1ym-vQQfH5XS0jeEkuWW_og23JmTAZg@mail.gmail.com>
 <CAL_Jsq+YeW+BtVh=L8PBjXYLj9sp91BcUQrJJrwnmChRnXoK_w@mail.gmail.com> <CAGngYiXfmD-EVKcN-L1fBOgyX4JrMqRx295F1p90shygL7zccg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiXfmD-EVKcN-L1fBOgyX4JrMqRx295F1p90shygL7zccg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: Rob Herring <robh@kernel.org>, svendev@arcx.com, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, noralf@tronnes.org, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.ripa>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2018 at 9:05 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> On Tue, Nov 6, 2018 at 1:31 PM Rob Herring <robh@kernel.org> wrote:
>
> > If the host is not a h/w component, but just a s/w protocol then it
> > doesn't belong in DT. Perhaps it could be a library which the bridge
> > driver can call into.
>
> Anybus cards have an id register, which identifies what they are, so
> that the appropriate client driver may be instantiated.
> In that sense anybus is very suited to the bus/client abstraction of
> pci/usb/etc.
>
> > What are the resets connected to? The slots? Maybe you should model
> > the slots in DT.
> >
>
> Yes, the resets are ultimately connected to the slots.
> I'm happy to model the slots in DT. It makes sense, they are physical,
> hardware components.

It may also be necessary to have a way to add more DT properties to
a device in the slot that can not be probed by looking at the ID
register. Ideally it should not be needed, but we have added this
to most buses anyway: USB, PCI, MMC and others can all be
probed automatically for many devices, but there are some devices
that need a place where extra information can be stored, e.g.
an ethernet MAC address (in the absence of a PROM), an
external clock or reset line that is not part of the normal protocol,
or a more specific identification when two devices accidentally
have the same ID.

       Arnd
