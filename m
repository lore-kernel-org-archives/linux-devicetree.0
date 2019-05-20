Return-Path: <SRS0=bR7J=TU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hamsrv800.servertools24.de ([213.238.32.28]:42125 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbfETUWx (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 May 2019 16:22:53 -0400
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
References: <20190513193307.11591-1-oss@c-mauderer.de>
 <20190519212501.GC31403@amd>
 <1850ba07-2c0c-2624-4ff3-fd507e49439f@c-mauderer.de>
 <99283573-2711-08b6-b95e-27732c175bb4@gmail.com>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <b2315969-eef3-ad08-7551-c25a54049b28@c-mauderer.de>
Date: Mon, 20 May 2019 22:22:50 +0200
MIME-Version: 1.0
In-Reply-To: <99283573-2711-08b6-b95e-27732c175bb4@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Jacek, Pavel, Rob, Dan and everyone who I might have missed,

thanks for the great feedback, the patience while reviewing my patches
and for accepting it.

Although it needed a longer discussion than I expected (partially due to
my rush creating new versions at the beginning) it was a quite positive
experience and I'm quite ready to repeat it if some other opportunity
arises.

Best regards

Christian

On 20/05/2019 22:15, Jacek Anaszewski wrote:
> Hi Christian,
> 
> On 5/20/19 7:19 PM, Christian Mauderer wrote:
>> On 19/05/2019 23:25, Pavel Machek wrote:
>>> Hi!
>>>
>>>> From: Christian Mauderer <oss@c-mauderer.de>
>>>>
>>>> This patch adds the binding documentation for a simple SPI based LED
>>>> controller which use only one byte for setting the brightness.
>>>>
>>>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>>>> ---
>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>>> b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>>> new file mode 100644
>>>> index 000000000000..28b6b2d9091e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>>> @@ -0,0 +1,44 @@
>>>> +* Single Byte SPI LED Device Driver.
>>>
>>>> +The driver can be used for controllers with a very simple SPI
>>>> protocol:
>>>> +- one LED is controlled by a single byte on MOSI
>>>> +- the value of the byte gives the brightness between two values
>>>> (lowest to
>>>> +� highest)
>>>> +- no return value is necessary (no MISO signal)
>>>
>>> I'd expect this file to be named acb-spi-led.txt, or something, and
>>> talk about that u-controller, not its device driver -- as devicetree
>>> binding describes hardware, not driver.
>>>
>>> But you already have an ack from rob, so...
>>> ����������������������������������� Pavel
>>> �����������������������������������
>>
>> So basically it would have been better to move the description that I
>> added to the c-file as "supported devices" in the device tree file?
>>
>> With both commits already acked: Rob and Pavel: Should I change that?
>>
>> If you both say yes, I would rename the file in the binding like
>> suggested and move the detailed protocol description from the driver to
>> the binding.
> 
> Let's not ramble on it. It is good as is.
> 
> Patch set applied to the for-next branch of linux-leds.git.
> 
> Thank you for your work.
> 
