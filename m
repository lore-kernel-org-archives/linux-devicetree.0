From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Letux-kernel] [PATCH 0/5] gnss: sirf: add support for w2sg0004 + lna
Date: Mon, 19 Nov 2018 09:22:59 +0100
Message-ID: <3487514B-E546-4F11-8C0A-F5B4A8114376@goldelico.com>
References: <20181118215801.12280-1-andreas@kemnade.info>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118215801.12280-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

Hi,

> Am 18.11.2018 um 22:57 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> Here is another chapter of the story to get gta04 gnss power
> management into the mainline kernel.
> There is a w2sg0004 without wakeup line in there, so power state
> can only be determined indirectly by looking at the serial data lines.
> Then there as also an lna which needs to be powered for real gps
> reception. That part needs probably more discussion, since it might
> be an idea to have it more generalized since it has nothing todo
> with the chip itself.

On the other hand if we follow the "SoC is the spider in the net"
way of looking at DTS hierarchy, we have the uart as a child of the
SoC and the gnss receiver as a serdev child of the UART. The LNA
is even one step more distantly connected to the gnss. So it makes
sense to me to have it as a property/reference of the gnss chip's
DTS record which is a sibling of the compatible records. So the only
place where it can be reasonably processed is the driver.

> I marked the corresponding patches as RFC. The support for
> the w2sg0004 without wakeup can imho go in without the lna first
> because users of that chip without an additional lna power supply
> can already benefit from it if we should do more discussion first.
> I just kept them together so that the full picture can be seen.
>=20
> Andreas Kemnade (5):
>  gnss: sirf: write data to gnss only when the gnss device is open
>  gnss: sirf: power on logic for devices without wakeup signal
>  dt-bindings: gnss: add w2sg0004 compatible string
>  gnss: sirf: add a separate supply for a lna
>  dt-bindings: gnss: add lna-supply property
>=20
> .../devicetree/bindings/gnss/sirfstar.txt          |   2 +
> drivers/gnss/sirf.c                                | 126 =
+++++++++++++++------
> 2 files changed, 96 insertions(+), 32 deletions(-)
>=20
> --=20
> 2.11.0
>=20
> _______________________________________________
> http://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel

BR,
Nikolaus
