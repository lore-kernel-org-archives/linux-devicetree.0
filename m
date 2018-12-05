From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Wed, 5 Dec 2018 17:32:19 -0500
Message-ID: <CAGngYiWG74nDt1_hN0-bKCDRxm-f=N-Rnjtk02Vd7dgKtGRaBA@mail.gmail.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com> <20181205101659.GA27058@kroah.com>
 <CAGngYiXXrrqGxTt339EP53tschLgZ82eRGvGifHQw6pg=C88+Q@mail.gmail.com> <20181205191724.GA434@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205191724.GA434@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Thanks :)

On Wed, Dec 5, 2018 at 2:17 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Great, then call it a 'fieldbus' class, not "fieldbus_dev' class.

Small nit:

Hardware connected to a fieldbus comes in two distinct flavours:
- clients (e.g. thermometer, robotic arm) called "fieldbus devices"
- servers (e.g. a PLC) called "fieldbus controllers"

Their userspace APIs will probably differ quite a lot.

The userspace API created by the patch is only for clients a.k.a.
"fieldbus devices". That's why I'm writing 'fieldbus_dev' all over the place.

For simplicity, we could change that to just 'fieldbus'. But would this get
us in trouble when, at some point, we want to add a userspace API for
servers a.k.a. "fieldbus controllers" ?
