From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec" binding
Date: Thu, 12 Mar 2015 11:40:50 +0100
Message-ID: <CAMuHMdWszFbs2N8W0-O35-fWydetMx8tHvn7NLEyZi_ZL9R1tA@mail.gmail.com>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
	<CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g@mail.gmail.com>
	<CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 12, 2015 at 11:36 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail=
=2Ecom> wrote:
> On 12 March 2015 at 11:19, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> =
wrote:
>> On Wed, Mar 11, 2015 at 10:57 PM, Brian Norris
>> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Doc=
umentation/devicetree/bindings/mtd/m25p80.txt
>>> index 4611aa83531b..1b2997d4cee4 100644
>>> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
>>> @@ -3,9 +3,12 @@
>>>  Required properties:
>>>  - #address-cells, #size-cells : Must be present if the device has =
sub-nodes
>>>    representing partitions.
>>> -- compatible : Should be the manufacturer and the name of the chip=
=2E Bear in mind
>>> +- compatible : Should be "nor-jedec" for any SPI NOR flash that ca=
n be
>>> +               identified by the JEDEC READ ID opcode (0x95).
>>> +               Additionally, may include a device-specific string =
consisting of
>>> +               the manufacturer and name of the chip. Bear in mind
>>
>> For the casual reader, this suggests putting "nor-jedec" first, whic=
h is not
>> what we want. So I would write it like e.g.
>>
>> "Should be the manufacturer and the name of the chip. Additionally,
>>  should contain "nor-jedec" for any SPI NOR flash that can be
>>  identified by the JEDEC READ ID opcode (0x95)."
>
> I don't really like above. It suggests using manufacturer,name
> always/in most cases. This is what we want to avoid. Let's use
> "nor-jedec" wherever possible (when dealing with JEDEC compatible
> flashes).

Why? It's a basic DT principle to always specify the real device.
One day you might find a deviation from the nor-jedec spec, which you c=
annot
handle if the device node doesn't claim compatibility with the real dev=
ice.

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
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
