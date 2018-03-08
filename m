Return-Path: <SRS0=Ax0d=F6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-dm3nam03on0085.outbound.protection.outlook.com ([104.47.41.85]:3444
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S935242AbeCHGr4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 8 Mar 2018 01:47:56 -0500
Subject: Re: [PATCH] arm: dts: zynq: Add support for Z-turn board
References: <20180306213008.32448-1-tossel@gmail.com>
 <d61e039f-36c9-5da9-1471-d1bf83e0e578@xilinx.com>
 <9f4e1cb8-1416-58df-398c-d1d3f29c006e@gmail.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <48fbed9d-9cd0-0419-c14c-64ad1a66c23b@xilinx.com>
Date: Thu, 8 Mar 2018 07:47:42 +0100
MIME-Version: 1.0
In-Reply-To: <9f4e1cb8-1416-58df-398c-d1d3f29c006e@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Anton Gerasimov <tossel@gmail.com>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

On 7.3.2018 20:50, Anton Gerasimov wrote:
> Hi Michal,
> 
> thank you for the detailed review. I'm fixing most of the issues, I've
> just got one note and one question.
> 
>> Do you really wants to have 3 leds doing heartbeat?
> 
> Actually it is one RGB package. But it's controlled through programmable
> logic, so I'll just remove it, my bad.
> 
>>> +        };
>>> +
>>> +        usr_led1 {
>>> +            label = "usr_led1";
>>> +            gpios = <&gpio0 0x0 0x1>;
>>> +            default-state = "off";
>>> +            linux,default-trigger = "none";
>> This is not the part of binding and I think it is useless anyway.
>>
>>> +        };
>>> +
>>> +        usr_led2 {
>>> +            label = "usr_led2";
>>> +            gpios = <&gpio0 0x9 0x1>;
>>> +            default-state = "off";
>>> +            linux,default-trigger = "none";
>> ditto
> 
> These two are on the contrary real LEDs that are controlled by hardware
> GPIO. You mean they don't belong here because user can control them with
> GPIO interface?

I really meant that linux,default-trigger = "none" shouldn't be there.
user led description is fine.
Also I just spot that you should use dashes instead of underscores in
node name. It means usr-led2 here.

Thanks,
Michal

