Return-Path: <hns@goldelico.com>
Content-Type: text/plain; charset=windows-1252
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] drivers: led: is31fl319x: 6/9-channel light effect led driver
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <5717EECB.8010401@gmail.com>
Date: Wed, 6 Jul 2016 12:02:01 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2146598-B9A2-434D-9011-167A1E6A531F@goldelico.com>
References: <cover.1461004995.git.hns@goldelico.com> <75127f4bf2bb11343bdff5bfb1129a092e668c61.1461004995.git.hns@goldelico.com> <20160418212504.29d67592.drivshin.allworx@gmail.com> <80A3B3D8-2309-4A41-91F9-4A2EE6DDF975@goldelico.com> <5717EECB.8010401@gmail.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org
List-ID: <devicetree@vger.kernel.org>

Hi,
finally, I found the time to update the driver according to the many =
comments
received a while ago.

Most of them have been worked in, including the regmap idea and
brightness_set_blocking().

The driver works on our system, so that I will mail [PATCH v2] as a =
followup.

There is only one aspect of the new solution I am not sure if it is
really better than our old proposal (see below).


> Am 20.04.2016 um 23:04 schrieb Jacek Anaszewski =
<jacek.anaszewski@gmail.com>:
>=20
> On 04/19/2016 07:21 PM, H. Nikolaus Schaller wrote:
>>> I believe the LEDS core now handles the workqueues generically for
>>> blocking operations, so it's no longer needed in the individual =
drivers.
>>=20
>> We had a lot of trouble with locking and blocking especially if we
>> want to indicate CPU or (root) disk activity.
>=20
> What kind of troubles you had? Could you share more details?
> Does it mean that current LED core design doesn't fit for your
> use cases?

The system started to flicker the LEDs irregularily and sometimes
the whole kernel stalled.

>=20
>> So it is implemented in a way that changes can be requested faster
>> than the I2C bus can write new values to the chip.
>>=20
>> Only after one sequence of I2C writes is done, another work function
>> can be scheduled. And each group of writes updates as many LEDs
>> in parallel if necessary.
>=20
> You can serialize the operations in brightness_set_blocking with
> a mutex.

Yes, that works fine in our (incomplete) test setup.

But I think it assumes that the i2c bus is never congested by other i2c =
traffic.

I have not found code that obviously takes care of the situation if led
trigger events (e.g. mmc or cpu triggers) are coming in faster than the
i2c (even using regmap) can write out over i2c.

If I understand the led core code correctly, it will just do another =
schedule_work
for every single change of led brightness.

So I wonder if Is there some guarantee that this work queue will not =
fill
up memory and is really processed faster than being filled? I.e. can the
queue overflow?

To reduce this risk, my original implementation strategy was different. =
The
update speed was limited by i2c writing. A new register update batch job
was only scheduled if the previous one is finished. If i2c was =
blocked/congested,
the writing worker thread would come to a halt.

All incoming led brightness changes were simply accumulated until a new
batch job is started, because LEDs would anyways flicker invisibly fast.

Tests with the new driver have shown that it seems not to run into this =
situation
on our system but it might depend on factors we have not yet tested =
(slow i2c,
other i2c traffic on the same bus, CPU speed, event types choosen).

So I am a little in doubt about this risk. But I may have simply missed
the reason why the standard approach works and can never overflow.

BR,
Nikolaus
