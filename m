Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35354 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731132AbfFGVEm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Jun 2019 17:04:42 -0400
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
Date: Fri, 7 Jun 2019 16:04:38 -0500
MIME-Version: 1.0
In-Reply-To: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Oleh

On 6/7/19 3:53 PM, Oleh Kravchenko wrote:
>
> 07.06.19 23:14, Dan Murphy пише:
>> Oleh
>>
>> On 6/7/19 1:40 PM, Oleh Kravchenko wrote:
>>> +LED sub-node properties:
>>> +- label :
>>> +    see Documentation/devicetree/bindings/leds/common.txt
>> Add this
>>
>> Optional LED sub-node properties:
>>
>> And remove (optional) from the below.
>>
> Done
>
>>> +- linux,default-trigger : (optional)
>>> +    see Documentation/devicetree/bindings/leds/common.txt
>>> +- max-brightness : (optional)
>>> +    Specify here 2 if LED has special effect. Effects by LED type:
>> s/Specify here 2/Specify 2
>>
> Done
>
>> But this is not really max_brightness now this is a feature and now does not make sense in this context
>>
>> You may need to use something different for this property or expose a file in the driver.
>>
>>
> Protocol for this board define 0x32 as brightness level.
> This behaviur needed to keep backward compatibity.
>
>
Backwards compatibility to what?

This is a new driver there should be no DT that has this compatible or 
definition.

I will let Rob ack or nack this node.

Dan
