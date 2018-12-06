From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v5 0/6] Add Fieldbus subsystem + support HMS Profinet card
Date: Thu, 6 Dec 2018 13:32:30 -0500
Message-ID: <CAGngYiVz5sqiaKQAXoAx-TyocDNDf+5ZKNXJRr+h5gXT+KA_sA@mail.gmail.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com> <3b0b4c5c-23a6-428c-6060-3e5c314bd9e7@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3b0b4c5c-23a6-428c-6060-3e5c314bd9e7@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi David, thank you for the feedback !

On Wed, Dec 5, 2018 at 9:05 PM David Lechner <david@lechnology.com> wrote:
>
> Does this actually need a new fieldbus subsystem or could it just be
> implemented as a new network protocol?
>
> Then this generic interface to a fieldbus device could just be a socket.
>

This is a fundamental question, and I'm glad we are having this discussion.

Caveat: I am by no means a Fieldbus expert. HMS Industrial Networks are. They
have recently become aware of this mainlining effort; but they are not Linux
focused. I really hope they will participate.

Fieldbus is a collection of network protocols for industrial networks.
The underlying network technology varies: e.g. Ethernet for Profinet, RS485
for Profibus, just to name a few.

The actual layout of the raw packets exchanged over the network is proprietary;
fieldbus cards will typically implement this internally, and hide the details.
Some fieldbus protocols have hard real-time requirements: the CPU inside a
fieldbus card will typically run an RTOS to satisfy these.

Could Profinet be added as a new network protocol? Leaving aside proprietary
and hard real-time concerns, the main issue is that cards implementing the
standard won't provide access to the raw packets.

As a result, the Fieldbus userspace API can only consist of whatever these cards
are willing to expose. This varies widely among implementations and fieldbus
protocols, but there are a few commonalities. For example, every fieldbus
card will expose 'process memory' which you can think of as shared memory
between a device and its controller (master).

The fieldbus subsystem proposed in this patch exposes a minimal set of
functionality that every fieldbus device is supposed to have. In many
instances, this won't even be enough to get the card to work. For example,
there is currently no way to provide initialization parameters. These vary
from setting the card network id, to configuring a built-in HTTP server
running inside the card (!!).

Linus Walleij suggested that the KVP nature of Netlink sockets might be a good
match for fieldbus initialization parameters. It sounds promising.
Yet when it comes to accessing shared memory, I cannot see how Netlink could
be of use?

It would be ideal if actual fieldbus experts could help shape this interface,
but I don't know of any that are willing to. One possible explanation is that
the fieldbus corporate environment may be a strong believer in proprietary
technologies.

Sven
