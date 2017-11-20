From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of
 supported chip names
Date: Mon, 20 Nov 2017 18:08:10 +0100
Message-ID: <a24377af-0029-23f7-b6cb-301639e47eaa@wedev4u.fr>
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <658ceb2b-5d2b-9349-f140-27858459e5a8@wedev4u.fr>
 <CAMuHMdWZ=71XvVyzsiPyiAz+0RsCZjmWqqvOKs=bDdSQMpLmnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWZ=71XvVyzsiPyiAz+0RsCZjmWqqvOKs=bDdSQMpLmnA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>, MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Le 20/11/2017 à 09:49, Geert Uytterhoeven a écrit :
> Hi Cyrille,
> 
> On Fri, Nov 17, 2017 at 6:36 PM, Cyrille Pitchen
> <cyrille.pitchen@wedev4u.fr> wrote:
>> sorry but I won't apply this patch.
>>
>> New values for the 'compatible' DT properties should only be added for
>> memory parts not supporting the JEDEC READ ID (0x9F) command.
> 
> I tent to disagree. Documenting part numbers in the DT bindings serves two
> purposes:
>   1. Documenting which parts are supported,

Documenting supported memory parts is not the same as documenting chip names
that can be used in the 'compatible' DT property. Here we are talking about
DT bindings.

>   2. Allowing checkpatch to validate compatible values in DTS files (see
>      below).
>

I you want to pass the checkpatch test then use the "jedec,spi-nor" string
alone. Please have a look at the drives/mtd/devices/m25p80.c file in the
m25p_of_table[] array: this is the value to be set in the 'compatible' DT
property.

SST25 memories do support the JEDEC READ ID op code (0x9F), so there is no
reason to use any other value but "jedec,spi-nor" for the 'compatible' DT
property.

Adding useless values would go to the wrong direction:
3094fe121e75 ("mtd: m25p80: remove unused flash entries from id_table")

As I've explained, the only new values that should be added in the m25p80.c
driver and the jedec,spi-nor.txt files are those for memory parts not
supporting the JEDEC READ ID op code (0x9F). No exception to that rule.

Also please note that there are far more entries in the spi_nor_ids[] array
from drivers/mtd/spi-nor/spi-nor.c than in the m25p_ids[] array from
drivers/mtd/devices/m25p80.c. Indeed, names in the spi_nor_ids[] array are
mostly informative and should not be considered as values for the
'compatible' DT properties.
For 'compatible' values, you should consider the m25p80.c driver only.

Moreover, we should refer to the comment in the m25p_ids[] array, applying
to the sst25vf016b memory part:

"""
Entries that were used in DTs without "jedec,spi-nor" fallback and
should be kept for backward compatibility.
"""

This is for backward compatibility purpose only, with some existing DTs,
likely before the "jedec,spi-nor" string was introduced.
However new DTs using values like "sst25vf016b" are _wrong_ and that's
why this is not documented is the jedec,spi-nor.txt file.

Best regards,

Cyrille
 
> Unfortunately the current
> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> is useless for the latter, as the values listed don't contain the vendor
> prefixes, still causing warnings like
> 
> WARNING: DT compatible string "sst,sst25vf016b" appears un-documented
> -- check ./Documentation/devicetree/bindings/
> #79: FILE: arch/arm/boot/dts/r8a7743-iwg20m.dtsi:79:
> + compatible = "sst,sst25vf016b", "jedec,spi-nor";
>

This is a deprecated usage. I agree some DT use such patterns; this is
legacy and we have to deal with it however it doesn't mean that it is the
correct binding. New device trees should use "jedec,spi-nor" alone.

That's something I plan to clarify in the jedec,spi-nor.txt file once
4.15-rc1 will be released.

> So I suggest prepending all part number with the appropriate vendor prefixes
> in jedec,spi-nor.txt.
>

And which prefix should be use ? I see both "microchip,sst25vf016b" and
"sst,sst25vf016b" in device trees.

> BTW, "sst" (for Silicon Storage Technology) should be added to
> Documentation/devicetree/bindings/vendor-prefixes.txt, too, to avoid another
> warning:
> 
> WARNING: DT compatible string vendor "sst" appears un-documented --
> check ./Documentation/devicetree/bindings/vendor-prefixes.txt
> #79: FILE: arch/arm/boot/dts/r8a7743-iwg20m.dtsi:79:
> + compatible = "sst,sst25vf016b", "jedec,spi-nor";
> 
>> SST25 memories do support this command hence should use the "jedec,spi-nor"
>> value alone. For historical reasons, some DT nodes set their 'compatible'
>> string to something like "<vendor>,<model>", "jedec,spi-nor".
>> It should work as expected in most case however I discourage from doing so
>> in new device trees because it may have some side effects especially when
>> the m25p80.c driver is used between the spi-nor.c driver and the SPI
>> controller driver.
> 
> It is considered good practice to always have in DT a compatible value for
> the real part number, not just for a generic fallback.
> This allows to discriminate using the real part number, in case an anomaly
> shows up later.
> How else are you gonna handle e.g. a production batch that accidentally
> contains a wrong JEDEC ID? And adding the part-specific compatible value
> after the discovery won't help, as it won't be present in existing DTSes.
> 
>> It's all about setting the 2nd parameter of spi_nor_scan(), the 'name'
>> parameter, as NULL when possible. This parameter should be set to a non NULL
>> value only for memories not supporting the JEDEC READ ID op code (0x9F).
>>
>> Best regards,
>>
>> Cyrille
>>
>> Le 24/10/2017 à 15:50, Fabrizio Castro a écrit :
>>> There are a few DT files that make use of sst25vf016b in their
>>> compatible strings, and the driver supports this chip already.
>>> This patch improves the documentation and therefore the result
>>> of ./scripts/checkpatch.pl.
>>>
>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>> Signed-off-by: Chris Paterson <Chris.Paterson2@renesas.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> Thank you Rob, thank you Geert, and sorry for the delay on this one.
>>> Here is v2.
>>>
>>> Changes in v2:
>>> * fixed subject prefix
>>> * added changelog
>>>
>>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> index 4cab5d8..bf56d77 100644
>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> @@ -31,6 +31,7 @@ Required properties:
>>>                   s25sl12801
>>>                   s25fl008k
>>>                   s25fl064k
>>> +                 sst25vf016b
>>>                   sst25vf040b
>>>                   sst25wf040b
>>>                   m25p40
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
