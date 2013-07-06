From: Ulrich Prinz <ulrich.prinz@googlemail.com>
Subject: Re: [PATCH 3/9] clocksource: dw_apb_timer: quirk for variants with
 64bit counter
Date: Sat, 06 Jul 2013 22:19:14 +0200
Message-ID: <51D87BC2.5060507@googlemail.com>
References: <201307060051.09716.heiko@sntech.de> <201307060053.10182.heiko@sntech.de> <alpine.DEB.2.02.1307060129340.32106@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1307060129340.32106@ionos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, John Stultz <john.stultz@linaro.org>, Jamie Iles <jamie@jamieiles.com>, Dinh Nguyen <dinguyen@altera.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

sorry but it is my first release to the kernel and I was trained to tak=
e
as less as possible influence on existing code and reuse as much as
possible existing code.

Sometimes just two rules are to simple...

Am 06.07.2013 01:45, schrieb Thomas Gleixner:
> On Sat, 6 Jul 2013, Heiko St=C3=BCbner wrote:
>=20
>> This adds a quirk for IP variants containing two load_count and valu=
e
>> registers that are used to provide 64bit accuracy on 32bit systems.
>>
>> The added accuracy is currently not used, the driver is only adapted=
 to
>> handle the different register layout and make it work on affected de=
vices.
>>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>>  drivers/clocksource/dw_apb_timer.c |   27 +++++++++++++++++++++++++=
++
>>  include/linux/dw_apb_timer.h       |    6 ++++++
>>  2 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/clocksource/dw_apb_timer.c b/drivers/clocksourc=
e/dw_apb_timer.c
>> index f5e7be8..bd45351 100644
>> --- a/drivers/clocksource/dw_apb_timer.c
>> +++ b/drivers/clocksource/dw_apb_timer.c
>> @@ -56,6 +56,17 @@ static void apbt_init_regs(struct dw_apb_timer *t=
imer, int quirks)
>>  	timer->reg_control =3D APBTMR_N_CONTROL;
>>  	timer->reg_eoi =3D APBTMR_N_EOI;
>>  	timer->reg_int_status =3D APBTMR_N_INT_STATUS;
>> +
>> +	/*
>> +	 * On variants with 64bit counters some registers are
>> +	 * moved further down.
>> +	 */
>> +	if (quirks & APBTMR_QUIRK_64BIT_COUNTER) {
>> +		timer->reg_current_value +=3D 0x4;
>> +		timer->reg_control +=3D 0x8;
>> +		timer->reg_eoi +=3D 0x8;
>> +		timer->reg_int_status +=3D 0x8;
>> +	}
>>  }
>=20
> Oh, no. this is not how we handle these things.
>=20
> 1) We want proper constants for this 64bit IP block=20

ACK
>=20
> 2) This is not a quirk, it's a property of that particular IP block

Ok, noted and will be reworked.
>=20
> You already made the register offsets a part of the timer structure,
> so why don't you supply a proper structure filled with that values to
> the init function?
>=20
> That's what we do all over the place. Either we instantiate those
> structs at compile time or runtime fed by device tree or any other
> configuration mechanism.
>  =20
Lesson learned, will be reworked. But taking the other comments and
remarks into account this leads to an integration into a single new
patch inheriting this new driver path.

>>  static unsigned long apbt_readl(struct dw_apb_timer *timer, unsigne=
d long offs)
>> @@ -145,6 +156,10 @@ static void apbt_set_mode(enum clock_event_mode=
 mode,
>>  		udelay(1);
>>  		pr_debug("Setting clock period %lu for HZ %d\n", period, HZ);
>>  		apbt_writel(timer, period, timer->reg_load_count);
>> +
>> +		if (timer->quirks & APBTMR_QUIRK_64BIT_COUNTER)
>> +			apbt_writel(timer, 0, timer->reg_load_count + 0x4);
>> +
>=20
> No. We are not adding such conditional constructs when we can deal
> with them just by providing a proper set of function pointers. And
> definitely not with hardcoded magic 0x4 constants involved.
>=20
>      timer->load_count(timer, value);
>=20
> Provide a 32 bit and a 64 bit version of that function and be done
> with it.

=46or the first version, 64bit will not be supported cause of lack of
information and testing. But is it an option to control the load of
functions by dtsi according this way:

dw-apb-timer-osc: will load standard function to load timer
rk3188-dw-apb-timer-osc: will load 32bit variant of 64bit registers
rk3188-dw-apb-timer64-osc: will load 64bit variant of 64bit registers

>=20
>=20
> Copy and paste is a conveniant thing, right? It just should have a po=
p
> up window assigned which asks at the second instance of copying the
> same thing whether you really thought about it.

We thought about and tested a lot. But the problem is that if you find =
a
bug in one copy of it, you (or anyone else inspecting the code) need to
find all the other copies. In such manor a c'n'p solution is always bad=
=2E

Regards,
	Ulrich
