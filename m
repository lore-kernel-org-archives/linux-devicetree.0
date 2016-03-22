From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] mtd: spi-nor: add an alternative method to support
 memory >16MiB
Date: Tue, 22 Mar 2016 12:27:32 +0100
Message-ID: <56F12C24.6040206@atmel.com>
References: <1458556429-11741-1-git-send-email-cyrille.pitchen@atmel.com>
 <20160321170107.GG2545@google.com> <56F02C70.6050106@atmel.com>
 <20160321175537.GH2545@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160321175537.GH2545-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 21/03/2016 18:55, Brian Norris a =E9crit :
> On Mon, Mar 21, 2016 at 06:16:32PM +0100, Cyrille Pitchen wrote:
>> Le 21/03/2016 18:01, Brian Norris a =E9crit :
>>> On Mon, Mar 21, 2016 at 11:33:49AM +0100, Cyrille Pitchen wrote:
>>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kco=
nfig
>>>> index d42c98e1f581..7fae36fc8526 100644
>>>> --- a/drivers/mtd/spi-nor/Kconfig
>>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>>> @@ -29,6 +29,18 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>>>>  	  Please note that some tools/drivers/filesystems may not work w=
ith
>>>>  	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
>>>> =20
>>>> +config MTD_SPI_NOR_USE_4B_OPCODES
>>>> +	bool "Use 4-byte address op codes"
>>>> +	default n
>>>> +	help
>>>> +	  This is an alternative to the "Enter/Exit 4-byte mode" command=
s and
>>>> +	  Base Address Register (BAR) updates to support flash size abov=
e 16MiB.
>>>> +	  Using dedicated 4-byte address op codes for (Fast) Read, Page =
Program
>>>> +	  and Sector Erase operations avoids changing the internal state=
 of the
>>>> +	  SPI NOR memory. Hence if a CPU reset occurs, early bootloaders=
 can
>>>> +	  still use regular 3-byte address op codes and read from the ve=
ry first
>>>> +	  16MiB of the flash memory.
>>>> +
>>>
>>> Why does this need to be a Kconfig option? Can't it just as well be
>>> supported by keeping entries in the ID table, to show which flash
>>> support these opcodes and which don't? Kconfig is really a bad mech=
anism
>>> for trying to configure your flash.
>>
>> Well, the only reason why I've chosen a Kconfig option is to be as s=
afe as
>> possible, if for some reason someone still wants to use the former
>> implementation. Honestly I don't know why one would do so but I'm ca=
utious
>> so I also set "default n". This way no regression is introduced.
>=20
> I think the main reason is that some manufacturers did not initially
> support both methods. So we couldn't just say "all Micron" or "all
> Macronix" should use these opcodes. Spansion was the only one to supp=
ort
> them consistently. See [1] for reference.
>=20
> And actually, your Kconfig option is not "cautious", because you have=
 no
> guarantee that people will make intelligent choices here. So you're
> making a Kconfig that if someone accidentally turns it on, their flas=
h
> might not work any more. That's much less safe than properly labellin=
g
> which flash supports which feature.
>=20
>> If you think it's better to use a dedicated flag like SECT_4K or
>> SPI_NOR_QUAD_READ in the spi_nor_ids[] table, I'm perfectly fine wit=
h it as
>> well.
>=20
> I think that would be better. (Really, an opt-out would be the least
> work in the long-run I think, since IIRC there were only a few
> early-generation flash that were both large enough to need 4 byte
> addressing and didn't support the dedicated opcodes. But it'll be har=
d
> to track those down now I think, so opt-in probably is most practical=
=2E)
>=20
>> Just let me know your choice then I'll update my patch accordingly i=
f needed.
>=20
> Brian
>=20
> [1]
> commit 87c9511fba2bd069a35e1312587a29e112fc0cd6
> Author: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date:   Thu Apr 11 01:34:57 2013 -0700
>=20
>     mtd: m25p80: utilize dedicated 4-byte addressing commands
>=20

Indeed, your commit message is very interesting since it points out som=
e issue
I already face: for my test I'm currently using a Macronix MX25L25673G
(JEDEC ID C22019). This memory *does* support the dedicated 4byte addre=
ss op
codes.

Then if I look at the datasheet for the Macronix MX25L25635E, this olde=
r memory
shares the exact same JEDEC ID, C22019 but *doesn't* support the 4byte =
address
op codes.

None of these two memory types use ext id: the JEDEC ID is only 3byte l=
ong.
Anyway, in QPI mode, the QPIID command (0xAF), which replaces the regul=
ar
Read ID command (0x9f) only sends 3 bytes too.

The memory table inside the spi-nor framework is indexed by JEDEC ID (+=
 ext id)
but we've just pointed out a case where it is not possible to create tw=
o
different entries in this table, one for the 35E without the "4byte" fl=
ag, the
other for 73G with the "4byte" flag.

So there is no mean for the software to discover at runtime what are th=
e actual
capabilities of the memory. Hence I think we should introduce a DT prop=
erty
which would clearly tell the spi-nor framework that we want to use the
dedicated 4byte address op codes instead of entering the 4byte address =
mode
(still the default behaviour since older memories only support this mod=
e).

So what about a new DT named "m25p,4byte-opcodes" so the naming is cons=
istent
with the existing "m25p,fast-read"?

=46or DT guys, I just sum the initial issue up: entering the 4byte addr=
ess mode
as currently done changes the internal state of the SPI memory. If a So=
C reset
occurs, some early bootloaders not supporting this 4byte address mode e=
xpect
to use only 3byte addresses for (Fast) Read operations =3D> the boot is=
 broken.
Then using the dedicated 4byte address op codes fixes the issue as they=
 don't
change the internal memory state so early bootloader can still use 3byt=
e
address op codes.

Best regards,

Cyrille
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
