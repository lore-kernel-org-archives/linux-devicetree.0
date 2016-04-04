From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] mtd: spi-nor: add an alternative method to support
 memory >16MiB
Date: Mon, 4 Apr 2016 16:27:09 +0200
Message-ID: <570279BD.6050604@atmel.com>
References: <1458556429-11741-1-git-send-email-cyrille.pitchen@atmel.com>
 <20160321170107.GG2545@google.com> <56F02C70.6050106@atmel.com>
 <20160321175537.GH2545@google.com> <56F12C24.6040206@atmel.com>
 <20160401203852.GD3645@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160401203852.GD3645@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

Le 01/04/2016 22:38, Brian Norris a =E9crit :
> On Tue, Mar 22, 2016 at 12:27:32PM +0100, Cyrille Pitchen wrote:
>> Le 21/03/2016 18:55, Brian Norris a =E9crit :
>>> On Mon, Mar 21, 2016 at 06:16:32PM +0100, Cyrille Pitchen wrote:
>>>> Le 21/03/2016 18:01, Brian Norris a =E9crit :
>>>>> On Mon, Mar 21, 2016 at 11:33:49AM +0100, Cyrille Pitchen wrote:
>>>>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/K=
config
>>>>>> index d42c98e1f581..7fae36fc8526 100644
>>>>>> --- a/drivers/mtd/spi-nor/Kconfig
>>>>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>>>>> @@ -29,6 +29,18 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>>>>>>  	  Please note that some tools/drivers/filesystems may not work=
 with
>>>>>>  	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
>>>>>> =20
>>>>>> +config MTD_SPI_NOR_USE_4B_OPCODES
>>>>>> +	bool "Use 4-byte address op codes"
>>>>>> +	default n
>>>>>> +	help
>>>>>> +	  This is an alternative to the "Enter/Exit 4-byte mode" comma=
nds and
>>>>>> +	  Base Address Register (BAR) updates to support flash size ab=
ove 16MiB.
>>>>>> +	  Using dedicated 4-byte address op codes for (Fast) Read, Pag=
e Program
>>>>>> +	  and Sector Erase operations avoids changing the internal sta=
te of the
>>>>>> +	  SPI NOR memory. Hence if a CPU reset occurs, early bootloade=
rs can
>>>>>> +	  still use regular 3-byte address op codes and read from the =
very first
>>>>>> +	  16MiB of the flash memory.
>>>>>> +
>>>>>
>>>>> Why does this need to be a Kconfig option? Can't it just as well =
be
>>>>> supported by keeping entries in the ID table, to show which flash
>>>>> support these opcodes and which don't? Kconfig is really a bad me=
chanism
>>>>> for trying to configure your flash.
>>>>
>>>> Well, the only reason why I've chosen a Kconfig option is to be as=
 safe as
>>>> possible, if for some reason someone still wants to use the former
>>>> implementation. Honestly I don't know why one would do so but I'm =
cautious
>>>> so I also set "default n". This way no regression is introduced.
>>>
>>> I think the main reason is that some manufacturers did not initiall=
y
>>> support both methods. So we couldn't just say "all Micron" or "all
>>> Macronix" should use these opcodes. Spansion was the only one to su=
pport
>>> them consistently. See [1] for reference.
>>>
>>> And actually, your Kconfig option is not "cautious", because you ha=
ve no
>>> guarantee that people will make intelligent choices here. So you're
>>> making a Kconfig that if someone accidentally turns it on, their fl=
ash
>>> might not work any more. That's much less safe than properly labell=
ing
>>> which flash supports which feature.
>>>
>>>> If you think it's better to use a dedicated flag like SECT_4K or
>>>> SPI_NOR_QUAD_READ in the spi_nor_ids[] table, I'm perfectly fine w=
ith it as
>>>> well.
>>>
>>> I think that would be better. (Really, an opt-out would be the leas=
t
>>> work in the long-run I think, since IIRC there were only a few
>>> early-generation flash that were both large enough to need 4 byte
>>> addressing and didn't support the dedicated opcodes. But it'll be h=
ard
>>> to track those down now I think, so opt-in probably is most practic=
al.)
>>>
>>>> Just let me know your choice then I'll update my patch accordingly=
 if needed.
