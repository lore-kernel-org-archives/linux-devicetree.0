From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Mon, 21 Sep 2015 15:07:08 +0200
Message-ID: <CAMuHMdXEzZxu8Hg6Z6u1ZEe0ondU+S0ffBvxYGzid38sXAksDw@mail.gmail.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1442419866-4982-3-git-send-email-pantelis.antoniou@konsulko.com>
	<CAMuHMdXWwZ4BZsR8qqpM1Z6hVj9e3Z0Z4bypm42PFZ_C6KX+tg@mail.gmail.com>
	<324F27EC-FC71-4C50-926A-08AAF2A1114C@konsulko.com>
	<CAMuHMdUDXZFun7+y3axnz6HKiNaeJnPkVG6Qhq6y4=mcCpPL2w@mail.gmail.com>
	<EA80A53C-430B-450D-B843-21DFF0FB01D8@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <EA80A53C-430B-450D-B843-21DFF0FB01D8@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Mon, Sep 21, 2015 at 2:49 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
>> On Sep 21, 2015, at 15:47 , Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>> On Mon, Sep 21, 2015 at 2:36 PM, Pantelis Antoniou
>> <pantelis.antoniou@konsulko.com> wrote:
>>>> On Sep 21, 2015, at 15:35 , Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
>>>> On Wed, Sep 16, 2015 at 6:11 PM, Pantelis Antoniou
>>>> <pantelis.antoniou@konsulko.com> wrote:
>>>>> Changesets are very powerful, but the lack of a helper API
>>>>> makes using them cumbersome. Introduce a simple copy based
>>>>> API that makes things considerably easier.
>>>>>
>>>>> To wit, adding a property using the raw API.
>>>>>
>>>>>       struct property *prop;
>>>>>       prop =3D kzalloc(sizeof(*prop)), GFP_KERNEL);
>>>>>       prop->name =3D kstrdup("compatible");
>>>>>       prop->value =3D kstrdup("foo,bar");
>>>>>       prop->length =3D strlen(prop->value) + 1;
>>>>>       of_changeset_add_property(ocs, np, prop);
>>>>>
>>>>> while using the helper API
>>>>>
>>>>>       of_changeset_add_property_string(ocs, np, "compatible",
>>>>>                       "foo,bar");
>>>>
>>>> What about removing properties?
>>>
>>> Once upon a time there was that capability. It was removed after we=
 didn=E2=80=99t have
>>> a good use for them yet. Do you have any? I=E2=80=99d be happy to r=
e-add it :)
>>
>> Aliases?
>>
>> If an overlay removes e.g. a serial port, it should remove its alias=
, too.
>
> Well, that case is handled. Addition of a property results in removal=
 of a property when
> the overlay is reverted.

Actually what I meant is the other way around: _adding_ the overlay wou=
ld
_remove_ the alias.

I have a board with an SDHI connector, and an expansion connector.
SDHI and serial on the expansion connector share the same pins.
By default, SDHI is enabled in the DTS.

To add a serial port to the expansion connector, I disable the SDHI dev=
ice,
add the alias, and add the serial device.
(dtsi in http://www.spinics.net/lists/devicetree/msg79438.html)

Now imagine doing the opposite: having the serial device enabled by def=
ault.
Then the overlay should disable the serial device, remove the alias, an=
d add
the SDHI device.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
