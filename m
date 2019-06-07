Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47618 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbfFGV0q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Jun 2019 17:26:46 -0400
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <361ecc6a-b0b6-1bc9-a52b-e3531340deeb@ti.com>
Date: Fri, 7 Jun 2019 16:26:41 -0500
MIME-Version: 1.0
In-Reply-To: <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Oleh

On 6/7/19 4:17 PM, Oleh Kravchenko wrote:
> Dan,
>
> On 08.06.19 00:04, Dan Murphy wrote:
>> Oleh
>> But this is not really max_brightness now this is a feature and now
>> does not make sense in this context
>>>> You may need to use something different for this property or expose
>>>> a file in the driver.
>>>>
>>>>
>>> Protocol for this board define 0x32 as brightness level.
>>> This behaviur needed to keep backward compatibity.
>>>
>>>
>> Backwards compatibility to what?
> With old/new boards.

This does not make sense.

How would a device tree entry or a file that controls the blinking have 
to deal with the hardware?

If it allows feature setting then you should create a bool in the device 
tree.

el15203000-blink;

If the board supports the feature you set this and create a file to 
dis/enable the feature.

If the board does not support it then no file is created.

max_brightness for this device appears to be 1.

Dan


>> This is a new driver there should be no DT that has this compatible or
>> definition.
>>
>> I will let Rob ack or nack this node.
>>
>> Dan
>>
>
