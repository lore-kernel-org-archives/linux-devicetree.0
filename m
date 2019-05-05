Return-Path: <SRS0=r3/y=TF=c-mauderer.de=oss@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com> <20190504203448.GA24856@amd>
 <20190504221719.GA7237@amd>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <cda5d92c-6738-ed7a-a480-de04ebd2d466@c-mauderer.de>
Date: Sun, 5 May 2019 10:01:47 +0200
MIME-Version: 1.0
In-Reply-To: <20190504221719.GA7237@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Christian Mauderer <list@c-mauderer.de>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 05/05/2019 00:17, Pavel Machek wrote:
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
> 
> ...and I guess if you have single LED it will be used for more than
> "is AP active". IOW it will likely to be more similar to "status" than
> "wlan-ap".
> 
> Best regards,
> 									Pavel
> 

As far as I understand it the dt-bindings is an example anyway, right?
So it's not really relevant what the LED does in my specific system.
Jacek said

> In label we expect "color:function" pattern.

Therefore I think that a "white:status" would be a good example label
and I'll use that.

I'll prepare a patch set v2 and (hopefully) send it in the next hours
after I've tested in on my hardware.

Best regards

Christian
