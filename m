From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Wed, 5 Dec 2018 23:50:48 +0100
Message-ID: <CAK8P3a2+ehccfdD7kwo=ev6P7Oka7CqEiq6BgkjUafFRwgnTQQ@mail.gmail.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com> <20181205101659.GA27058@kroah.com>
 <CAGngYiXXrrqGxTt339EP53tschLgZ82eRGvGifHQw6pg=C88+Q@mail.gmail.com>
 <20181205191724.GA434@kroah.com> <CAGngYiWG74nDt1_hN0-bKCDRxm-f=N-Rnjtk02Vd7dgKtGRaBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiWG74nDt1_hN0-bKCDRxm-f=N-Rnjtk02Vd7dgKtGRaBA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: gregkh <gregkh@linuxfoundation.org>, svendev@arcx.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, noralf@tronnes.org, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.r>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 11:32 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
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
>
> The userspace API created by the patch is only for clients a.k.a.
> "fieldbus devices". That's why I'm writing 'fieldbus_dev' all over the place.
>
> For simplicity, we could change that to just 'fieldbus'. But would this get
> us in trouble when, at some point, we want to add a userspace API for
> servers a.k.a. "fieldbus controllers" ?

In the long run, would you expect to support more devices or more
controllers that need a distinct driver? Whichever we have more of should
probably get the shorter name.

      Arnd
