From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 4/6] bus: support HMS Anybus-S bus
Date: Thu, 8 Nov 2018 10:47:20 -0500
Message-ID: <CAGngYiXEsg-6MXK60s8gOq2d8LGq+USTk1FC3GYqy2TQheaxHg@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-5-TheSven73@googlemail.com> <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 9:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> It looks like you build your own object management here. Maybe
> use kobject, or at least kref instead of the refcount_t based
> low-level implementation?

Excellent point. I'll replace with krefs.

>
>
> I see this is called from the interrupt handler at the moment, which
> means you cannot call sleeping functions, but it also means that
> the timeout may never happen because the timer tick IRQ cannot
> get through. That means you may have to change the irq handler
> logic, e.g. to try this a few times but then defer to a bottom half
> if it fails for a long time.

Touche ! Yes, this is very likely a big problem.

What if I converted the interrupt handler into a threaded interrupt handler?
That would allow the timer tick to get through, correct?

Point taken about cpu_relax(), I will fix.