>>>
>>> Brian
>>>
>>> [1]
>>> commit 87c9511fba2bd069a35e1312587a29e112fc0cd6
>>> Author: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Date:   Thu Apr 11 01:34:57 2013 -0700
>>>
>>>     mtd: m25p80: utilize dedicated 4-byte addressing commands
>>>
>>
>> Indeed, your commit message is very interesting since it points out =
some issue
>> I already face: for my test I'm currently using a Macronix MX25L2567=
3G
>> (JEDEC ID C22019). This memory *does* support the dedicated 4byte ad=
dress op
>> codes.
>>
>> Then if I look at the datasheet for the Macronix MX25L25635E, this o=
lder memory
>> shares the exact same JEDEC ID, C22019 but *doesn't* support the 4by=
te address
>> op codes.
>>
>> None of these two memory types use ext id: the JEDEC ID is only 3byt=
e long.
>> Anyway, in QPI mode, the QPIID command (0xAF), which replaces the re=
gular
>> Read ID command (0x9f) only sends 3 bytes too.
>>
>> The memory table inside the spi-nor framework is indexed by JEDEC ID=
 (+ ext id)
>> but we've just pointed out a case where it is not possible to create=
 two
>> different entries in this table, one for the 35E without the "4byte"=
 flag, the
>> other for 73G with the "4byte" flag.
>>
>> So there is no mean for the software to discover at runtime what are=
 the actual
>> capabilities of the memory. Hence I think we should introduce a DT p=
roperty
>> which would clearly tell the spi-nor framework that we want to use t=
he
>> dedicated 4byte address op codes instead of entering the 4byte addre=
ss mode
>> (still the default behaviour since older memories only support this =
mode).
>=20
> We don't absolutely need a new property. You could just support
> "mxic,mx25l25673g" in the compatible property, and make sure that nam=
e
> matching will override the ID matching. (Although, maybe this won't w=
ork
> so well, since plenty of DT's erroneously have used "m25p80" even tho=
ugh
> they are not "m25p80" flash...)
>=20

I've implemented the solution you suggest in v5 of the series. I think =
the
implementation is backward compatible and should also work with DT usin=
g
"m25p80": we should still fall into the branch where the
"found %s, expected %s\n" warning message is printed.

I've just replaced the "jinfo !=3D info" test by
"jinfo->id_len !=3D info->id_len || memcmp(jinfo->id, info->id, info->i=
d_len)".

So it allows a add multiple entries in the spi_nor_ids[] table sharing =
the very
same JEDEC ID.

The right entry (info) is first selected by spi_nor_match_id() accordin=
g to the
'name' parameter, which is almost always set from the DT compatible str=
ing.
Non DT users can also select the entry they want as long as they provid=
e the
revelant string in the 'name' parameter of spi_nor_scan().

>> So what about a new DT named "m25p,4byte-opcodes" so the naming is c=
onsistent
>> with the existing "m25p,fast-read"?
>=20
> (I never liked the fast-read property, FWIW. It wasn't necessary.)
>=20
> If we're choosing new properties, let's not make them "m25p", since
> that's neither a vendor prefix, nor does it reflect its driver use ca=
se.
> (We would support it for non-m25p80-based drivers.)
>=20
> "spi-nor," might be a better prefix.

"spi-nor-4byte-opcodes" was v4.

>=20
>> For DT guys, I just sum the initial issue up: entering the 4byte add=
ress mode
>> as currently done changes the internal state of the SPI memory. If a=
 SoC reset
>> occurs, some early bootloaders not supporting this 4byte address mod=
e expect
>> to use only 3byte addresses for (Fast) Read operations =3D> the boot=
 is broken.
>> Then using the dedicated 4byte address op codes fixes the issue as t=
hey don't
>> change the internal memory state so early bootloader can still use 3=
byte
>> address op codes.
>=20
> Brian
>=20

Best regards,

Cyrille

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
