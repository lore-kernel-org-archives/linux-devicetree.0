From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Tue, 10 Mar 2015 07:55:08 +0100
Message-ID: <CACna6rzPRKFN+RzoF3TnNrPMy=rci25wb4NFPHZXBu9P61MjLQ@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
	<CACna6ryC8TyxvvtztoSgZUXnE+tJdY6tefbXVkaZ60JoZ7ti7A@mail.gmail.com>
	<CAN1oZWw2RUf7jSDGqk5UUrT3DDR2MHD6ORGQ1OLXQyES6+3Cjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAN1oZWw2RUf7jSDGqk5UUrT3DDR2MHD6ORGQ1OLXQyES6+3Cjw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viet Nga Dao <vndao@altera.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10 March 2015 at 07:11, Viet Nga Dao <vndao@altera.com> wrote:
> On Mon, Mar 9, 2015 at 2:31 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail=
=2Ecom> wrote:
>> On 11 February 2015 at 05:53, Viet Nga Dao <vndao@altera.com> wrote:
>>>  /* NOTE: double check command sets and memory organization when yo=
u add
>>>   * more nor chips.  This current list focusses on newer chips, whi=
ch
>>>   * have been converging on command sets which including JEDEC ID.
>>> @@ -637,6 +691,17 @@ static const struct spi_device_id spi_nor_ids[=
] =3D {
>>>      { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE |
>>> SPI_NOR_NO_FR) },
>>>      { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE |
>>> SPI_NOR_NO_FR) },
>>>      { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE |
>>> SPI_NOR_NO_FR) },
>>> +
>>> +    /* Altera EPCQ/EPCS Flashes */
>>> +    { "epcq16"  , EPCQ_INFO(2, 0x15, 0x10000, 32,   0x100) },
>>> +    { "epcq32"  , EPCQ_INFO(2, 0x16, 0x10000, 64,   0x100) },
>>> +    { "epcq64"  , EPCQ_INFO(2, 0x17, 0x10000, 128,  0x100) },
>>> +    { "epcq128" , EPCQ_INFO(2, 0x18, 0x10000, 256,  0x100) },
>>> +    { "epcq256" , EPCQ_INFO(2, 0x19, 0x10000, 512,  0x100) },
>>> +    { "epcq512" , EPCQ_INFO(2, 0x20, 0x10000, 1024, 0x100) },
>>> +    { "epcs16"  , EPCQ_INFO(1, 0x14, 0x10000, 32,   0x100) },
>>> +    { "epcs64"  , EPCQ_INFO(1, 0x16, 0x10000, 128,  0x100) },
>>> +    { "epcs128" , EPCQ_INFO(1, 0x18, 0x40000, 256,  0x100) },
>>>      { },
>>>  };
>>>
>>> @@ -666,6 +731,14 @@ static const struct spi_device_id
>>> *spi_nor_read_id(struct spi_nor *nor)
>>>          if (info->jedec_id =3D=3D jedec) {
>>>              if (info->ext_id =3D=3D 0 || info->ext_id =3D=3D ext_j=
edec)
>>>                  return &spi_nor_ids[tmp];
>>> +
>>> +        /* altera epcq which is non jedec device
>>> +         * use id[4] as opcode id to differentiate
>>> +         * epcs and epcq devices
>>> +         */
>>> +        } else if (info->altera_flash_opcode_id =3D=3D id[4] &&
>>> +              info->ext_id =3D=3D id[3]) {
>>> +                return &spi_nor_ids[tmp];
>>
>> This is the part I don't like. I think it's fishy, and that this che=
ck
>> may result in false positives. Looks too generic.
>>
>> Also the logic of your behavior there seems unclear to me. On the on=
e
>> hand you don't have JEDEC, so you provide chip name using DT. But in
>> place above you stop trusting DT info and you try to (kind of)
>> auto-detect used chip anyway.
>>
>> I guess we should finally think about some more generic way of passi=
ng
>> flash info.
>
> Actually, i just want fo follow the way current spi-nor doing as much
> as possible. Like to read the device id and compare with info table.
> Like double checking from both dtb and the device id. Since the
> flashes i support do not have JEDEC id but only extended id. But the
> problem is that some of them have the same extended id, for example
> epcs64 and epcq32). That is why in my driver, i have to decode 1st
> byte of ext id to differentiate epcs and ecpq.

I see your point and it makes sense, I just think it shouldn't be part
of spi-nor. By adding chip specific code to spi-nor we'll end with
hacky code and possible false chips identifications. I can really
easily imagine some random chip having the same id[3] and id[4] as one
of Altera flashes.

Moreover your patch has not working support for epcs16 and epcs64.
They don't support 0x9f opcode (SPINOR_OP_RDID), so you would need to
add support for 0xab ("Read silicon ID") to the spi-nor.

It's the same problem I have with Broadcom's "w25q128" that doesn't
support 0x9f opcode but a 0x90 with 16b reply. You may see my tiny
bcm53xxspiflash.c driver:
http://git.openwrt.org/?p=3Dopenwrt.git;a=3Dblob;f=3Dtarget/linux/bcm53=
xx/files/drivers/mtd/spi-nor/bcm53xxspiflash.c;h=3Df192f4e59b71a2444833=
b5c62dd2239d28f9435d;hb=3Dd105c51a428a72a9af42759c472df9960c496d67

So I'm afraid that if spi-nor gets support for:
1) 0xab opcode
2) 0x90 opcode
3) Some uncommon replies for 0x9f opcode (like Altera ones)
it will quickly get hacky & buggy.

So what about:
1) Using 0x9f and 0xab in altera_epcq.c
2) Finding chip name in altera_epcq.c
3) Adding Altera chip names & all sizes to spi-nor.c
4) Just passing a chip name to spi-nor.c

It's something I do in bcm53xxspiflash.c. I detect w25q128 using some
specific 0x90 opcode and just pass a chip name to the spi-nor.

--=20
Rafa=C5=82
