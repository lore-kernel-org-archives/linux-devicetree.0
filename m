From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 4/6] bus: support HMS Anybus-S bus
Date: Thu, 8 Nov 2018 17:54:10 +0100
Message-ID: <CAK8P3a1q-09=5z4KZPWdpT-T=Tg244HpyN1Cd5=0pDGkQV7aPA@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-5-TheSven73@googlemail.com> <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
 <CAGngYiXEsg-6MXK60s8gOq2d8LGq+USTk1FC3GYqy2TQheaxHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiXEsg-6MXK60s8gOq2d8LGq+USTk1FC3GYqy2TQheaxHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, noralf@tronnes.org, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.r>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 4:47 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> On Thu, Nov 8, 2018 at 9:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > I see this is called from the interrupt handler at the moment, which
> > means you cannot call sleeping functions, but it also means that
> > the timeout may never happen because the timer tick IRQ cannot
> > get through. That means you may have to change the irq handler
> > logic, e.g. to try this a few times but then defer to a bottom half
> > if it fails for a long time.
>
> Touche ! Yes, this is very likely a big problem.
>
> What if I converted the interrupt handler into a threaded interrupt handler?
> That would allow the timer tick to get through, correct?

Yes, with a threaded IRQ handler, the tick comes through, and you can
use a sleeping function to back off between the retries.

        Arnd
