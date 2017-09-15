From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv4 3/5] dt-bindings: document the CEC GPIO bindings
Date: Fri, 15 Sep 2017 13:14:21 -0500
Message-ID: <CAL_JsqKZcXMFPrU548LoeS6qnjHKv_5P-8U_VyUPqt=_1LygUw@mail.gmail.com>
References: <20170831110156.11018-1-hverkuil@xs4all.nl> <20170831110156.11018-4-hverkuil@xs4all.nl>
 <20170912144308.j53eclicbhay5dsz@rob-hp-laptop> <30a2fa9d-1aa9-84c1-7842-05167eee73d3@xs4all.nl>
 <89739d22-bce2-e31e-fd00-5e7c2fae2148@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <89739d22-bce2-e31e-fd00-5e7c2fae2148-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 3:40 AM, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> wrote:
> Hi Rob,
>
> On 09/13/17 10:21, Hans Verkuil wrote:
>> On 09/12/2017 04:43 PM, Rob Herring wrote:
>>> On Thu, Aug 31, 2017 at 01:01:54PM +0200, Hans Verkuil wrote:
>>>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>>
>>>> Document the bindings for the cec-gpio module for hardware where the
>>>> CEC line and optionally the HPD line are connected to GPIO lines.
>>>>
>>>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/media/cec-gpio.txt         | 22 ++++++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/cec-gpio.txt b/Documentation/devicetree/bindings/media/cec-gpio.txt
>>>> new file mode 100644
>>>> index 000000000000..db20a7452dbd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/cec-gpio.txt
>>>> @@ -0,0 +1,22 @@
>>>> +* HDMI CEC GPIO driver
>>>> +
>>>> +The HDMI CEC GPIO module supports CEC implementations where the CEC line
>>>> +is hooked up to a pull-up GPIO line and - optionally - the HPD line is
>>>> +hooked up to another GPIO line.
>>>> +
>>>> +Required properties:
>>>> +  - compatible: value must be "cec-gpio"
>>>> +  - cec-gpio: gpio that the CEC line is connected to
>>>
>>> cec-gpios
>>
>> Will change.
>>
>>>
>>>> +
>>>> +Optional property:
>>>> +  - hpd-gpio: gpio that the HPD line is connected to
>>>
>>> hpd-gpios
>>
>> Will change.
>>
>>>
>>> However, HPD is already part of the HDMI connector binding. Having it in
>>> 2 places would be wrong.
>>
>> No. This is not an HDMI receiver/transmitter. There are two use-cases for this
>> driver:
>>
>> 1) For HDMI receivers/transmitters that connect the CEC pin of an HDMI connector
>>    to a GPIO pin. In that case the HPD goes to the HDMI transmitter/receiver and
>>    not to this driver. As you say, that would not make any sense.
>>
>>    But currently no such devices are in the kernel (I know they exist, though).
>>    Once such a driver would appear in the kernel then these bindings need to be
>>    extended with an hdmi-phandle.
>>
>> 2) This driver is used for debugging CEC like this:
>>
>>       https://hverkuil.home.xs4all.nl/rpi3-cec.jpg
>>
>>    Here the CEC pin of an HDMI breakout connector is hooked up to a Raspberry Pi
>>    GPIO pin and the RPi monitors it. It's a cheap but very effective CEC analyzer.
>>    In this use-case it is very helpful to also monitor the HPD pin since some
>>    displays do weird things with the HPD and knowing the state of the HPD helps
>>    a lot when debugging CEC problems. It's optional and it only monitors the pin.
>>
>>    Actually, there does not have to be an HDMI connector involved at all: you can
>>    make two cec-gpio instances and just connect the two GPIO pins together in
>>    order to emulate two CEC adapters and play with that.
>
> Is it OK to define a binding but not (yet) implement it? I have seen that in other
> bindings (well, OK, one other binding :-) ). If that is fine, then I can write the
> following:

It's preferred over adding a property one by one.

>
> ----------------------------------------------------------------
> Required properties:
>   - compatible: value must be "cec-gpio".
>   - cec-gpios: gpio that the CEC line is connected to.
>
> If the CEC line is associated with an HDMI receiver/transmitter, then the following
> property is also required:
>
>   - hdmi-phandle - phandle to the HDMI controller, see also cec.txt.
>
> If the CEC line is not associated with an HDMI receiver/transmitter, then the
> following property is optional:
>
>   - hpd-gpios: gpio that the HPD line is connected to.
> ----------------------------------------------------------------

Yes, this seems fine.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
