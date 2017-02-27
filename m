From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller Driver
Date: Mon, 27 Feb 2017 16:27:52 -0600
Message-ID: <CAL_JsqLEtPc+WHg3kAJ_vauX1na6HAb73i1gm+X2T+gsrzgy6g@mail.gmail.com>
References: <1486714767-25930-1-git-send-email-richard.leitner@skidata.com>
 <20170216023004.25dwzy7ppxdoasfz@rob-hp-laptop> <31fd459f-aed3-9d4a-2a63-651131216542@g0hl1n.net>
 <CAL_JsqJ=ViO+QnTiZXSL7zyO7xu_+f7C4aSkfA7VmqiU92EeHg@mail.gmail.com>
 <a44c2244-bdb3-ebc3-cfd2-271d3dabe011@skidata.com> <1488188908.2612.18.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488188908.2612.18.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 27, 2017 at 3:48 AM, Jan Lübbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Di, 2017-02-21 at 15:57 +0100, Richard Leitner wrote:
>> >>> This is a lot of properties. Are you really finding a need for all of
>> >>> them? Is this to handle h/w designers too cheap to put down the EEPROM?
>> >>> Maybe better to just define an eeprom property in the format the h/w
>> >>> expects.
>> >>
>> >>
>> >> I need about 15 of these properties. I just exposed them all to dt because I
>> >> thought they could be useful for somebody.
>> >>
>> >> Yes, these are a subset of the settings which can be configured via an
>> >> external EEPROM (By strapping some pins of the hub you can select if it
>> >> loads its configuration from an EEPROM or receives it via SMBus).
>> >>
>> >> My first thought was also to define only a byte array in dt, but IMHO these
>> >> options are much more readable and convenient for everybody. I'd also be
>> >> fine with removing the properties I don't need from dt. But that may lead to
>> >> future patches where somebody needs some of the options not already exposed
>> >> to dt.
>> >
>> > Okay. It's really a judgement call. If this is most of the settings,
>> > then it's fine. If it was only a fraction of them, then maybe we'd
>> > want to do just a byte array. Sounds like it is the former.
>>
>> In fact there are 6 more parameters available according to the
>> datasheet. So how should I proceed here? Remove the one's I'm not using
>> at the moment, leave them as they are or add the missing 6 too?
>
> Rob, several of these properties look more like configuration rather
> than HW description ('skip-config', '*-id', 'manufacturer', 'product',
> 'serial'). Is DT the right place for this? I would expect userspace to
> provide the configuration.

Configuration can be okay. The test I use is more who needs to
set/control these properties? Would an end-user want to control them?
If so, then they should be sysfs controls. If they are configuration
for a particular design, then DT is fine. Given these are all
typically EEPROM properties, then they aren't really end-user controls
and belong in DT.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
