From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Tue, 17 Nov 2015 16:53:11 -0300
Message-ID: <564B85A7.4080306@vanguardiasur.com.ar>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
 <56386E30.4060905@i2se.com> <5649F64B.5050407@vanguardiasur.com.ar>
 <1526033037.5264.1447754499675.JavaMail.open-xchange@oxbaltgw01.schlund.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1526033037.5264.1447754499675.JavaMail.open-xchange-h4m1HHXQYNFdfASV6gReHsgmgJlYmuWJ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stefan,

El 17/11/15 a las 07:01, Stefan Wahren escribi=C3=B3:
> Hi Ariel,
>=20
>> Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> hat am 16. November =
2015 um
>> 16:29 geschrieben:
>>
>>
>> Hi Stefan,
>>
>> Sorry for the delay.
>>
>> El 03/11/15 a las 05:20, Stefan Wahren escribi=C3=B3:
>>> Hi Ariel,
>>>
>>> Am 19.10.2015 um 19:32 schrieb Ariel D'Alessandro:
>>>> This commit adds support for NXP LPC18xx EEPROM memory found in NX=
P
>>>> LPC185x/3x and LPC435x/3x/2x/1x devices.
>>>>
>>>> EEPROM size is 16384 bytes and it can be entirely read and
>>>> written/erased with 1 word (4 bytes) granularity. The last page
>>>> (128 bytes) contains the EEPROM initialization data and is not wri=
table.
>>>>
>>>> Erase/program time is less than 3ms. The EEPROM device requires a
>>>> ~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated divi=
ding
>>>> the system bus clock by the division factor, contained in the divi=
der
>>>> register (minus 1 encoded).
>>>>
>>>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>>>> ---
>>>> drivers/nvmem/Kconfig | 9 ++
>>>> drivers/nvmem/Makefile | 2 +
>>>> drivers/nvmem/lpc18xx_eeprom.c | 266
>>>> +++++++++++++++++++++++++++++++++++++++++
>>>> 3 files changed, 277 insertions(+)
>>>> create mode 100644 drivers/nvmem/lpc18xx_eeprom.c
>>>> [...]
>>>> +
>>>> +static int lpc18xx_eeprom_gather_write(void *context, const void =
*reg,
>>>> + size_t reg_size, const void *val,
>>>> + size_t val_size)
>>>> +{
>>>> + struct lpc18xx_eeprom_dev *eeprom =3D context;
>>>> + unsigned int offset =3D *(u32 *)reg;
>>>> +
>>>> + /* 3 ms of erase/program time between each writing */
>>>> + while (val_size) {
>>>> + writel(*(u32 *)val, eeprom->mem_base + offset);
>>>> + usleep_range(3000, 4000);
>>>
>>> i think it would be good to verify that the EEPROM write operation =
has
>>> really finished.
>>
>> I'm not sure what are you proposing. Why could the write operation n=
ot
>> finish?
>=20
> it's always good to keep in sync with the hardware. Here is an extrac=
t of
> chapter=20
> "46.6.2.1 Writing and erase/programming" from the datasheet [1]:
>=20
>   During programming, the EEPROM is not available for other operation=
s. To
> prevent
>   undesired loss in performance which would be caused by stalling the=
 bus, the
> EEPROM
>   instead generates an error for AHB read/writes and APB writes when =
programming
> is
>   busy. In order to prevent the error response, the program operation=
 finished
> interrupt
>   can be enabled or the interrupt status bit can be polled.
>=20
> Please blame me if it doesn't apply.
>=20
> It's only a suggestion: How about checking the interrupt status bit f=
or
> END_OF_PROG after the 3 ms sleep?

Yeah, I think that's a good idea, pretty simple and it will ensure
(although 3ms should be enough) erase/program operation has effectively
finished.

Thanks for the explanation and suggestion. I'm submitting patchset v4
with this.

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
