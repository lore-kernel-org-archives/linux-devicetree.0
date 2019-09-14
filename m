Return-Path: <SRS0=rWSk=XJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38383 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfINQpM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 14 Sep 2019 12:45:12 -0400
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAMuHMdXVhtE5Jmpu8QYv+P8pGtegr4MGhNGRwy4Y1wRQYmL2_Q@mail.gmail.com>
 <f1b11b42-99ee-0484-550e-8758ec6fa559@gmail.com>
 <CAMuHMdWz05ALM745tpw=AT2Q30nXvQV39JXTATYTEoTmH1TSRQ@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ad3f986d-90bb-a47b-aa24-c326fb369202@gmail.com>
Date: Sat, 14 Sep 2019 18:45:08 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWz05ALM745tpw=AT2Q30nXvQV39JXTATYTEoTmH1TSRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 9/14/19 6:33 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sat, Sep 14, 2019 at 6:06 PM Marek Vasut wrote:
>> On 9/9/19 1:18 PM, Geert Uytterhoeven wrote:
>>> On Sat, Sep 7, 2019 at 6:16 PM Marek Vasut wrote:
>>>> Add dma-ranges property into /soc node to describe the DMA capabilities
>>>> of the bus. This is currently needed to translate PCI DMA ranges, which
>>>> are limited to 32bit addresses.
>>>
>>>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>>> @@ -330,6 +330,7 @@
>>>>                 #address-cells = <2>;
>>>>                 #size-cells = <2>;
>>>>                 ranges;
>>>> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
>>>
>>> Shouldn't the length be 0x80000000 (for all SoCs)?
>>
>> Or should that match the amount of DRAM below 32bit boundary ?
> 
> Which is 0x80000000, according to the memory area section for the
> various R-Car Gen3 SoCs.

What if you have a system with 1 GiB of DRAM ?

>>> Or should we allow DMA to internal System RAM, too?
>>
>> I think we should include SRAM, yes.
> 
> So that needs a separate range.

Let's see how the discussion pans out about the placement of the
dma-ranges in the first place.

-- 
Best regards,
Marek Vasut
