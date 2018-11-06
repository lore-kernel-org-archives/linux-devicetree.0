From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 1/6] misc: support the Arcx anybus bridge
Date: Tue, 6 Nov 2018 15:05:24 -0500
Message-ID: <CAGngYiXfmD-EVKcN-L1fBOgyX4JrMqRx295F1p90shygL7zccg@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-2-TheSven73@googlemail.com> <20181105212049.GA320@bogus>
 <CAGngYiUZTm-r0KJ07tKsPmgKCUWcqAOx2S82iLPRjkcDiw0R3g@mail.gmail.com>
 <CAL_JsqLgz9Z3J0x+QFU6jHOoHn6A1KASc+HbVLnW1=ow0RHv6w@mail.gmail.com>
 <CAGngYiXczK6dsfyDGxe1ym-vQQfH5XS0jeEkuWW_og23JmTAZg@mail.gmail.com> <CAL_Jsq+YeW+BtVh=L8PBjXYLj9sp91BcUQrJJrwnmChRnXoK_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+YeW+BtVh=L8PBjXYLj9sp91BcUQrJJrwnmChRnXoK_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sven Van Asbroeck <svendev@arcx.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2018 at 1:31 PM Rob Herring <robh@kernel.org> wrote:

> If the host is not a h/w component, but just a s/w protocol then it
> doesn't belong in DT. Perhaps it could be a library which the bridge
> driver can call into.

Anybus cards have an id register, which identifies what they are, so
that the appropriate client driver may be instantiated.
In that sense anybus is very suited to the bus/client abstraction of
pci/usb/etc.

> What are the resets connected to? The slots? Maybe you should model
> the slots in DT.
>

Yes, the resets are ultimately connected to the slots.
I'm happy to model the slots in DT. It makes sense, they are physical,
hardware components.

>
> A block diagram would help. Something that shows the host SoC, your
> CPLD, reset, irq, etc.
>

  +------------------------------------------------------------------------+
  |                                  SOC (i.MX6)                           |
  |------------------------------------------------------------------------|
  |     i.MX WEIM bus                                   | i.MX GPIO        |
  +------------------------------------------------------------------------+
                ^                                              ^ ^
                | parallel bus                                 | | irq x2
                v                                              | |
  +------------------------------------------------------------------------+
  |                                     CPLD                               |
  |------------------------------------------------------------------------|
  |             anybus slot 1             ||            anybus slot 2      |
  |------------------------------------------------------------------------|
  | memory bus               | irq| reset || memory bus       | irq| reset |
  +------------------------------------------------------------------------+
                ^                                               ^
                |                                               |
                v                                               v
  +--------------------------------------+ +-------------------------------+
  |          anybus card                 | |           anybus card         |
  +--------------------------------------+ +-------------------------------+
