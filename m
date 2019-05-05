Return-Path: <SRS0=opvc=TF=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com> <20190504203448.GA24856@amd>
 <20190504221719.GA7237@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
Date: Sun, 5 May 2019 12:56:35 +0200
MIME-Version: 1.0
In-Reply-To: <20190504221719.GA7237@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Christian Mauderer <list@c-mauderer.de>, oss@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 5/5/19 12:17 AM, Pavel Machek wrote:
> Hi!
> 
>>>> I wasn't aware of that list. Maybe "power" or even better "status" would
>>>> match the function.
>>>
>>> Hmm, I've just found out that there are two "wlan-ap" occurrences in
>>> the existing mainline bindings, so I propose to follow that.
> 
> Let me see... dove-d3plug.dts has "status", "wlan-ap", "wlan-act".
> 
>>>> Should I add the color too? So "white:status"?
>>>
>>> Yes, why not if it is known. So, having the above I propose:
>>>
>>> 		label = "white:wlan-ap";
>>
>> Linux now runs on many different devices, and I believe userland wants
>> to know "this is main notification LED for this device" (and the only
>> one in this case).

This LED is on the access point, so it should have this affiliation
somehow represented in the name.

> ...and I guess if you have single LED it will be used for more than
> "is AP active". IOW it will likely to be more similar to "status" than
> "wlan-ap".

IMO if a LED is on some specific device, then it should be reflected
in the "function" section of the LED name. It facilitates locating in
physically. If usersapce wants to change its purpose it is free to do
so. e.g. via triggers. But it will not affect the LED name.

-- 
Best regards,
Jacek Anaszewski
