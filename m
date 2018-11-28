From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v4 1/7] fieldbus_dev: add Fieldbus Device subsystem.
Date: Wed, 28 Nov 2018 13:19:05 -0500
Message-ID: <CAGngYiXqscqVtSUkwwKGGweOgMm=E=W8nbxOXAbpeyYsk=5B0g@mail.gmail.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
 <20181121150709.6030-2-TheSven73@googlemail.com> <20181127075431.GG13965@kroah.com>
 <CAGngYiUL7bZVEehj4LGC2H+kv+Z4v_s=tG4uosOp1-Rc4_pGWw@mail.gmail.com> <20181128174238.GA4367@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128174238.GA4367@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 12:42 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> It depends on what you want to do with this device node.  You can use a
> static one in your structure if you use it to "cast back" to your real
> structure in the open() call, do you do that?

I do...

static int fieldbus_open(struct inode *inode, struct file *filp)
{
        struct fieldbus_dev *fbdev = container_of(inode->i_cdev,
                                                struct fieldbus_dev,
                                                cdev);

> Or use a misc device?  How many of these do you need?

Just one per fieldbus device.
But my main concern is naming in sysfs. A misc device will always show up as
/sys/class/misc/..., right? Given that this is a userspace fieldbus API,
we'd prefer /sys/class/fieldbus_dev/..., and cdev is the only way?

> For an online/offline attribute, no need to poll on it, just do a
> 'kobject change' event for online/offline and all should be fine.  This
> is not a high-frequency event, right?

Grepping... you mean kobject_uevent(KOBJ_CHANGE) ?
THAT mechanism seems to fit much better, thanks !!

> Hey, if no one wants to use it, either no need to write any code at all,
> or you get to decide everything.  Either way, you're in charge!  :)

I did get the impression that people are reluctant to take my patch partly
because of an unproven userspace API. Maybe they are (rightly) worried that,
once in, we will have to support this userspace API for evermore.

I'd love to get others involved in Fieldbus on Linux, but I'm not sure
how.

> But you do need to document the thing, in Documentation/ABI/ to get it
> correct and able to be reviewed.

The documentation is already included in this patch? Should I indicate this
in some standardized fashion?

 create mode 100644 Documentation/ABI/testing/fieldbus-dev-cdev
 create mode 100644 Documentation/ABI/testing/sysfs-class-fieldbus-dev

Thanks :)
Sven
