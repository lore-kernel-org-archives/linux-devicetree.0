Return-Path: <SRS0=ZRjc=MY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:39974 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbeJLWpu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Oct 2018 18:45:50 -0400
Subject: Re: [PATCH] dt-bindings: gpio: altera-fpga-mgr: Add Altera FPGA
 manager GPIO bindings
References: <20181010192315.26163-1-marex@denx.de>
 <CACRpkdbAWVWgmS-9vgqCV6Bp4wZSfnOOMJmx15vTx-HQBe0WoA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <8e09ecc2-9757-4b59-bcf4-8c9ad62986d4@denx.de>
Date: Fri, 12 Oct 2018 16:11:58 +0200
MIME-Version: 1.0
In-Reply-To: <CACRpkdbAWVWgmS-9vgqCV6Bp4wZSfnOOMJmx15vTx-HQBe0WoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 10/11/2018 10:44 AM, Linus Walleij wrote:
> Hi Marek,

Hi!

> thanks for the patch!

thanks for the feedback!

> On Wed, Oct 10, 2018 at 9:23 PM Marek Vasut <marex@denx.de> wrote:
> 
>> Add DT bindings for the GPI / GPO block in the Altera SoCFPGA FPGA manager.
>> The GPIO block in the FPGA manager has two 32bit registers, one for setting
>> 32 GPOs and another one for reading 32 GPIs, both of which can be mapped to
>> separate physical pads.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
> (...)
> 
>> +- gpio,syscon-dev: phandle/offset pair. The phandle to syscon used to
>> +  access device state control registers and the offset of device's specific
>> +  registers within device state control registers range.
> (...)
>> +               gpio,syscon-dev = <&fpgamgr0 0x10>;
> 
> I didn't see that before.
> 
> It is usually not a good idea to encode register offsets into the
> device tree.
> 
> I think the register offset should be in the driver and determined
> from the compatible-string. If that is not possible, the compatible
> strings do not really indicate compatibility, if you see what I mean.
> 
> As for the name of the variable, why not just use:
> 
> syscon = <&fpgamgr0>;
> 
> It seems simple enough without any gpio,* prefix or explicitly
> suffixing it with a "-dev" - every node in the device tree is a device
> by definition so skip that.

Isn't it better to just have one compatible string for all SoCFPGAs and
handle the possible difference in offset where the registers are in DT?
It's the same as "reg" property which we use to describe where a certain
block is in the address space.

-- 
Best regards,
Marek Vasut
