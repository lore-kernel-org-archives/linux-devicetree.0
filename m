From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 0/8] gnss: add new GNSS subsystem
Date: Thu, 31 May 2018 15:33:41 +0200
Message-ID: <598825FD-67A5-4016-BCE8-A50517472B8F@goldelico.com>
References: <20180530103242.20773-1-johan@kernel.org> <20180530143822.lvtwjvbqe7gvbvgq@localhost> <20180531085242.GE3259@localhost> <943C21CA-EEC6-45E2-997E-A6E1FA0549EB@goldelico.com> <20180531114743.GG3259@localhost>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180531114743.GG3259@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> Am 31.05.2018 um 13:47 schrieb Johan Hovold <johan@kernel.org>:
>=20
> On Thu, May 31, 2018 at 11:52:18AM +0200, H. Nikolaus Schaller wrote:
>>=20
>>> Am 31.05.2018 um 10:52 schrieb Johan Hovold <johan@kernel.org>:
>>>=20
>>> On Wed, May 30, 2018 at 07:38:22AM -0700, Richard Cochran wrote:
>>>> On Wed, May 30, 2018 at 12:32:34PM +0200, Johan Hovold wrote:
>>>>> Another possible extension is to add generic 1PPS support.
>>>>=20
>>>> There are two possibilities to consider.
>>>>=20
>>>> 1. If the PPS causes an interrupt, then it should hook into the PPS
>>>>  subsystem.
>>>=20
>>> Registering a PPS child device is what I had in mind for this.
>>=20
>> This seems to be duplicating functionality that is already solved by
>>=20
>> =
https://elixir.bootlin.com/linux/v4.17-rc7/source/Documentation/devicetree=
/bindings/pps/pps-gpio.txt
>>=20
>> and
>>=20
>> =
https://elixir.bootlin.com/linux/v4.17-rc7/source/drivers/pps/clients/pps-=
gpio.c
>>=20
>> Or what is bad with just using that?
>=20
> Using pps-gpio would not allow you to describe the hardware properly,
> something which, for example, may be needed for power management (e.g.
> to power on the GNSS receiver when the pps device is being accessed).

Yes, that is indeed a very valid reason to do it that way as the =
pps-gpio
seems to assume an always-on impulse source.

On the other hand it looks as if the pps framework can't tell the
source when to power on/off because it does not notify when it
is being accessed or not:

https://elixir.bootlin.com/linux/v4.17-rc7/source/drivers/pps/pps.c#L305

BR,
Nikolaus
