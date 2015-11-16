From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Mon, 16 Nov 2015 12:29:15 -0300
Message-ID: <5649F64B.5050407@vanguardiasur.com.ar>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
 <56386E30.4060905@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56386E30.4060905-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stefan,

Sorry for the delay.

El 03/11/15 a las 05:20, Stefan Wahren escribi=F3:
> Hi Ariel,
>=20
> Am 19.10.2015 um 19:32 schrieb Ariel D'Alessandro:
>> This commit adds support for NXP LPC18xx EEPROM memory found in NXP
>> LPC185x/3x and LPC435x/3x/2x/1x devices.
>>
>> EEPROM size is 16384 bytes and it can be entirely read and
>> written/erased with 1 word (4 bytes) granularity. The last page
>> (128 bytes) contains the EEPROM initialization data and is not writa=
ble.
>>
>> Erase/program time is less than 3ms. The EEPROM device requires a
>> ~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated dividi=
ng
>> the system bus clock by the division factor, contained in the divide=
r
>> register (minus 1 encoded).
>>
>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> ---
>>  drivers/nvmem/Kconfig          |   9 ++
>>  drivers/nvmem/Makefile         |   2 +
>>  drivers/nvmem/lpc18xx_eeprom.c | 266 ++++++++++++++++++++++++++++++=
+++++++++++
>>  3 files changed, 277 insertions(+)
>>  create mode 100644 drivers/nvmem/lpc18xx_eeprom.c
>> [...]
>> +
>> +static int lpc18xx_eeprom_gather_write(void *context, const void *r=
eg,
>> +				       size_t reg_size, const void *val,
>> +				       size_t val_size)
>> +{
>> +	struct lpc18xx_eeprom_dev *eeprom =3D context;
>> +	unsigned int offset =3D *(u32 *)reg;
>> +
>> +	/* 3 ms of erase/program time between each writing */
>> +	while (val_size) {
>> +		writel(*(u32 *)val, eeprom->mem_base + offset);
>> +		usleep_range(3000, 4000);
>=20
> i think it would be good to verify that the EEPROM write operation ha=
s
> really finished.

I'm not sure what are you proposing. Why could the write operation not
finish?

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
