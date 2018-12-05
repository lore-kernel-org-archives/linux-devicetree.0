From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Wed, 5 Dec 2018 10:39:56 -0500
Message-ID: <CAGngYiXXrrqGxTt339EP53tschLgZ82eRGvGifHQw6pg=C88+Q@mail.gmail.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com> <20181205101659.GA27058@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205101659.GA27058@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Greg, thanks for the feedback!

On Wed, Dec 5, 2018 at 5:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> And why is this a class and not just a "normal" device and bus?  Devices
> live on busses, not generally as a class.  Can your devices live on
> different types of busses (USB, PCI, etc.)?

This patchset can be a bit confusing, because it doesn't just add support for a
single fieldbus device - it proposes a general fieldbus subsystem.

Fieldbus devices from different vendors can sit on the usb, i2c, pci, etc.
buse, but they all register as a fieldbus device, via fieldbus_dev_register(),
and show up as a fieldbus class member.

Userspace can then enumerate all fieldbus devices connected to the system by
looking at the class. Without having to know which bus they happen to be
connected to.

If there is an abstraction in Linux that's a better fit, I'm very open to
making changes.

Sven
