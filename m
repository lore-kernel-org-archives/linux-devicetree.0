From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH anybus v4 1/7] fieldbus_dev: add Fieldbus Device
 subsystem.
Date: Wed, 28 Nov 2018 18:42:38 +0100
Message-ID: <20181128174238.GA4367@kroah.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
 <20181121150709.6030-2-TheSven73@googlemail.com>
 <20181127075431.GG13965@kroah.com>
 <CAGngYiUL7bZVEehj4LGC2H+kv+Z4v_s=tG4uosOp1-Rc4_pGWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGngYiUL7bZVEehj4LGC2H+kv+Z4v_s=tG4uosOp1-Rc4_pGWw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 10:39:41AM -0500, Sven Van Asbroeck wrote:
> Wow Greg, thanks for the review, this is awesome !!
> 
> On Tue, Nov 27, 2018 at 2:54 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> >> +     cdev_init(&fb->cdev, &fieldbus_fops);
> >> +     err = cdev_add(&fb->cdev, devno, 1);
> >> +     if (err) {
> >> +             pr_err("fieldbus_dev%d unable to add device %d:%d\n",
> >> +                     fb->id, MAJOR(fieldbus_devt), fb->id);
> >> +             goto err_cdev;
> >> +     }
> >
> > Why do you have a static cdev?
> 
> The proposed fieldbus API needs a single /dev/fieldbus_devX node for every
> device. I just looked around the drivers/ tree to see how others accomplish
> this.
> 
> Is there a better way?

It depends on what you want to do with this device node.  You can use a
static one in your structure if you use it to "cast back" to your real
structure in the open() call, do you do that?  If not, just create one
dynamically.

Or use a misc device?  How many of these do you need?

> >> +     fb->online_sd = sysfs_get_dirent(fb->dev->kobj.sd, "online");
> >
> > Ick, what?  Why?  Why are you messing around with a raw sysfs attribute?
> 
> The proposed fieldbus API has a sysfs attribute that can be poll/select'ed on.
> Is this behaviour still allowed / ok?

For an online/offline attribute, no need to poll on it, just do a
'kobject change' event for online/offline and all should be fine.  This
is not a high-frequency event, right?

> Now that I (hopefully) have a few seconds of your attention...
> I suppose the fieldbus API in this patch can't go anywhere, without buy-in from
> multiple people who also want to use fieldbus. Right now, there are none.

Hey, if no one wants to use it, either no need to write any code at all,
or you get to decide everything.  Either way, you're in charge!  :)

But you do need to document the thing, in Documentation/ABI/ to get it
correct and able to be reviewed.

thanks,

greg k-h
