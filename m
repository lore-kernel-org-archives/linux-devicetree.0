From: "Fabian Vogt" <fabian@ritter-vogt.de>
Subject: Re: [PATCH V3] gpio: New driver for LSI ZEVIO SoCs
Date: Sun, 25 Aug 2013 21:44:29 +0200
Message-ID: <op.w2d04ftpu7prd4@fabians-laptop.fritz.box>
References: <1375879989-18606-1-git-send-email-fabian@ritter-vogt.de>
 <5217BB73.8050907@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5217BB73.8050907@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, grant.likely@linaro.org, pawel.moll@arm.com
List-Id: devicetree@vger.kernel.org

Hi,

> On 08/07/2013 06:53 AM, Fabian Vogt wrote:
>> This driver supports the GPIO controller found in LSI ZEVIO SoCs.
>> It has been successfully tested on a TI nspire CX calculator.
>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt  
>> b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
>
>> +Zevio GPIO controller
>> +
>> +Required properties:
>> +- compatible = "lsi,zevio-gpio"
>
> Is there only one zevio chip, or a series? Is "zevio" the full name of
> the chip, including any version number?
We don't know, it's a relableled chip with
TI-NSPIRE / L9A0702 / TI-NS2006A-0 / LSI LOGIC / ZEVIO / U 0714 /  
WYJ14052-1
on it. But this driver should match the other drivers (lsi,zevio-intc,  
lsi,zevio-timer).

>> +- reg = <BASEADDR SIZE>
>> +- #gpio-cells = <2>
>> +- gpio-controller;
>> +
>> +Optional:
>> +- #ngpios = <32>: Number of GPIOs. Defaults to 32 if absent
>
> Perhaps one can derive that from the compatible value? The fact this
> property exists implies there's more than one zevio chip, so perhaps
> each should have an explicit compatible value described above?
I added it just for someone who maybe needs it. It's only two lines and  
maybe
it'll be helpful for someone. We don't know whether some similiar or this  
controller
exist in different configurations (pin count, section sice, register  
layout).
Also I hate hardcoded values which require a recompile to change..

> Is the GPIO block not also an interrupt source/controller? I see the
> following in the patch, and references to some IRQ registers...
>
>> +	select GENERIC_IRQ_CHIP
I forgot to remove this line after testing the interrupts, the tests went  
horribly (hard lockups)...

V4 should be underway soon.

Bye,
Fabian
