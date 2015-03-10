From: Viet Nga Dao <vndao@altera.com>
Subject: Re: FW: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Tue, 10 Mar 2015 16:09:14 +0800
Message-ID: <CAN1oZWyq8Tni6M6yUZSU4Ky-Mku78kZW=qiNVEBcx-YuX7npXA@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
	<CACna6ryC8TyxvvtztoSgZUXnE+tJdY6tefbXVkaZ60JoZ7ti7A@mail.gmail.com>
	<CAN1oZWw2RUf7jSDGqk5UUrT3DDR2MHD6ORGQ1OLXQyES6+3Cjw@mail.gmail.com>
	<CACna6rzPRKFN+RzoF3TnNrPMy=rci25wb4NFPHZXBu9P61MjLQ@mail.gmail.com>
	<A8F913A698B3864C898FDDF9BF921BC9E8C00F@PG-ITEXCH01.altera.priv.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <A8F913A698B3864C898FDDF9BF921BC9E8C00F@PG-ITEXCH01.altera.priv.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

>>>> +
>>>> +    /* Altera EPCQ/EPCS Flashes */
>>>> +    { "epcq16"  , EPCQ_INFO(2, 0x15, 0x10000, 32,   0x100) },
>>>> +    { "epcq32"  , EPCQ_INFO(2, 0x16, 0x10000, 64,   0x100) },
>>>> +    { "epcq64"  , EPCQ_INFO(2, 0x17, 0x10000, 128,  0x100) },
>>>> +    { "epcq128" , EPCQ_INFO(2, 0x18, 0x10000, 256,  0x100) },
>>>> +    { "epcq256" , EPCQ_INFO(2, 0x19, 0x10000, 512,  0x100) },
>>>> +    { "epcq512" , EPCQ_INFO(2, 0x20, 0x10000, 1024, 0x100) },
>>>> +    { "epcs16"  , EPCQ_INFO(1, 0x14, 0x10000, 32,   0x100) },
>>>> +    { "epcs64"  , EPCQ_INFO(1, 0x16, 0x10000, 128,  0x100) },
>>>> +    { "epcs128" , EPCQ_INFO(1, 0x18, 0x40000, 256,  0x100) },
>>>>      { },
>>>>  };
>>>>
>>>> @@ -666,6 +731,14 @@ static const struct spi_device_id
>>>> *spi_nor_read_id(struct spi_nor *nor)
>>>>          if (info->jedec_id =3D=3D jedec) {
>>>>              if (info->ext_id =3D=3D 0 || info->ext_id =3D=3D ext_=
jedec)
>>>>                  return &spi_nor_ids[tmp];
>>>> +
>>>> +        /* altera epcq which is non jedec device
>>>> +         * use id[4] as opcode id to differentiate
>>>> +         * epcs and epcq devices
>>>> +         */
>>>> +        } else if (info->altera_flash_opcode_id =3D=3D id[4] &&
>>>> +              info->ext_id =3D=3D id[3]) {
>>>> +                return &spi_nor_ids[tmp];
>>>
>>> This is the part I don't like. I think it's fishy, and that this
>>> check may result in false positives. Looks too generic.
>>>
>>> Also the logic of your behavior there seems unclear to me. On the o=
ne
>>> hand you don't have JEDEC, so you provide chip name using DT. But i=
n
>>> place above you stop trusting DT info and you try to (kind of)
>>> auto-detect used chip anyway.
>>>
>>> I guess we should finally think about some more generic way of
>>> passing flash info.
>>
>> Actually, i just want fo follow the way current spi-nor doing as muc=
h
>> as possible. Like to read the device id and compare with info table.
>> Like double checking from both dtb and the device id. Since the
>> flashes i support do not have JEDEC id but only extended id. But the
>> problem is that some of them have the same extended id, for example
>> epcs64 and epcq32). That is why in my driver, i have to decode 1st
>> byte of ext id to differentiate epcs and ecpq.
>
> I see your point and it makes sense, I just think it shouldn't be par=
t of spi-nor. By adding chip specific code to spi-nor we'll end with ha=
cky code and possible false chips identifications. I can really easily =
imagine some random chip having the same id[3] and id[4] as one of Alte=
ra flashes.
>
> Moreover your patch has not working support for epcs16 and epcs64.
> They don't support 0x9f opcode (SPINOR_OP_RDID), so you would need to=
 add support for 0xab ("Read silicon ID") to the spi-nor.
>
> It's the same problem I have with Broadcom's "w25q128" that doesn't s=
upport 0x9f opcode but a 0x90 with 16b reply. You may see my tiny bcm53=
xxspiflash.c driver:
> http://git.openwrt.org/?p=3Dopenwrt.git;a=3Dblob;f=3Dtarget/linux/bcm=
53xx/files/drivers/mtd/spi-nor/bcm53xxspiflash.c;h=3Df192f4e59b71a24448=
33b5c62dd2239d28f9435d;hb=3Dd105c51a428a72a9af42759c472df9960c496d67
>
> So I'm afraid that if spi-nor gets support for:
> 1) 0xab opcode
> 2) 0x90 opcode
> 3) Some uncommon replies for 0x9f opcode (like Altera ones) it will q=
uickly get hacky & buggy.
>
> So what about:
> 1) Using 0x9f and 0xab in altera_epcq.c
> 2) Finding chip name in altera_epcq.c
> 3) Adding Altera chip names & all sizes to spi-nor.c
> 4) Just passing a chip name to spi-nor.c
>
> It's something I do in bcm53xxspiflash.c. I detect w25q128 using some=
 specific 0x90 opcode and just pass a chip name to the spi-nor.
>
> --
> Rafa=C5=82
>
Ok. I will modify the code the way you suggest.
