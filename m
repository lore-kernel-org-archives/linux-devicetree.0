From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Wed, 5 Dec 2018 20:17:24 +0100
Message-ID: <20181205191724.GA434@kroah.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com>
 <20181205101659.GA27058@kroah.com>
 <CAGngYiXXrrqGxTt339EP53tschLgZ82eRGvGifHQw6pg=C88+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGngYiXXrrqGxTt339EP53tschLgZ82eRGvGifHQw6pg=C88+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 05, 2018 at 10:39:56AM -0500, Sven Van Asbroeck wrote:
> Hello Greg, thanks for the feedback!
> 
> On Wed, Dec 5, 2018 at 5:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > And why is this a class and not just a "normal" device and bus?  Devices
> > live on busses, not generally as a class.  Can your devices live on
> > different types of busses (USB, PCI, etc.)?
> 
> This patchset can be a bit confusing, because it doesn't just add support for a
> single fieldbus device - it proposes a general fieldbus subsystem.

Great, then call it a 'fieldbus' class, not "fieldbus_dev' class.

Devices can belong to a bus, or a class, so you are fine here.

> Fieldbus devices from different vendors can sit on the usb, i2c, pci, etc.
> buse, but they all register as a fieldbus device, via fieldbus_dev_register(),
> and show up as a fieldbus class member.

ok, I'm just complaining about your name in sysfs, not your code :)

I think what you did here is correct from a logic point of view.

> Userspace can then enumerate all fieldbus devices connected to the system by
> looking at the class. Without having to know which bus they happen to be
> connected to.

Sounds reasonable.

nice work,

greg k-h
