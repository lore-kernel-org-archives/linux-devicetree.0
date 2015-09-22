From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Please suggest proper format for DT properties.
Date: Mon, 21 Sep 2015 19:32:10 -0500
Message-ID: <CAL_JsqLRUzDjJxOqVBUigfzfSapPDT7YCKC7T4QdF_99sSVcEw@mail.gmail.com>
References: <1442615803-17766-1-git-send-email-const@MakeLinux.com>
 <CAL_JsqLtyM9v1nCE_ZqcBTmnmLU2AjqBKCG5FhLSmkcXZYjV0w@mail.gmail.com> <CAE7jHC-8NeHKo8x5oCPQTPTzoWmpyXxa3G2+PxJgSBxEct5ocA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE7jHC-8NeHKo8x5oCPQTPTzoWmpyXxa3G2+PxJgSBxEct5ocA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Constantine Shulyupin <const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org>
Cc: open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 21, 2015 at 2:24 PM, Constantine Shulyupin
<const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org> wrote:
> On Mon, Sep 21, 2015 at 4:51 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Sep 18, 2015 at 5:36 PM, Constantine Shulyupin
>> <const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org> wrote:
>>> Hi,
>>>
>>> I am designing DT support for a hwmon chip.
>>> It has some sensors, each of them can be:
>>>  - "disabled"
>>>  - "thermal diode"
>>>  - "thermistor"
>>>  - "voltage"
>>>
>>> Four possible options for DT properties format.
>>>
>>> Option 1: Separated property for each sensor.
>>>
>>> Example nct7802 node:
>>>
>>> nct7802 {
>>>         compatible = "nuvoton,nct7802";
>>>         reg = <0x2a>;
>>>         nuvoton,sensor1-type = "thermistor";
>>>         nuvoton,sensor2-type = "disabled";
>>>         nuvoton,sensor3-type = "voltage";
>>> };
>>>
>>> Option 2: Array of strings for all sensors.
>>>
>>> nct7802 {
>>>         compatible = "nuvoton,nct7802";
>>>         reg = <0x2a>;
>>>         nuvoton,sensors-types = "thermistor", "disabled", "voltage";
>>> };
>>
>> It seems you are just listing out all possible modes. Why do you need
>> this in the DT at all? This can be inferred by the compatible string.
>
> There are tree sensor, each of one can be one of three type ("thermal
> diode", "thermistor", "voltage") or be disabled.
> Also there are at least five platform depended registers, most of them
> are enable/disable.
> You can find full datasheet here
> https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/
>
> The question is how to describe configuration of this registers in dts.
> The second option is array of types for tree registers.

Okay, got it. I would go with option 2 in that case. Perhaps "mode"
instead of "type" though.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
