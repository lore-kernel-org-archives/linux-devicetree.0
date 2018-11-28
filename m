From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v4 1/7] fieldbus_dev: add Fieldbus Device subsystem.
Date: Wed, 28 Nov 2018 10:39:41 -0500
Message-ID: <CAGngYiUL7bZVEehj4LGC2H+kv+Z4v_s=tG4uosOp1-Rc4_pGWw@mail.gmail.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
 <20181121150709.6030-2-TheSven73@googlemail.com> <20181127075431.GG13965@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127075431.GG13965@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Wow Greg, thanks for the review, this is awesome !!

On Tue, Nov 27, 2018 at 2:54 AM Greg KH <gregkh@linuxfoundation.org> wrote:

>> +     cdev_init(&fb->cdev, &fieldbus_fops);
>> +     err = cdev_add(&fb->cdev, devno, 1);
>> +     if (err) {
>> +             pr_err("fieldbus_dev%d unable to add device %d:%d\n",
>> +                     fb->id, MAJOR(fieldbus_devt), fb->id);
>> +             goto err_cdev;
>> +     }
>
> Why do you have a static cdev?

The proposed fieldbus API needs a single /dev/fieldbus_devX node for every
device. I just looked around the drivers/ tree to see how others accomplish
this.

Is there a better way?

>> +     fb->online_sd = sysfs_get_dirent(fb->dev->kobj.sd, "online");
>
> Ick, what?  Why?  Why are you messing around with a raw sysfs attribute?

The proposed fieldbus API has a sysfs attribute that can be poll/select'ed on.
Is this behaviour still allowed / ok?
If so, you're saying that I should not store the raw attribute, but just do:
sysfs_notify(&fb->dev->kobj, NULL, "online") ?

Now that I (hopefully) have a few seconds of your attention...
I suppose the fieldbus API in this patch can't go anywhere, without buy-in from
multiple people who also want to use fieldbus. Right now, there are none.

This might be a chicken-and-egg problem. Perhaps here are no fieldbus
devices because
there's no good general API. There's no good general API because there are no
fieldbus devices yet.

 Is there a tried and tested way to break this deadlock?
