From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Thu, 6 Dec 2018 15:07:50 +0100
Message-ID: <20181206140750.GB18947@kroah.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com>
 <20181205101659.GA27058@kroah.com>
 <CAGngYiXXrrqGxTt339EP53tschLgZ82eRGvGifHQw6pg=C88+Q@mail.gmail.com>
 <20181205191724.GA434@kroah.com>
 <CAGngYiWG74nDt1_hN0-bKCDRxm-f=N-Rnjtk02Vd7dgKtGRaBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGngYiWG74nDt1_hN0-bKCDRxm-f=N-Rnjtk02Vd7dgKtGRaBA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 05, 2018 at 05:32:19PM -0500, Sven Van Asbroeck wrote:
> Thanks :)
> 
> On Wed, Dec 5, 2018 at 2:17 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Great, then call it a 'fieldbus' class, not "fieldbus_dev' class.
> 
> Small nit:
> 
> Hardware connected to a fieldbus comes in two distinct flavours:
> - clients (e.g. thermometer, robotic arm) called "fieldbus devices"
> - servers (e.g. a PLC) called "fieldbus controllers"
> 
> Their userspace APIs will probably differ quite a lot.

But servers are going to be much more rare, and odds are userspace is
not going to need to control anything with them, right?

> The userspace API created by the patch is only for clients a.k.a.
> "fieldbus devices". That's why I'm writing 'fieldbus_dev' all over the place.
> 
> For simplicity, we could change that to just 'fieldbus'. But would this get
> us in trouble when, at some point, we want to add a userspace API for
> servers a.k.a. "fieldbus controllers" ?

Ick, yeah, I guess so, but planning for future events is not something
we do well at all.  Are you sure you will need fieldbus controllers as a
class?

And as these are really devices, why not make them a "device" and a bus?
What type of topology do you have on these busses?  Are everything
"flat" and connected directly to a PCI/USB/platform device?  Or are
there multiple devices attached to a single controller?

It really feels like you want to use 'struct device' and a bus_type and
not a class here to me...

thanks,

greg k-h
