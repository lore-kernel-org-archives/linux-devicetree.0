From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH 3/4] arm: am33xx: DT quirks for am33xx based beaglebone variants
Date: Mon, 23 Feb 2015 20:48:39 +0200
Message-ID: <8252298C-4249-49F8-91CA-8398ADEB1348@antoniou-consulting.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-4-git-send-email-pantelis.antoniou@konsulko.com> <20150219181656.GF32521@atomide.com> <9C7BFC7C-0751-4233-927F-D01AF078704B@antoniou-consulting.com> <20150219183600.GG32521@atomide.com> <145DEB3E-A20E-4390-84B1-4B30E7C3D841@antoniou-consulting.com> <54EB73DC.4090507@hurleysoftware.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54EB73DC.4090507@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Tony Lindgren <tony@atomide.com>, Grant Likely <grant.likely@secretlab.ca>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Ludovic Desroches <ludovic.desroches@atmel.com>, Rob Herring <robherring2@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

> On Feb 23, 2015, at 20:39 , Peter Hurley <peter@hurleysoftware.com> w=
rote:
>=20
> Hi Pantelis,
>=20
> On 02/19/2015 01:44 PM, Pantelis Antoniou wrote:
>> Hi Tony,
>>=20
>>> On Feb 19, 2015, at 20:36 , Tony Lindgren <tony@atomide.com> wrote:
>>>=20
>>> * Pantelis Antoniou <panto@antoniou-consulting.com> [150219 10:32]:
>>>>> On Feb 19, 2015, at 20:16 , Tony Lindgren <tony@atomide.com> wrot=
e:
>>>>>=20
>>>>> Uhh I don't like the idea of duplicating the i2c-omap.c driver un=
der
>>>>> arch/arm.. And in general we should initialize things later rathe=
r
>>>>> than earlier.
>>>>>=20
>>>>> What's stopping doing these quirk checks later on time with just
>>>>> a regular device driver, something like drivers/misc/bbone-quirks=
=2Ec?
>>>>>=20
>>>>=20
>>>> We have no choice; we are way early in the boot process, right aft=
er
>>>> the device tree unflattening step.
>>>=20
>>> To me it seems the dt patching part should be done with minimal
>>> code before any driver like features..
>>>=20
>>=20
>> The way it=E2=80=99s done right now is with minimal code. Reading th=
e EEPROM
>> is required.
>>=20
>>>> I=E2=80=99ve toyed with the idea of using early platform devices b=
ut the omap-i2c driver
>>>> would need some tender love and care to make it work, and I didn=E2=
=80=99t want to get
>>>> bogged down with i2c driver details at this point.
>>>=20
>>> ..so how about just parse a kernel cmdline for the quirks to apply
>>> based on a version string or similar? That can be easily populated
>>> by u-boot or set manually with setenv.
>>>=20
>>> That leaves out the need for tinkering with i2c super early in
>>> the kernel for revision detection.
>>>=20
>>=20
>> You assume there=E2=80=99s going to be a bootloader=E2=80=A6
>=20
> So does this patch.
>=20

Proof of concept, first iteration=E2=80=A6 The beaglebone is just the p=
rototype stage.

>> diff --git a/arch/arm/mach-omap2/am33xx-dt-quirks.c b/arch/arm/mach-=
omap2/am33xx-dt-quirks.c
> [...]
>> + * Note that we rely on the bootloader setting up the muxes
>> + * (which is the case for u-boot).
>=20
> Regards,
> Peter Hurley
>=20

Regards

=E2=80=94 Pantelis
