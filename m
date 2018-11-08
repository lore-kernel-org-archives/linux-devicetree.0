From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 6/6] misc: support HMS Profinet IRT industrial controller
Date: Thu, 8 Nov 2018 17:52:54 +0100
Message-ID: <CAK8P3a0qezBc_TQ+jtrkvnwkp7wROByzqBKYvDAgno2Wh-g9Wg@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-7-TheSven73@googlemail.com> <CAK8P3a3apbxNa2FpADvdLCe-GzV+2xv2kO1_tosOZrUpY6xWtA@mail.gmail.com>
 <CAGngYiWvZze2wd-p4avhwGHap=RCO2XPcwShYWPRcs59c3q65A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiWvZze2wd-p4avhwGHap=RCO2XPcwShYWPRcs59c3q65A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, noralf@tronnes.org, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.r>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 4:35 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> On Thu, Nov 8, 2018 at 9:20 AM Arnd Bergmann <arnd@arndb.de> wrote:
 > > +       struct {
> > > +               /* addresses IN NETWORK ORDER! */
> > > +               __u32 ip_addr;
> > > +               __u32 subnet_msk;
> > > +               __u32 gateway_addr;
> > > +               __u8  is_valid:1;
> > > +       } eth;
> >
> > Overall, this structure feels too complex for an ioctl interface,
> > with the nested structures. If we end up keeping that
> > ioctl, maybe at least make it a flat structure without padding,
> > or alternatively make it a set of separate ioctls.
> >
>
> I agree that it feels complex, but it's the best I could come up with.
> There are a few hidden constraints:
>
> 1. The profinet card configuration settings must be applied atomically.
> And they can only be applied right after device reset.
>
> So if we use smaller, separate ioctls, we will end up resetting the device
> each time we send an ioctl. And to assemble a real configuration, we need
> 5 or 6 ioctls, so the card gets reset 5 or 6 times, which takes ages.
> It cannot work this way.
>
> 2. Configuration settings are optional. That's why why each little struct
> has an is_valid member. If we use a flatter structure, we need a bool for
> every config setting in the struct, to indicate if it should be applied.
> Which feels clunky.

I think a more common way to do this would be to use a __u64
member containing a bitmask of which fields are valid.

> One way to overcome this is by letting the ioctls change data in the driver,
> but not on the card. Then a separate "apply" ioctl could apply the whole
> configuration atomically.
>
> Example:
> ioctl(clear all settings?);
> ioctl(set ip address);
> ioctl(set stop mode action);
> ioctl(enable internal webserver);
> ioctl(apply);
>
> But of course, what happens if two processes try to configure the
> driver at the same time?
> The ioctl calls would be interleaved, and the result would be very messy...
>
> There must be a better way?

In particular the bits about optional fields would fit much better
into netlink, which is a kind of TLV interface, and you can send
a number of configuration steps in one 'sendmsg' syscall,
but leave out the ones that you are not interested in.

This would also allow you to specify standard parameters that
could apply to multiple vendors or fieldbus protocols, and have
a common configuration tool for all of them.

       Arnd
