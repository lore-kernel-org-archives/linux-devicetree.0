From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/2] [media] atmel-isc: DT binding for Image Sensor
 Controller driver
Date: Sun, 31 Jul 2016 20:57:20 -0500
Message-ID: <CAL_JsqLH9wHMuLJ5Q-rCecM3i2OUgWJ8A3U-z8UZORN-PQOvBA@mail.gmail.com>
References: <1469778856-24253-1-git-send-email-songjun.wu@microchip.com>
 <1469778856-24253-3-git-send-email-songjun.wu@microchip.com>
 <20160729214454.GA21408@rob-hp-laptop> <5a2cea98-dd8a-159b-7adb-a2533cfde1b0@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a2cea98-dd8a-159b-7adb-a2533cfde1b0-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Wu, Songjun" <Songjun.Wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 31, 2016 at 8:23 PM, Wu, Songjun <Songjun.Wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org> wrote:
>
>
> On 7/30/2016 05:44, Rob Herring wrote:
>>
>> On Fri, Jul 29, 2016 at 03:54:08PM +0800, Songjun Wu wrote:
>>>
>>> DT binding documentation for ISC driver.
>>>
>>> Signed-off-by: Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>> ---
>>>
>>> Changes in v7: None
>>> Changes in v6:
>>> - Add "iscck" and "gck" to clock-names.
>>>
>>> Changes in v5:
>>> - Add clock-output-names.
>>>
>>> Changes in v4:
>>> - Remove the isc clock nodes.
>>>
>>> Changes in v3:
>>> - Remove the 'atmel,sensor-preferred'.
>>> - Modify the isc clock node according to the Rob's remarks.
>>>
>>> Changes in v2:
>>> - Remove the unit address of the endpoint.
>>> - Add the unit address to the clock node.
>>> - Avoid using underscores in node names.
>>> - Drop the "0x" in the unit address of the i2c node.
>>> - Modify the description of 'atmel,sensor-preferred'.
>>> - Add the description for the ISC internal clock.
>>>
>>>  .../devicetree/bindings/media/atmel-isc.txt        | 65
>>> ++++++++++++++++++++++
>>>  1 file changed, 65 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
>>
>>
>> Please add acks when posting new versions.
>>
>> Rob
>>
> Hi Rob,
>
> Thank you for your reminder.
>
> Should I Add 'Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>' behind
> 'Signed-off-by: Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>'?

Before or after is fine.

> Should I resend this patch?

Not just to add acks, but if you send v8, add the acks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
