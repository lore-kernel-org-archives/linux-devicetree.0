From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm: dts: mt2701: add nor flash node
Date: Wed, 10 May 2017 12:49:39 +0200
Message-ID: <1a788098-1cf8-5fec-e847-5c14189f8586@gmail.com>
References: <1485315515-29942-1-git-send-email-guochun.mao@mediatek.com>
 <1485315515-29942-3-git-send-email-guochun.mao@mediatek.com>
 <1486267249.10417.9.camel@mhfsdcap03> <20170206084544.24878633@bbrezillon>
 <77e0e3b0-2fe4-b32b-9099-11ce9811ba15@gmail.com>
 <1487044733.19037.0.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487044733.19037.0.camel@mhfsdcap03>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 14/02/17 04:58, Guochun Mao wrote:
> On Sun, 2017-02-12 at 07:35 +0800, Matthias Brugger wrote:
>>
>> On 02/06/2017 08:45 AM, Boris Brezillon wrote:
>>> Hi Guochun,
>>>
>>> On Sun, 5 Feb 2017 12:00:49 +0800
>>> Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>>
>>>
>>>>>
>>>>> +   nor_flash: spi@11014000 {
>>>>> +           compatible = "mediatek,mt2701-nor",
>>>>> +                        "mediatek,mt8173-nor";
>>>>> +           reg = <0 0x11014000 0 0xe0>;
>>>>> +           clocks = <&pericfg CLK_PERI_FLASH>,
>>>>> +                    <&topckgen CLK_TOP_FLASH_SEL>;
>>>>> +           clock-names = "spi", "sf";
>>>>> +           #address-cells = <1>;
>>>>> +           #size-cells = <0>;
>>>>> +           status = "disabled";
>>>>> +   };
>>>>> +
>>>>>      mmsys: syscon@14000000 {
>>>>>              compatible = "mediatek,mt2701-mmsys", "syscon";
>>>>>              reg = <0 0x14000000 0 0x1000>;
>>>>
>>>> Hi,
>>>> mtk-quadspi.txt had been updated as suggested.
>>>> Is there suggestion about this patch?
>>>
>>> It should probably go through the Mediatek tree. Matthias, any opinion?
>>>
>>
>> Yes, I will take this one through mine tree.
>>
>> Thanks,
>> Matthias
> 
> Thanks,
> Guochun
> 
> 

Queued now for v4.12-next/dts32
Sorry for the delay.

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
