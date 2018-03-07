Return-Path: <SRS0=sWlL=F5=gmail.com=tossel@kernel.org>
Subject: Re: [PATCH] arm: dts: zynq: Add support for Z-turn board
References: <20180306213008.32448-1-tossel@gmail.com>
 <d61e039f-36c9-5da9-1471-d1bf83e0e578@xilinx.com>
From: Anton Gerasimov <tossel@gmail.com>
Message-ID: <9f4e1cb8-1416-58df-398c-d1d3f29c006e@gmail.com>
Date: Wed, 7 Mar 2018 20:50:52 +0100
MIME-Version: 1.0
In-Reply-To: <d61e039f-36c9-5da9-1471-d1bf83e0e578@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Hi Michal,

thank you for the detailed review. I'm fixing most of the issues, I've 
just got one note and one question.

> Do you really wants to have 3 leds doing heartbeat?

Actually it is one RGB package. But it's controlled through programmable 
logic, so I'll just remove it, my bad.

>> +		};
>> +
>> +		usr_led1 {
>> +			label = "usr_led1";
>> +			gpios = <&gpio0 0x0 0x1>;
>> +			default-state = "off";
>> +			linux,default-trigger = "none";
> This is not the part of binding and I think it is useless anyway.
>
>> +		};
>> +
>> +		usr_led2 {
>> +			label = "usr_led2";
>> +			gpios = <&gpio0 0x9 0x1>;
>> +			default-state = "off";
>> +			linux,default-trigger = "none";
> ditto

These two are on the contrary real LEDs that are controlled by hardware 
GPIO. You mean they don't belong here because user can control them with 
GPIO interface?

Thanks,
Anton
