From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 6/6] misc: support HMS Profinet IRT industrial controller
Date: Thu, 8 Nov 2018 10:35:18 -0500
Message-ID: <CAGngYiWvZze2wd-p4avhwGHap=RCO2XPcwShYWPRcs59c3q65A@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-7-TheSven73@googlemail.com> <CAK8P3a3apbxNa2FpADvdLCe-GzV+2xv2kO1_tosOZrUpY6xWtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3apbxNa2FpADvdLCe-GzV+2xv2kO1_tosOZrUpY6xWtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

These are great questions, I had been wondering when they would be brought up :)

On Thu, Nov 8, 2018 at 9:20 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> I don't understand much about field bus, but I have a general feeling
> that if you configure a mac address and IP address, this should
> be connect ed to the network layer in some form, possibly being
> exposed as a network device and manipulated using netlink
> instead of sysfs or ioctl.
>
> Can you explain how this fits together and why you got the the
> sysfs interface?

I started typing here how a fieldbus differs from a networking
device, and how it does not fit in the kernel abstraction for
networking devices.

Then I started explaining the "roll my own" userspace API I created
for fieldbus devices... and it hit me. There is already a fieldbus API !

include/linux/uio_driver.h

Let me go and check how well it fits with what my device needs.


> > +       struct {
> > +               /* addresses IN NETWORK ORDER! */
> > +               __u32 ip_addr;
> > +               __u32 subnet_msk;
> > +               __u32 gateway_addr;
> > +               __u8  is_valid:1;
> > +       } eth;
>
> Overall, this structure feels too complex for an ioctl interface,
> with the nested structures. If we end up keeping that
> ioctl, maybe at least make it a flat structure without padding,
> or alternatively make it a set of separate ioctls.
>

I agree that it feels complex, but it's the best I could come up with.
There are a few hidden constraints:

1. The profinet card configuration settings must be applied atomically.
And they can only be applied right after device reset.

So if we use smaller, separate ioctls, we will end up resetting the device
each time we send an ioctl. And to assemble a real configuration, we need
5 or 6 ioctls, so the card gets reset 5 or 6 times, which takes ages.
It cannot work this way.

2. Configuration settings are optional. That's why why each little struct
has an is_valid member. If we use a flatter structure, we need a bool for
every config setting in the struct, to indicate if it should be applied.
Which feels clunky.

One way to overcome this is by letting the ioctls change data in the driver,
but not on the card. Then a separate "apply" ioctl could apply the whole
configuration atomically.

Example:
ioctl(clear all settings?);
ioctl(set ip address);
ioctl(set stop mode action);
ioctl(enable internal webserver);
ioctl(apply);

But of course, what happens if two processes try to configure the
driver at the same time?
The ioctl calls would be interleaved, and the result would be very messy...

There must be a better way?
