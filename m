From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 0/4] add minimal bcm2835-sdram driver
Date: Thu, 12 May 2016 17:28:57 +0200
Message-ID: <B30D094A-1E5A-4777-8F2A-C3D53AF89044@martin.sperl.org>
References: <1463056732-5607-1-git-send-email-kernel@martin.sperl.org> <1861597197.20753.36a104a6-5284-487f-b397-da7ff0407f1f.open-xchange@email.1und1.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1861597197.20753.36a104a6-5284-487f-b397-da7ff0407f1f.open-xchange@email.1und1.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Eric Anholt <eric@anholt.net>, Lee Jones <lee@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> On 12.05.2016, at 16:50, Stefan Wahren <stefan.wahren@i2se.com> wrote=
:
>=20
> Hi Martin,
>=20
>> kernel@martin.sperl.org hat am 12. Mai 2016 um 14:38 geschrieben:
>>=20
>>=20
>> From: Martin Sperl <kernel@martin.sperl.org>
>>=20
>> As the sdram clock is a critical clock to the system
>> the minimal bcm2835-sdram driver claims (and enables)
>> this clock and also exposes the corresponding sdram
>> registers via debugfs.
>=20
> sounds like this driver should fix an clock handling issue. Unfortuna=
tely this
> isn't a solution in case the driver is disabled.
Unfortunately there is no way around this - the driver has
to be enabled so that the sdram clock or the parent pll,
which typically is plld_core, never gets disabled.

The only other option would be marking the clock as critical
for those legacy drivers.

See also the discussions around the clock register for the
sdram clock, where we have the =E2=80=9Cnormal=E2=80=9D clock and some
pll as well - even if the =E2=80=9Cnormal=E2=80=9D clock is disabled,=20
then clearing the sdram register (or the parent) freezes
the system.

>=20
> Does the GPU firmware handle the SDRAM controller or is it initialize=
d by
> bootcode?
>=20

AFAIK it is enabled in bootcode.bin and - as of now - the firmware
updates refresh cycles when SOC temperatures change.
=46W checks every 30 seconds unless there is a key set in config.txt,
which - supposedly - produces a slight impact every 30 seconds to
the system.

Martin
