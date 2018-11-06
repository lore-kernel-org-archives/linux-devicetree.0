From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH anybus v3 1/6] misc: support the Arcx anybus bridge
Date: Tue, 6 Nov 2018 07:58:15 -0600
Message-ID: <CAL_JsqLgz9Z3J0x+QFU6jHOoHn6A1KASc+HbVLnW1=ow0RHv6w@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-2-TheSven73@googlemail.com> <20181105212049.GA320@bogus>
 <CAGngYiUZTm-r0KJ07tKsPmgKCUWcqAOx2S82iLPRjkcDiw0R3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiUZTm-r0KJ07tKsPmgKCUWcqAOx2S82iLPRjkcDiw0R3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Sven Van Asbroeck <svendev@arcx.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 5, 2018 at 3:50 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> On Mon, Nov 5, 2018 at 4:20 PM Rob Herring <robh@kernel.org> wrote:
> >
> > bridge vs. host are confusing me as those are often the same thing. But
> > here bridge is just some auxilliary controls for the bus and the host is
> > the actual bus with devices? I'm not sure why you split this into 2 DT
> > nodes? How many devices are connected to the host processor (i.MX) bus?
> >
>
> The anybus can only have a single client card (device) on the bus. I
> know, we can criticise the name, but that's how HMS Industrial
> Networks designed it.
>
> The anybus-bridge is how we (at arcx / Archronix) physically connect
> anybus slots to the iMX. It is a CPLD chip connected to the i.MX WEIM
> bus on the SoC side. On the other side of the CPLD, there are two
> anybus slots. Each slot may hold an anybus card (profinet, flnet,
> cc-link, ...)
>
> The anybuss-host implements the anybus specification in a
> platform-independent way. Some other company could attach anybus slots
> to their CPU through a completely different bus, or spi, and they
> could still attach the anybuss-host driver onto it. All the driver
> needs is a regmap providing access to the anybus slot memory, an
> interrupt, and a reset controller.

It doesn't really sound like the host should be in DT. The bridge
should register itself as an anybus provider and that should in turn
enable the anybus host protocol.

Rob
