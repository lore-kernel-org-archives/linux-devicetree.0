From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH anybus v2 1/5] misc: support the Arcx anybus bridge.
Date: Thu, 1 Nov 2018 22:53:46 +0100
Message-ID: <CACRpkdZkv6ikrFmJptBTwftj7TkR5Bce9e2R1ceTw_pLqH1LcA@mail.gmail.com>
References: <20181031194425.32132-1-TheSven73@googlemail.com>
 <20181031194425.32132-2-TheSven73@googlemail.com> <CACRpkdai-6iNbz4EGuHNHkQYyR+yhTEJdRXP4G6fUKpA+XApjQ@mail.gmail.com>
 <CAGngYiVorxYY+8e75068i4=PJi1gEvnGkgvBfi0+9H+c1qD-oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiVorxYY+8e75068i4=PJi1gEvnGkgvBfi0+9H+c1qD-oQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, svendev@arcx.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Greg KH <gregkh@linuxfoundation.org>, john.garry@huawei.com, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime
List-Id: devicetree@vger.kernel.org

On Thu, Nov 1, 2018 at 6:17 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:

> >> +static DEVICE_ATTR_RO(version);
> >
> > Do you need this in userspace really?
> >
> >> +static DEVICE_ATTR_RO(design_number);
> >
> > And this?
>
> Unfortunately, I do :(
> The application software reads these out and displays them in an UI. It's
> important to be able to see these on a running device.

OK...

> Perhaps there is another kernel abstraction I could use?

I don't think so. If you want to be pedantic, document the sysfs
files in Documentation/ABI/testing/sysfs-*

Maybe the properties should be on the bus though? I don't know :/

Yours,
Linus Walleij
