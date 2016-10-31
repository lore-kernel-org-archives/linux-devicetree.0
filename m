From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: bus: da8xx-mstpri: new driver
Date: Mon, 31 Oct 2016 12:22:23 -0600
Message-ID: <m2bmy02xb4.fsf@baylibre.com>
References: <1477503355-2600-1-git-send-email-bgolaszewski@baylibre.com>
        <1477503355-2600-3-git-send-email-bgolaszewski@baylibre.com>
        <20161031043015.74ppaship5nqfaqt@rob-hp-laptop>
        <CAMpxmJW85TQObLdoGW2ApnkM8OiM4d1ZDd=9eyGmeVXXwqByPQ@mail.gmail.com>
        <0cac724d-1aee-dfa7-9b78-8366fd6fceff@ti.com>
        <CAMpxmJX7SjE1zs926Fn-=jsZhPsOK6ey0hHM8LBhNS1nuSuFFQ@mail.gmail.com>
        <0d5d1e41-b8e6-5d60-6da1-5b6ddd9bc07e@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0d5d1e41-b8e6-5d60-6da1-5b6ddd9bc07e-l0cyMroinI0@public.gmane.org> (Sekhar Nori's
        message of "Mon, 31 Oct 2016 16:01:09 +0530")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> writes:

> On Monday 31 October 2016 03:24 PM, Bartosz Golaszewski wrote:
>> 2016-10-31 10:52 GMT+01:00 Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>:
>>> Hi Bartosz,
>>>
>>> On Monday 31 October 2016 03:10 PM, Bartosz Golaszewski wrote:
>>>> 2016-10-31 5:30 GMT+01:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>>>>> On Wed, Oct 26, 2016 at 07:35:55PM +0200, Bartosz Golaszewski wrote:
>>>>>> Create the driver for the da8xx master peripheral priority
>>>>>> configuration and implement support for writing to the three
>>>>>> Master Priority registers on da850 SoCs.
>>>>>>
>>>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>>>> ---
>>>>>>  .../devicetree/bindings/bus/ti,da850-mstpri.txt    |  20 ++
>>>>>>  drivers/bus/Kconfig                                |   9 +
>>>>>>  drivers/bus/Makefile                               |   2 +
>>>>>>  drivers/bus/da8xx-mstpri.c                         | 266 +++++++++++++++++++++
>>>>>>  4 files changed, 297 insertions(+)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt
>>>>>>  create mode 100644 drivers/bus/da8xx-mstpri.c
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt b/Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt
>>>>>> new file mode 100644
>>>>>> index 0000000..225af09
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt
>>>>>> @@ -0,0 +1,20 @@
>>>>>> +* Device tree bindings for Texas Instruments da8xx master peripheral
>>>>>> +  priority driver
>>>>>> +
>>>>>> +DA8XX SoCs feature a set of registers allowing to change the priority of all
>>>>>> +peripherals classified as masters.
>>>>>> +
>>>>>> +Documentation:
>>>>>> +OMAP-L138 (DA850) - http://www.ti.com/lit/ug/spruh82c/spruh82c.pdf
>>>>>> +
>>>>>> +Required properties:
>>>>>> +
>>>>>> +- compatible:                "ti,da850-mstpri", "syscon" - for da850 based boards
>>>>>
>>>>> Drop syscon. Doesn't look like it is needed and the example doesn't
>>>>> match.
>>>>
>>>> Hi Rob,
>>>>
>>>> it is needed: syscon_regmap_lookup_by_compatible() fails without it. I
>>>> fixed the example instead.
>>>
>>> Why are master priority registers under syscon? This driver should be
>>> the only entity touching them. So do we need an MFD driver?
>>>
>> 
>> It should, but syscfg0 registers are mapped all over the place. I
>
> Not sure what you mean by this. Yes, the sysconfig module has many
> functionalities. But the registers for a given functionality are all
> grouped together AFAICS (except CHIPCFGn, see below).
>
> Pinmux registers are part of syscfg module, but don't use syscon.
>
> In the work going on for OHCI support, chipcfg registers are being put
> under a syscon node. But that makes sense, I think, because chipcfg
> registers are catering to really diverse functionality like PLL and EDMA
> related stuff being placed in the same register - CHIPCFG0.
>
>> thought it would be safer to put them under syscon and Kevin agreed.
>
> Before using syscon for the whole syscfg space, I think we need some
> analysis as to where the likely races are going to be.

I'm OK with that for now.  It makes the most sense to use sycon only for
the register (ranges) that will actually be shared.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
