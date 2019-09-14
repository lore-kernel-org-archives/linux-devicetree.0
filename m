Return-Path: <SRS0=7xkd=XJ=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH V2] of: Fix of_empty_ranges_quirk()
References: <20190907161537.27258-1-marek.vasut@gmail.com>
 <CAL_JsqKSWD5EOGdvGS7Z8pd6OALRsqxv2GmVLd+9ZoOyPgbr-w@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8496c1b5-e4fe-ad92-942d-3e0788ee91fb@gmail.com>
Date: Sat, 14 Sep 2019 18:05:55 +0200
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKSWD5EOGdvGS7Z8pd6OALRsqxv2GmVLd+9ZoOyPgbr-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Frank Rowand <frowand.list@gmail.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 9/13/19 5:29 PM, Rob Herring wrote:
>> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
>> types, which cannot work well. Replace that with boolean only and fix
>> usage logic in of_translate_one() -- the check should trigger when the
>> ranges are NULL and the quirk is applicable on the hardware.
> 
> Just moving to boolean has seemed like weak justification for this
> churn, but now that I've seen your work on PCI dma-ranges it makes a
> bit more sense.
> 
> We do have a problem that unlike 'ranges', 'dma-ranges' being missing
> probably needs to be treated as 1:1 translation. I can't really
> picture a case where dma-ranges would be used with a non-translatable
> address. Perhaps a module with optional DMA and the DMA is not hooked
> up. That could be expressed with dma-ranges with a 0 size or a
> different compatible. So your v1 patch was perhaps correct change in
> behavior, but only for dma-ranges. (I've written one that works in
> both cases).

Is that posted somewhere ?

The controller node /soc/pcie@fe000000/ already has dma-ranges [1]
though, so I wonder if it's the PCIe translation patches which need to
be updated then ?

[1]
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm64/boot/dts/renesas/r8a7795.dtsi#L2653

-- 
Best regards,
Marek Vasut
