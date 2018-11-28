From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH anybus v4 1/7] fieldbus_dev: add Fieldbus Device
 subsystem.
Date: Wed, 28 Nov 2018 19:36:22 +0100
Message-ID: <20181128183622.GA9236@kroah.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
 <20181121150709.6030-2-TheSven73@googlemail.com>
 <20181127075431.GG13965@kroah.com>
 <CAGngYiUL7bZVEehj4LGC2H+kv+Z4v_s=tG4uosOp1-Rc4_pGWw@mail.gmail.com>
 <20181128174238.GA4367@kroah.com>
 <CAGngYiXqscqVtSUkwwKGGweOgMm=E=W8nbxOXAbpeyYsk=5B0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGngYiXqscqVtSUkwwKGGweOgMm=E=W8nbxOXAbpeyYsk=5B0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 01:19:05PM -0500, Sven Van Asbroeck wrote:
> On Wed, Nov 28, 2018 at 12:42 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > It depends on what you want to do with this device node.  You can use a
> > static one in your structure if you use it to "cast back" to your real
> > structure in the open() call, do you do that?
> 
> I do...
> 
> static int fieldbus_open(struct inode *inode, struct file *filp)
> {
>         struct fieldbus_dev *fbdev = container_of(inode->i_cdev,
>                                                 struct fieldbus_dev,
>                                                 cdev);

Ok, good, that's a nice way to use this, nevermind my objection.

> > Or use a misc device?  How many of these do you need?
> 
> Just one per fieldbus device.
> But my main concern is naming in sysfs. A misc device will always show up as
> /sys/class/misc/..., right? Given that this is a userspace fieldbus API,
> we'd prefer /sys/class/fieldbus_dev/..., and cdev is the only way?

Ah, the common misunderstanding.

A cdev has NOTHING to do with the /sys/class/ entries.  It is only there
to register a char device with the kernel core and to handle the file
operations that are caused by it.  It does not do much, and not even the
/dev/NODE stuff either.  That is up to your class device code.

So you still need a char device, and you will have have a load of them,
just use the misc device api.  It's simple, clean, and is hard to get
wrong.  The cdev api is hard, complex, and trivial to get wrong in any
number of different ways that it can be used :)

That being said, it looks like you used it correctly, so all should be
fine here.

And your /sys/class/fieldbus_dev/ is "interesting", why name it that?

> > For an online/offline attribute, no need to poll on it, just do a
> > 'kobject change' event for online/offline and all should be fine.  This
> > is not a high-frequency event, right?
> 
> Grepping... you mean kobject_uevent(KOBJ_CHANGE) ?
> THAT mechanism seems to fit much better, thanks !!

Yes, use that please.

> > Hey, if no one wants to use it, either no need to write any code at all,
> > or you get to decide everything.  Either way, you're in charge!  :)
> 
> I did get the impression that people are reluctant to take my patch partly
> because of an unproven userspace API. Maybe they are (rightly) worried that,
> once in, we will have to support this userspace API for evermore.
> 
> I'd love to get others involved in Fieldbus on Linux, but I'm not sure
> how.

Adding a new driver subsystem is messy, it takes a lot of work and
finding the right reviewers is hard.  It's not just you, it happens all
the time (look at how long the i3c code took to get merged as one
example...)

So keep submitting, I'll try to review it the next time around, and all
should be fine.  But keep your user api as simple as possible for now,
only doing what you need it to do, worry about future stuff then.


> > But you do need to document the thing, in Documentation/ABI/ to get it
> > correct and able to be reviewed.
> 
> The documentation is already included in this patch? Should I indicate this
> in some standardized fashion?
> 
>  create mode 100644 Documentation/ABI/testing/fieldbus-dev-cdev
>  create mode 100644 Documentation/ABI/testing/sysfs-class-fieldbus-dev

Ah, sorry, I didn't read it, my fault :(

Why not just /sys/class/fieldbus/ ?  No need for "dev", right?

greg k-h
