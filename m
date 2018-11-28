From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v4 1/7] fieldbus_dev: add Fieldbus Device subsystem.
Date: Wed, 28 Nov 2018 14:39:55 -0500
Message-ID: <CAGngYiXYVoesCQyf4+trM1V4ydwasrZnx_CqSDzQGHM-v81ZZA@mail.gmail.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
 <20181121150709.6030-2-TheSven73@googlemail.com> <20181127075431.GG13965@kroah.com>
 <CAGngYiUL7bZVEehj4LGC2H+kv+Z4v_s=tG4uosOp1-Rc4_pGWw@mail.gmail.com>
 <20181128174238.GA4367@kroah.com> <CAGngYiXqscqVtSUkwwKGGweOgMm=E=W8nbxOXAbpeyYsk=5B0g@mail.gmail.com>
 <20181128183622.GA9236@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128183622.GA9236@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 1:36 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> So you still need a char device, and you will have have a load of them,
> just use the misc device api.  It's simple, clean, and is hard to get
> wrong.  The cdev api is hard, complex, and trivial to get wrong in any
> number of different ways that it can be used :)

Awesome little nugget! These things you just can't tell by reading the kernel
tree. In many cases, it's not immediately obvious to me which of the various
methods are 'recommended', and which ones are historic leftovers.

> And your /sys/class/fieldbus_dev/ is "interesting", why name it that?

Not sure why it's interesting? I figured it would allow userspace to enumerate
all fieldbus devices simply by going to /sys/class/fieldbus_dev/ and process
every subdirectory.

Example with 3 fieldbus cards:
/sys/class/fieldbus_dev/fieldbus_dev0/name etc
/sys/class/fieldbus_dev/fieldbus_dev1/name etc
/sys/class/fieldbus_dev/fieldbus_dev2/name etc

Is there a better way?

> So keep submitting, I'll try to review it the next time around, and all
> should be fine.  But keep your user api as simple as possible for now,
> only doing what you need it to do, worry about future stuff then.

Thanks, that's awesome !!

I figured that I should take baby steps. I simplified the userspace API to the
absolute bare minimum. To the point that the profinet card isn't useable in
our company's specific use case, because there's no configuration API yet.

> Why not just /sys/class/fieldbus/ ?  No need for "dev", right?

Good question... Two very different classes of devices sit on a fieldbus:
Fieldbus device     is like a slave
Fieldbus controller is like a master

This subsystem is specific for fieldbus *devices*. I figured I'd encode this
in the API name, in case someone wants to support fieldbus controllers later.
