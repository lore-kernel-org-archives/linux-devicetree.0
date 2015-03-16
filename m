From: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] [PATCH v3] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Mon, 16 Mar 2015 16:40:42 +0800
Message-ID: <CAN1oZWxG8pnr-COMZRnOZvbaQ=vw+BRMgZpkQyk_v0NuGZPckA@mail.gmail.com>
References: <1426493782-3791-1-git-send-email-vndao@altera.com>
	<CACna6rxx9TN1vko0fVPQgJPLZ3ZN17JjPki+q1Y3Ep9e0HppEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rxx9TN1vko0fVPQgJPLZ3ZN17JjPki+q1Y3Ep9e0HppEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 16, 2015 at 4:35 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.=
com> wrote:
> On 16 March 2015 at 09:16,  <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
>> +static struct flash_device flash_devices[] =3D {
>> +       FLASH_ID("epcq16-nonjedec",  2, 0x15),
>> +       FLASH_ID("epcq32-nonjedec",  2, 0x16),
>> +       FLASH_ID("epcq64-nonjedec",  2, 0x17),
>> +       FLASH_ID("epcq128-nonjedec", 2, 0x18),
>> +       FLASH_ID("epcq256-nonjedec", 2, 0x19),
>> +       FLASH_ID("epcq512-nonjedec", 2, 0x20),
>
> You could probably use EPCQ_OPCODE_ID
>
>
>> +
>> +       FLASH_ID("epcs16-nonjedec",  1, 0x14),
>> +       FLASH_ID("epcs64-nonjedec",  1, 0x16),
>> +       FLASH_ID("epcs128-nonjedec", 1, 0x18),
>
> And EPCS_OPCODE_ID here.
>
Noted
>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi=
-nor.c
>> index 43bb552..ad0c274 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -683,6 +683,17 @@ static const struct spi_device_id spi_nor_ids[]=
 =3D {
>>         { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | =
SPI_NOR_NO_FR) },
>>         { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | =
SPI_NOR_NO_FR) },
>>         { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | =
SPI_NOR_NO_FR) },
>> +
>> +       /* Altera EPCQ/EPCS Flashes */
>> +       { "epcq16-nonjedec",  INFO(0, 0, 0x10000, 32,   0) },
>> +       { "epcq32-nonjedec",  INFO(0, 0, 0x10000, 64,   0) },
>> +       { "epcq64-nonjedec",  INFO(0, 0, 0x10000, 128,  0) },
>> +       { "epcq128-nonjedec", INFO(0, 0, 0x10000, 256,  0) },
>> +       { "epcq256-nonjedec", INFO(0, 0, 0x10000, 512,  0) },
>> +       { "epcq512-nonjedec", INFO(0, 0, 0x10000, 1024, 0) },
>> +       { "epcs16-nonjedec",  INFO(0, 0, 0x10000, 32,   0) },
>> +       { "epcs64-nonjedec",  INFO(0, 0, 0x10000, 128,  0) },
>> +       { "epcs128-nonjedec", INFO(0, 0, 0x40000, 256,  0) },
>>         { },
>>  };
>
> But mostly, I just wanted to say I like your integration with spi-nor=
=2E
> Nice work :)
>
> --
> Rafa=C5=82

Thank you. This is all thanks to you and Brian for helpful comments. I
learned a lot :)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
