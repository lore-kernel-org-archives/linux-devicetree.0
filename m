From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec" binding
Date: Thu, 12 Mar 2015 11:36:29 +0100
Message-ID: <CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w@mail.gmail.com>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
	<CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12 March 2015 at 11:19, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wr=
ote:
> On Wed, Mar 11, 2015 at 10:57 PM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Docu=
mentation/devicetree/bindings/mtd/m25p80.txt
>> index 4611aa83531b..1b2997d4cee4 100644
>> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
>> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
>> @@ -3,9 +3,12 @@
>>  Required properties:
>>  - #address-cells, #size-cells : Must be present if the device has s=
ub-nodes
>>    representing partitions.
>> -- compatible : Should be the manufacturer and the name of the chip.=
 Bear in mind
>> +- compatible : Should be "nor-jedec" for any SPI NOR flash that can=
 be
>> +               identified by the JEDEC READ ID opcode (0x95).
>> +               Additionally, may include a device-specific string c=
onsisting of
>> +               the manufacturer and name of the chip. Bear in mind
>
> For the casual reader, this suggests putting "nor-jedec" first, which=
 is not
> what we want. So I would write it like e.g.
>
> "Should be the manufacturer and the name of the chip. Additionally,
>  should contain "nor-jedec" for any SPI NOR flash that can be
>  identified by the JEDEC READ ID opcode (0x95)."

I don't really like above. It suggests using manufacturer,name
always/in most cases. This is what we want to avoid. Let's use
"nor-jedec" wherever possible (when dealing with JEDEC compatible
flashes).

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
