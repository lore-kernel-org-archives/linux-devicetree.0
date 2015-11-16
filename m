From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Mon, 16 Nov 2015 12:24:09 -0300
Message-ID: <5649F519.4050401@vanguardiasur.com.ar>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
 <CAGhQ9Vyg6sScq7yM=7judsMPHOc5VF2zf=7LPxmbmL7wF=vvgw@mail.gmail.com>
 <563384CB.3070607@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563384CB.3070607-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Joachim,

Sorry for the delay, I finally got the hardware again.

El 30/10/15 a las 11:55, Ariel D'Alessandro escribi=C3=B3:
> Joachim,
>=20
> El 24/10/15 a las 19:04, Joachim Eastwood escribi=C3=B3:
>> Hi Ariel,
>>
>> On 19 October 2015 at 19:32, Ariel D'Alessandro
>> <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>>> This commit adds support for NXP LPC18xx EEPROM memory found in NXP
>>> LPC185x/3x and LPC435x/3x/2x/1x devices.
>>>
>>> EEPROM size is 16384 bytes and it can be entirely read and
>>> written/erased with 1 word (4 bytes) granularity. The last page
>>> (128 bytes) contains the EEPROM initialization data and is not writ=
able.
>>>
>>> Erase/program time is less than 3ms. The EEPROM device requires a
>>> ~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated divid=
ing
>>> the system bus clock by the division factor, contained in the divid=
er
>>> register (minus 1 encoded).
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>>> ---
>>>  drivers/nvmem/Kconfig          |   9 ++
>>>  drivers/nvmem/Makefile         |   2 +
>>>  drivers/nvmem/lpc18xx_eeprom.c | 266 +++++++++++++++++++++++++++++=
++++++++++++
>>>  3 files changed, 277 insertions(+)
>>>  create mode 100644 drivers/nvmem/lpc18xx_eeprom.c
>>
>>> +static int lpc18xx_eeprom_gather_write(void *context, const void *=
reg,
>>> +                                      size_t reg_size, const void =
*val,
>>> +                                      size_t val_size)
>>> +{
>>> +       struct lpc18xx_eeprom_dev *eeprom =3D context;
>>> +       unsigned int offset =3D *(u32 *)reg;
>>> +
>>> +       /* 3 ms of erase/program time between each writing */
>>> +       while (val_size) {
>>> +               writel(*(u32 *)val, eeprom->mem_base + offset);
>>> +               usleep_range(3000, 4000);
>>> +               val_size -=3D eeprom->val_bytes;
>>> +               val +=3D eeprom->val_bytes;
>>> +               offset +=3D eeprom->val_bytes;
>>> +       }
>>
>> What happens here if 'val_size' is less than 4 or not dividable by 4=
?
>=20
> AFAIK, before calling to gather_write, the caller ensures that
> 'val_size' % map->format.val_bytes =3D=3D 0
>=20
> Like nvmem_device_write() do this in
> drivers/base/regmap/regmap.c:regmap_raw_write()
>=20
> Then, if val_size =3D=3D 0, nothing will happen.
>=20
>> Same thing for 'offset'.
>=20
> Let me check this one.

As I said regmap will ensure that
  val_len % map->format.val_bytes =3D=3D 0
in both read and write.

However, it will only ensure that
  reg % map->reg_stride =3D=3D 0
in read calls, not in write.
A non-word aligned write to the EEPROM will fail, so I'm adding a check
for this.

Thanks for pointing this out.

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
