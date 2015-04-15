From: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH] [PATCH v3] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Wed, 15 Apr 2015 09:56:23 +0800
Message-ID: <CAN1oZWzH2t4rY7Lh7oiqM=gbVJ6v31vzFk96gumA+JBgRwN6kQ@mail.gmail.com>
References: <1426493782-3791-1-git-send-email-vndao@altera.com>
	<CACna6rxx9TN1vko0fVPQgJPLZ3ZN17JjPki+q1Y3Ep9e0HppEA@mail.gmail.com>
	<CAN1oZWxG8pnr-COMZRnOZvbaQ=vw+BRMgZpkQyk_v0NuGZPckA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAN1oZWxG8pnr-COMZRnOZvbaQ=vw+BRMgZpkQyk_v0NuGZPckA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,
Could you please help me to review this patch?
Thanks

On Mon, Mar 16, 2015 at 4:40 PM, Viet Nga Dao <vndao@altera.com> wrote:
> On Mon, Mar 16, 2015 at 4:35 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmai=
l.com> wrote:
>> On 16 March 2015 at 09:16,  <vndao@altera.com> wrote:
>>> +static struct flash_device flash_devices[] =3D {
>>> +       FLASH_ID("epcq16-nonjedec",  2, 0x15),
>>> +       FLASH_ID("epcq32-nonjedec",  2, 0x16),
>>> +       FLASH_ID("epcq64-nonjedec",  2, 0x17),
>>> +       FLASH_ID("epcq128-nonjedec", 2, 0x18),
>>> +       FLASH_ID("epcq256-nonjedec", 2, 0x19),
>>> +       FLASH_ID("epcq512-nonjedec", 2, 0x20),
>>
>> You could probably use EPCQ_OPCODE_ID
>>
>>
>>> +
>>> +       FLASH_ID("epcs16-nonjedec",  1, 0x14),
>>> +       FLASH_ID("epcs64-nonjedec",  1, 0x16),
>>> +       FLASH_ID("epcs128-nonjedec", 1, 0x18),
>>
>> And EPCS_OPCODE_ID here.
>>
> Noted
>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/sp=
i-nor.c
>>> index 43bb552..ad0c274 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -683,6 +683,17 @@ static const struct spi_device_id spi_nor_ids[=
] =3D {
>>>         { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE |=
 SPI_NOR_NO_FR) },
>>>         { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE |=
 SPI_NOR_NO_FR) },
>>>         { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE |=
 SPI_NOR_NO_FR) },
>>> +
>>> +       /* Altera EPCQ/EPCS Flashes */
>>> +       { "epcq16-nonjedec",  INFO(0, 0, 0x10000, 32,   0) },
>>> +       { "epcq32-nonjedec",  INFO(0, 0, 0x10000, 64,   0) },
>>> +       { "epcq64-nonjedec",  INFO(0, 0, 0x10000, 128,  0) },
>>> +       { "epcq128-nonjedec", INFO(0, 0, 0x10000, 256,  0) },
>>> +       { "epcq256-nonjedec", INFO(0, 0, 0x10000, 512,  0) },
>>> +       { "epcq512-nonjedec", INFO(0, 0, 0x10000, 1024, 0) },
>>> +       { "epcs16-nonjedec",  INFO(0, 0, 0x10000, 32,   0) },
>>> +       { "epcs64-nonjedec",  INFO(0, 0, 0x10000, 128,  0) },
>>> +       { "epcs128-nonjedec", INFO(0, 0, 0x40000, 256,  0) },
>>>         { },
>>>  };
>>
>> But mostly, I just wanted to say I like your integration with spi-no=
r.
>> Nice work :)
>>
>> --
>> Rafa=C5=82
>
> Thank you. This is all thanks to you and Brian for helpful comments. =
I
> learned a lot :)
