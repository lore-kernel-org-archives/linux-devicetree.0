From: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: FW: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Wed, 11 Mar 2015 16:41:10 +0800
Message-ID: <CAN1oZWyp6bC=UhwHxKn5GPvTsr88ON9CthWWjpA8j1opgaE2-A@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
	<CACna6ryC8TyxvvtztoSgZUXnE+tJdY6tefbXVkaZ60JoZ7ti7A@mail.gmail.com>
	<CAN1oZWw2RUf7jSDGqk5UUrT3DDR2MHD6ORGQ1OLXQyES6+3Cjw@mail.gmail.com>
	<CACna6rzPRKFN+RzoF3TnNrPMy=rci25wb4NFPHZXBu9P61MjLQ@mail.gmail.com>
	<A8F913A698B3864C898FDDF9BF921BC9E8C00F@PG-ITEXCH01.altera.priv.altera.com>
	<CAN1oZWyq8Tni6M6yUZSU4Ky-Mku78kZW=qiNVEBcx-YuX7npXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1oZWyq8Tni6M6yUZSU4Ky-Mku78kZW=qiNVEBcx-YuX7npXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nga_chi86 <ngachi86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rafal,

On Tue, Mar 10, 2015 at 4:09 PM, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
>>>>> +
>>>>> +    /* Altera EPCQ/EPCS Flashes */
>>>>> +    { "epcq16"  , EPCQ_INFO(2, 0x15, 0x10000, 32,   0x100) },
>>>>> +    { "epcq32"  , EPCQ_INFO(2, 0x16, 0x10000, 64,   0x100) },
>>>>> +    { "epcq64"  , EPCQ_INFO(2, 0x17, 0x10000, 128,  0x100) },
>>>>> +    { "epcq128" , EPCQ_INFO(2, 0x18, 0x10000, 256,  0x100) },
>>>>> +    { "epcq256" , EPCQ_INFO(2, 0x19, 0x10000, 512,  0x100) },
>>>>> +    { "epcq512" , EPCQ_INFO(2, 0x20, 0x10000, 1024, 0x100) },
>>>>> +    { "epcs16"  , EPCQ_INFO(1, 0x14, 0x10000, 32,   0x100) },
>>>>> +    { "epcs64"  , EPCQ_INFO(1, 0x16, 0x10000, 128,  0x100) },
>>>>> +    { "epcs128" , EPCQ_INFO(1, 0x18, 0x40000, 256,  0x100) },
>>>>>      { },
>>>>>  };
>>>>>
>>>>> @@ -666,6 +731,14 @@ static const struct spi_device_id
>>>>> *spi_nor_read_id(struct spi_nor *nor)
>>>>>          if (info->jedec_id =3D=3D jedec) {
>>>>>              if (info->ext_id =3D=3D 0 || info->ext_id =3D=3D ext=
_jedec)
>>>>>                  return &spi_nor_ids[tmp];
>>>>> +
>>>>> +        /* altera epcq which is non jedec device
>>>>> +         * use id[4] as opcode id to differentiate
>>>>> +         * epcs and epcq devices
>>>>> +         */
>>>>> +        } else if (info->altera_flash_opcode_id =3D=3D id[4] &&
>>>>> +              info->ext_id =3D=3D id[3]) {
>>>>> +                return &spi_nor_ids[tmp];
>>>>
>>>> This is the part I don't like. I think it's fishy, and that this
>>>> check may result in false positives. Looks too generic.
>>>>
>>>> Also the logic of your behavior there seems unclear to me. On the =
one
>>>> hand you don't have JEDEC, so you provide chip name using DT. But =
in
>>>> place above you stop trusting DT info and you try to (kind of)
>>>> auto-detect used chip anyway.
>>>>
>>>> I guess we should finally think about some more generic way of
>>>> passing flash info.
>>>
>>> Actually, i just want fo follow the way current spi-nor doing as mu=
ch
>>> as possible. Like to read the device id and compare with info table=
=2E
>>> Like double checking from both dtb and the device id. Since the
>>> flashes i support do not have JEDEC id but only extended id. But th=
e
>>> problem is that some of them have the same extended id, for example
>>> epcs64 and epcq32). That is why in my driver, i have to decode 1st
>>> byte of ext id to differentiate epcs and ecpq.
>>
>> I see your point and it makes sense, I just think it shouldn't be pa=
rt of spi-nor. By adding chip specific code to spi-nor we'll end with h=
acky code and possible false chips identifications. I can really easily=
 imagine some random chip having the same id[3] and id[4] as one of Alt=
era flashes.
>>
>> Moreover your patch has not working support for epcs16 and epcs64.
>> They don't support 0x9f opcode (SPINOR_OP_RDID), so you would need t=
o add support for 0xab ("Read silicon ID") to the spi-nor.
>>
>> It's the same problem I have with Broadcom's "w25q128" that doesn't =
support 0x9f opcode but a 0x90 with 16b reply. You may see my tiny bcm5=
3xxspiflash.c driver:
>> http://git.openwrt.org/?p=3Dopenwrt.git;a=3Dblob;f=3Dtarget/linux/bc=
m53xx/files/drivers/mtd/spi-nor/bcm53xxspiflash.c;h=3Df192f4e59b71a2444=
833b5c62dd2239d28f9435d;hb=3Dd105c51a428a72a9af42759c472df9960c496d67
>>
>> So I'm afraid that if spi-nor gets support for:
>> 1) 0xab opcode
>> 2) 0x90 opcode
>> 3) Some uncommon replies for 0x9f opcode (like Altera ones) it will =
quickly get hacky & buggy.
>>
>> So what about:
>> 1) Using 0x9f and 0xab in altera_epcq.c
>> 2) Finding chip name in altera_epcq.c
>> 3) Adding Altera chip names & all sizes to spi-nor.c
>> 4) Just passing a chip name to spi-nor.c
>>
>> It's something I do in bcm53xxspiflash.c. I detect w25q128 using som=
e specific 0x90 opcode and just pass a chip name to the spi-nor.
>>
>> --
>> Rafa=C5=82
>>
> Ok. I will modify the code the way you suggest.

I just realize that the opcode for RDID is handled by hardware in my
case, therefore i dont really need to worry about 0xab opcode.
Is there any other comments about the modified part i did the lock and
unlock in spi-nor.c?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
