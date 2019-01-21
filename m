Return-Path: <SRS0=wFgJ=P5=grandegger.com=wg@kernel.org>
Subject: Re: [PATCH V5 2/4] can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD
 driver basics
References: <20181221092950.14192-1-kernel@martin.sperl.org>
 <20181221092950.14192-3-kernel@martin.sperl.org>
 <89f96653-f850-8ae8-a390-bce93334c326@grandegger.com>
 <5D10FFC3-71DA-4C61-B038-C9D9D98CB260@martin.sperl.org>
From: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <b5f8b6c9-387f-e10b-afbc-f9b2dbcd07a8@grandegger.com>
Date: Mon, 21 Jan 2019 20:25:40 +0100
MIME-Version: 1.0
In-Reply-To: <5D10FFC3-71DA-4C61-B038-C9D9D98CB260@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
To: Martin Sperl <kernel@martin.sperl.org>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Martin,

Am 21.01.19 um 19:29 schrieb Martin Sperl:
> Hi Wolfgang,
> 
> Thanks for the review!
> I will add your feedback to v6 (which is already in version v6.7 fixing
> issues and more).
> 
> 
> On 21.01.2019, at 13:31, Wolfgang Grandegger <wg@grandegger.com
> <mailto:wg@grandegger.com>> wrote:
> 
>>>
>>
>> About file names and modularization: A "mcp25xxfd_xxx.c" should also have
>> a header file "mcp25xxfd_xxx.h" defining the interface and use the
>> prefix "mcp25xxfd_xxx". Therefore, "s/mcp25xxfd_base/mcp25xxfd" would
>> make more sense.
>>
> 
> Base came into play to say it is minimal and I did not figure
> out a way to get it working correctly without -base because
> Of some conflicts with generated Module code if I 
> remember correctly.

mcp25xxfd_base.c is fine but then you should also use

- mcp25xxfd_base.h
- struct mcp25xxfd_base_[priv/info]
- function prefix "mcp25xxfd_base_".

This would make clear, to what file/interface the functions belong to.

>> Also, could you please put just the register definitions in
>> "mcp25xxfd_reg.h".
>>
> I just wanted to keep the included minimal hence the 2 files
> that reflect the separation in the controller: mcp25xx (spi, clock, gpio)
> specific and Can specific

Well, I don't thinks it makes sense to separate the register definitions
into CAN and non-CAN related registers. You have defined all register
and bits... even more than really needed. Therefore I prefer to have it
in a separate file to clearly separate it from the interface related
definitions.

> 
>>>
>>> +static inline void mcp25xxfd_convert_to_cpu(u32 *data, int n)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < n; i++)
>>> +        data[i] = le32_to_cpu(data[i]);
>>
>> Is this optimized away if the endianess is the same?
> 
> Compiler should handle this automatically (also moved into 
> the header In v6)
> 
>>>
>>> +static int mcp25xxfd_first_byte(u32 mask)
>>> +{
>>> +    return (mask & 0x0000ffff) ?
>>> +        ((mask & 0x000000ff) ? 0 : 1) :
>>> +        ((mask & 0x00ff0000) ? 2 : 3);
>>> +}
>>
>> inline?
> 
> Inline not needed - compiler will in-line automatically when sufficient.
> This has moved to headers in v6 (where inline is then needed)

It was already set "inline" in patch 4/4.

>>>
>>> +static void mcp25xxfd_debugfs_remove(struct mcp25xxfd_priv *priv)
>>> +{
>>> +}
>>> +#endif
>>
>> And could you please put all debugfs stuff into "mcp25xxfd_debugfs.[ch]"
>> and define macros to increment the statistics if CONFIG_DEBUG_FS is
>> defined.
> 
> Some of the structures are only defined in the specific c file and
>  this would require now moving the structure into the header files
> 
> Also I thought that this way it was contained in a location related
> to where it is used.

The debugfs part is also a lot of code. Therefore my motivation is to
have it apart. And the statistics should only be incremented if
CONFIG_DEBUG_FS is "y". Therefore you need a macro for that purpose.

> 
>>>
>>> +    struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
>>> +    u32 value   = _mcp25xxfd_clkout_mask(spi);
>>
>> Just one space before and after "=", please! Here and in other places.
> Strange that chckpatch did not catch that...

I think checkpatch does not catch that issue.

> 
>>
>>> +#define CAN_SFR_BASE(x)            (0x000 + (x))
>>> +#define CAN_CON                CAN_SFR_BASE(0x00)
>>
>> The prefix "CAN_" is not generic enough. Name clashes, e.g. with
>> "CAN_INT" are not that unlikely. Why not using "MCP25XXFD_" instead?
>> And could you please mov the register definitions into "mcp25xxfd_reg.h".
> 
> Similar to above: can are can specific registers mcp2515 are ecc
> Clock and gpio specific registers.

But then the prefix should be "MCP25XXFD_CAN_". Well, these are
registers of the MCP2517FD and prefix "MCP25XXFD_<register-name>_" is
just fine.

> 
> Also adding mcp25xxfd makes it longer and that incurs more
> line breaks in code to fulfill the 80char rule...

The prefix "CAN_" is reserved for the CAN network and driver interface.
Especially "CAN_INT", etc. is not OK.

>>>
>>> +#  define CAN_CON_DEFAULT                \
>>> +    (CAN_CON_ISOCRCEN |                \
>>> +     CAN_CON_PXEDIS |                \
>>> +     CAN_CON_WAKFIL |                \
>>> +     (3 << CAN_CON_WFT_SHIFT) |            \
>>> +     CAN_CON_STEF |                    \
>>> +     CAN_CON_TXQEN |                \
>>> +     (CAN_CON_MODE_CONFIG << CAN_CON_OPMOD_SHIFT) |    \
>>> +     (CAN_CON_MODE_CONFIG << CAN_CON_REQOP_SHIFT))
>>
>> Could you please align to the right, here and below.
> 
> Checkpatch would complain then if I understand your 
> request correctly.

I cannot confirm that. I will complain if the line exceeds 80
chars... or what do you mean.

Wolfgang.
