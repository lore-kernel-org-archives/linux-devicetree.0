From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 1/2 v2] hwmon: (ltc4151) Make shunt-resistor configurable
Date: Sat, 30 Jul 2016 09:26:48 -0700
Message-ID: <579CD548.9060105@roeck-us.net>
References: <5795A144.2020300@roeck-us.net>
 <20160725115558.GA18360@makrotopia.org> <579CCF0E.9050506@roeck-us.net>
 <20160730161133.GA17568@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160730161133.GA17568-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Per_Dal=c3=a9n?= <per.dalen-US8m9dViuwNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/30/2016 09:11 AM, Daniel Golle wrote:
> Hi Guenter,
>
> On Sat, Jul 30, 2016 at 09:00:14AM -0700, Guenter Roeck wrote:
>> Daniel,
>>
>> On 07/25/2016 04:56 AM, Daniel Golle wrote:
>>> Allow to specify the resistance of the attached shunt via DT by
>>> adding the shunt-resistor property. Fall-back to the previous
>>> default (1 mOhm) if unset.
>>>
>>> Signed-off-by: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
>>
>> Please resend with the property name changed as asked for by Rob.
>
> Ok, will do. I originally copy-pasted the property name from ina209,
> so I reckon it's supposed to be changed there as well...?
>

One can not simply change an existing property. We would have to deprecate
the old one, define a replacement, and have the driver support both. For
ina2xx, it would have to be done in the iio driver as well.

Sure, if you feel up to it, feel free to prepare a set of patches to do that.

Note that Documentation/devicetree/bindings/property-units.txt documents
that -micro-ohms should be used.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
