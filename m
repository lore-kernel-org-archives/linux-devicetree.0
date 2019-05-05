Return-Path: <SRS0=r3/y=TF=c-mauderer.de=oss@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com> <20190504203448.GA24856@amd>
 <20190504221719.GA7237@amd> <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <e58c6bbb-9003-be45-19dc-0b1851770f54@c-mauderer.de>
Date: Sun, 5 May 2019 13:51:42 +0200
MIME-Version: 1.0
In-Reply-To: <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Christian Mauderer <list@c-mauderer.de>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 05/05/2019 12:56, Jacek Anaszewski wrote:
> Hi,
> 
> On 5/5/19 12:17 AM, Pavel Machek wrote:
>> Hi!
>>
>>>>> I wasn't aware of that list. Maybe "power" or even better "status"
>>>>> would
>>>>> match the function.
>>>>
>>>> Hmm, I've just found out that there are two "wlan-ap" occurrences in
>>>> the existing mainline bindings, so I propose to follow that.
>>
>> Let me see... dove-d3plug.dts has "status", "wlan-ap", "wlan-act".
>>
>>>>> Should I add the color too? So "white:status"?
>>>>
>>>> Yes, why not if it is known. So, having the above I propose:
>>>>
>>>> ������� label = "white:wlan-ap";
>>>
>>> Linux now runs on many different devices, and I believe userland wants
>>> to know "this is main notification LED for this device" (and the only
>>> one in this case).
> 
> This LED is on the access point, so it should have this affiliation
> somehow represented in the name.
> 
>> ...and I guess if you have single LED it will be used for more than
>> "is AP active". IOW it will likely to be more similar to "status" than
>> "wlan-ap".
> 
> IMO if a LED is on some specific device, then it should be reflected
> in the "function" section of the LED name. It facilitates locating in
> physically. If usersapce wants to change its purpose it is free to do
> so. e.g. via triggers. But it will not affect the LED name.
> 

This looks like a strongly opinion based discussion. Currently it's only
relevant for the name in the examble in the dt-binding document. Isn't
it completely irrelevant what I use there? The controller could be used
on any device, couldn't it?

Regarding your argument toward naming (maybe relevant when I add it to
the device tree files in OpenWRT): Would that mean that if a
hypothetical server has one LED to show some arbitrary system states it
should be named "green:server" instead of "green:status" because it is
on a specific device (server in that case)?

I would expect a LED called "wlan-ap" to show the status of the WLAN.
Like many small WLAN access points, the airCube has multiple ports. So
it could be used as a generic router with WLAN switched off too. In that
case "wlan-ap" wouldn't really fit the function of the LED.

Like I said: Ubiquiti uses the LED in the original software to show some
system events like "I'm finished booting" (steady brightness) or "I'm
currently upgrading" (blinking pattern).

Best regards

Christian
