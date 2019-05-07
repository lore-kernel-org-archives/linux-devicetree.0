Return-Path: <SRS0=7lMX=TH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hamsrv800.servertools24.de ([213.238.32.28]:40057 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726607AbfEGJwd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 May 2019 05:52:33 -0400
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <20190506162848.GA9522@amd>
 <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
 <54199d69-67a9-eb9d-e46d-b3ea43e2e7a3@c-mauderer.de>
 <20190506202511.GA4979@amd>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <faba9d62-c650-5be8-a9c2-645be10dab6d@c-mauderer.de>
Date: Tue, 7 May 2019 11:52:28 +0200
MIME-Version: 1.0
In-Reply-To: <20190506202511.GA4979@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 06/05/2019 22:25, Pavel Machek wrote:
> Hi!
> 
>>>> Ok, I'm afraid I caused this. What should the compatible be, then?
>>>
>>> Knowing nothing about the h/w other than the above description:
>>> ubiquiti,aircube-leds
>>>
>>> Not sure if that's a registered or correct vendor prefix though.
>>>
>>> Rob
>>>
>>
>> Where would such a vendor prefix be registered? Does that mean that only
>> the vendor is allowed to use it? In that case: How would a reverse
>> engineered prefix look like?
> 
> You can use it, too. It is in
> Documentation/devicetree/bindings/vendor-prefixes.txt :
> 
> ubnt    Ubiquiti Networks
> 
> So you can probably use ubnt, prefix.
> 
>> (still with some missing parts like U-Boot) about two weeks later. I had
>> a look at it and they are not using a device tree. So there is no
>> "official" string that I could deduce from that archive.
> 
> Mainline is the master. You are more "official" than them ;-).
> 									Pavel
> 

Hello

let me summarize the direction before I create a v4:

Rob Herring suggested "ubnt,acb-spi-led" for the binding name in his
Mail from 06.05.2019 17:59 UTC. If no one objects, I'll use that.

With the more specific name I'll remove the off-value and max-value from
the device tree. Instead I'll create some look up table in the driver.
based on the name or go back to the defines like in the v1 patch. What
kind of solution would be preferable depends on the next question:

How should I name the driver? Should I use a device specific name like
in v1 again (most likely now acb-spi-led)? That would allow to
potentially add a hardware supported blinking in that driver. The
alternative would be the more generic name that it has now
(leds-spi-byte) without any plans to add the blinking but it could be
potentially used for example for a digital potentiometer based
brightness setting.

Note that I didn't really had planned to implement the blinking support
because I don't have a use case for it. So it would be either a feature
that I would add because someone insists. Or it could be added in the
future by a user who wants that feature (maybe Ubiquiti when they
upgrade their kernel?).

If it is a required feature for that driver: Please note that although
of course I would do some basic tests during development it would be a
mostly unused and therefore untested feature.

Best regards

Christian
