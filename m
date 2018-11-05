From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 1/6] misc: support the Arcx anybus bridge
Date: Mon, 5 Nov 2018 16:50:40 -0500
Message-ID: <CAGngYiUZTm-r0KJ07tKsPmgKCUWcqAOx2S82iLPRjkcDiw0R3g@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-2-TheSven73@googlemail.com> <20181105212049.GA320@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105212049.GA320@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sven Van Asbroeck <svendev@arcx.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 5, 2018 at 4:20 PM Rob Herring <robh@kernel.org> wrote:
>
> bridge vs. host are confusing me as those are often the same thing. But
> here bridge is just some auxilliary controls for the bus and the host is
> the actual bus with devices? I'm not sure why you split this into 2 DT
> nodes? How many devices are connected to the host processor (i.MX) bus?
>

The anybus can only have a single client card (device) on the bus. I
know, we can criticise the name, but that's how HMS Industrial
Networks designed it.

The anybus-bridge is how we (at arcx / Archronix) physically connect
anybus slots to the iMX. It is a CPLD chip connected to the i.MX WEIM
bus on the SoC side. On the other side of the CPLD, there are two
anybus slots. Each slot may hold an anybus card (profinet, flnet,
cc-link, ...)

The anybuss-host implements the anybus specification in a
platform-independent way. Some other company could attach anybus slots
to their CPU through a completely different bus, or spi, and they
could still attach the anybuss-host driver onto it. All the driver
needs is a regmap providing access to the anybus slot memory, an
interrupt, and a reset controller.

Sven
