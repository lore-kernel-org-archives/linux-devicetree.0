Return-Path: <SRS0=dseP=L2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mout02.posteo.de ([185.67.36.66]:55545 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727726AbeILVQL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Sep 2018 17:16:11 -0400
Received: from submission (posteo.de [89.146.220.130])
        by mout02.posteo.de (Postfix) with ESMTPS id 1738921168
        for <devicetree@vger.kernel.org>; Wed, 12 Sep 2018 18:10:54 +0200 (CEST)
Subject: Re: SPI CAN device enumeration / network device naming
References: <bbe4833a-ea46-6cad-eafb-4a7bc5b7a607@xor.wtf>
 <CAF1QFj_gev-_wB0cNkS1wv4uiVNKttW3wKMDOAd7FMhS211o-A@mail.gmail.com>
 <af240ebf-50ba-1ba4-0d41-040b14f811be@xor.wtf>
From: Patrick Menschel <menschel.p@posteo.de>
Message-ID: <3f3637e4-618e-e95c-bd1c-ee3afd8c8e0f@posteo.de>
Date: Wed, 12 Sep 2018 18:10:37 +0200
MIME-Version: 1.0
In-Reply-To: <af240ebf-50ba-1ba4-0d41-040b14f811be@xor.wtf>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Hubert Denkmair <xor@xor.wtf>
Cc: linux-can@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

I'm adding the devicetree mailing list to CC as they are the experts.

Normally you should get your numbering to work with aliases but I'm not
sure if it is used the same way in overlays.

aliases {
         can0 = &can0;
         can1 = &can1;
         can2 = &can2;
         can3 = &can3;
         };


Btw nice that my kicad contributions come to work by itself.
https://github.com/KiCad/kicad-symbols/pull/201
I was routing my own board but unpredictably holidays were over ;-)

Regards,
Patrick


> Thank you Chris!
> 
> Unfortunately, using multiple DT overlays is not a good solution for me;
> I want the raspi bootloader to load the overlay from the hat's EEPROM,
> and afaik, there can be only one overlay per EEPROM.
> 
> For now, I'm using a udev rules file:
> ---
> ACTION=="add", SUBSYSTEM=="net", DEVPATH=="/devices/platform/soc/*/spi0.0/net/can?", NAME="can0"
> ACTION=="add", SUBSYSTEM=="net", DEVPATH=="/devices/platform/soc/*/spi0.1/net/can?", NAME="can1"
> ACTION=="add", SUBSYSTEM=="net", DEVPATH=="/devices/platform/soc/*/spi1.0/net/can?", NAME="can2"
> ACTION=="add", SUBSYSTEM=="net", DEVPATH=="/devices/platform/soc/*/spi1.1/net/can?", NAME="can3"
> ---
> 
> But that still requires installing that file in the linux image; 
> If possible, I'd still prefer some way to achieve this in the device tree overlay.
> 
> Greetings,
> 
> Hubert
> 
> 
> Am 12.09.2018 um 00:23 schrieb Chris Sauer:
>> This is because these fragment names dont actually matter neither does
>> the order or the number you could change fragment@1 to fragment@4 and
>> you would get the same randomness.
>> You will need to split 4xMCP2517FD.dts into MCP2517FD-can0.dts
>> MCP2517FD-can1.dts MCP2517FD-can2.dts and MCP2517FD-can3.dts and
>> define your /boot/config.txt in the order you need it.
>>
>> dtoverlay=mcp2515-can0-overlay,oscillator=16000000,interrupt=Xx
>> dtoverlay=mcp2515-can1-overlay,oscillator=16000000,interrupt=Xx
>> dtoverlay=mcp2515-can2-overlay,oscillator=16000000,interrupt=Xx
>> dtoverlay=mcp2515-can3-overlay,oscillator=16000000,interrupt=Xx
>>
>> We ran though a similar issue on our dual can board. I am by no means
>> a device tree expert but /boot/config.txt does get processed in order
>> where as those DTS files get parsed by  for_each_child_of_node() Which
>> does not guarantee init order. I believe there are some tricks you can
>> do but they aren't very clean or involve editing drivers/of/overlay.c
>> and thats a total pain. Sorry If someone gets this two or three times
>> I forgot to turn on plaintext only mode.
>>
>> On Tue, Sep 11, 2018 at 3:30 PM Hubert Denkmair <xor@xor.wtf> wrote:
>>>
>>> Hi all,
>>>
>>> I'm currently building a open hardware Raspberry Pi HAT
>>> with four MCP2517FD SPI CAN controllers:
>>> https://github.com/Bytewerk/QuadCAN-FD/tree/v1
>>>
>>> This seems to work with the device tree overlay from said
>>> repository and Martin Sperls latest MCP25xxFD patches \o/
>>>
>>> Now, I have one problem and I'm not sure how to address this.
>>> I'm using a Raspberry Pi 3 Model B+ with current raspbian.
>>>
>>> Maybe 90% of all boots, I get the following in dmesg:
>>> ---
>>> [    3.877118] mcp25xxfd: loading out-of-tree module taints kernel.
>>> [    3.890743] mcp25xxfd spi0.0 can0: MCP2517 successfully initialized.
>>> [    3.901189] mcp25xxfd spi0.1 can1: MCP2517 successfully initialized.
>>> [    3.910035] mcp25xxfd spi1.1 can2: MCP2517 successfully initialized.
>>> [    3.920515] mcp25xxfd spi1.0 can3: MCP2517 successfully initialized.
>>> ---
>>>
>>> But sometimes, the SPIs seem to get enumerated in different order:
>>> ---
>>> [    3.720432] mcp25xxfd: loading out-of-tree module taints kernel.
>>> [    3.733176] mcp25xxfd spi1.1 can0: MCP2517 successfully initialized.
>>> [    3.741914] mcp25xxfd spi1.0 can1: MCP2517 successfully initialized.
>>> [    3.750370] mcp25xxfd spi0.0 can2: MCP2517 successfully initialized.
>>> [    3.758741] mcp25xxfd spi0.1 can3: MCP2517 successfully initialized.
>>> ---
>>>
>>> Also, I sometimes see the kernel taint message twice or even more.
>>> I expect this to be a concurrency problem with one CPI core enumerating
>>> one SPI bus, and another core enumerating the other?
>>>
>>> What's the best(tm) way to ensure consistent device naming in such a setup?
>>> Is there anything that could be done in device tree
>>> (so that I wouldn't have to touch the linux image itself)?
>>>
>>> Thanks,
>>>
>>> Hubert
