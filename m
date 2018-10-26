From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v1 1/4] mfd: support the Arcx anybus bridge.
Date: Fri, 26 Oct 2018 09:40:21 -0400
Message-ID: <CAGngYiVZ3y2Y4Wg=CEqoO+C0Mr1CYspON1C=Kmb-vq=kxs5bUg@mail.gmail.com>
References: <20181024142456.10084-1-svendev@arcx.com> <20181024142456.10084-2-svendev@arcx.com>
 <20181026083410.GO4870@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026083410.GO4870@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, john.garry@huawei.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, Stuart Yoder <stuyoder@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Wow, this driver is going to need a lot of work.

I'm open to reworking this 5 times if need be :)

>
> But before we get going, how many sub-devices does this have?

This is a custom piece of h/w which exposes two anybus-S slots, plus a
power readout in sysfs, I wasn't quite sure if mfd is the right
abstraction for this.
