From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-tacho
 cooling device.
Date: Wed, 9 Aug 2017 06:30:51 -0700
Message-ID: <a1b34c1d-b00e-7a8f-7950-c2007d6b5eb7@roeck-us.net>
References: <20170803084650.22298-1-c_mykolak@mellanox.com>
 <3c427ddd-aab6-13d4-bfb2-ae22848c0d13@roeck-us.net>
 <DB5PR05MB122451EAD6E4A470ED2FCFBEEF8B0@DB5PR05MB1224.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB5PR05MB122451EAD6E4A470ED2FCFBEEF8B0-8IvNv+8VlcDncoQxOOXcUNqRiQSDpxhJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ohad Oz <ohado-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/09/2017 12:15 AM, Mykola Kostenok wrote:
>> -----Original Message-----
>> From: Guenter Roeck [mailto:linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org]
>> Sent: Wednesday, August 9, 2017 7:09 AM
>> To: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>; Rob Herring
>> <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>;
>> openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>; Vadim
>> Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>; Ohad Oz <ohado-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
>> Subject: Re: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-
>> tacho cooling device.
>>
>> On 08/03/2017 01:46 AM, Mykola Kostenok wrote:
>>> It's add support for cooling device creation to aspeed-pwm-tacho.
>>> Cooling device could be bound to a thermal zone for the thermal
>>> control.
>>>
>>> v1 -> v2:
>>>    - Fix commit message.
>>> v2 -> v3:
>>>    Pointed out by Rob Herring:
>>>    - Put cooling-levels under fan subnodes.
>>>
>>> Signed-off-by: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
>>
>> Did Rob ever Ack this patch ?
>>
>> Note you didn't copy the hwmon mailing list, which doesn't exactly help to
>> keep track of it, and I may have lost Rob's Ack. My apologies if that is the
>> case.
>>
>> Guenter
> 
> Hi, Guenter.
> 
> No, Rob Herring did not ack patch yet. Just comment.
> 
> Yes, since I split initial patch to 2 patches, I have sent one to you and hwmon mail list,
> and another to Rob and devicetree mail list. And added you both to cc.
> Am I need to add both mail lists to both patches in such cases?
> 

Normally the dt patch would still be pushed through the same subsystem as the driver,
so, yes, it would be useful to have hwmon copied. Otherwise it won't be in the hwmon
patchwork and can easily get lost.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
