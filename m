Return-Path: <SRS0=0gim=F7=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: document Panasonic AN30259A
 bindings
References: <20180307004722.23524-1-simon@lineageos.org>
 <20180307004722.23524-2-simon@lineageos.org>
 <973256fd-8394-1b41-9ca1-846442515f62@gmail.com> <20180308225412.GA11646@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0dee75f3-b672-148b-fcea-0926eb0ebaee@gmail.com>
Date: Fri, 9 Mar 2018 23:33:24 +0100
MIME-Version: 1.0
In-Reply-To: <20180308225412.GA11646@amd>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Simon Shields <simon@lineageos.org>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 03/08/2018 11:54 PM, Pavel Machek wrote:
> Hi!
> 
>>> +	led@1 {
>>> +		reg = <1>;
>>> +		linux,default-trigger = "heartbeat";
>>> +		label = "an30259a:red:notification";
>>
>> s/an30259a:red:notification/red:notification/
>>
>> Let's drop devicename section from label, and make it a LED class
>> driver responsibility to prepend the label with devicename when
>> composing LED class device name.
> 
> Is it good idea?
> 
> (Some existing bindings specify three-part label in the label, some do
> not. Documentation/devicetree/bindings/leds/leds-netxbig.txt
> vs. Documentation/devicetree/bindings/leds/leds-mt6323.txt :-( We
> should really solve that somehow).

It looks that we didn't pay enough attention to the label DT property
format, as long as the resulting LED class device name conformed
to the three-part LED naming scheme.

We certainly need to fix that, by defining the label format explicitly
in the common LED bindings. However we have two related issues, that
have been raised several times throughout last months:

1. label format

Rob's statement from [0]:

"I really dislike how this naming convention is used for label. label is
 supposed to be the physically identifiable name. Having the devicename
defeats that. We'd be better off with a color property.
It seems we're overloading the naming with too many things. Now we're
adding device association"

2. LED class device naming

Rob's statement from [0]:

"I do want to see standard names though. On 96boards for example, there
are defined LEDs and locations. The function on some are defined (e.g.
WiFi/BT) and somewhat undefined on others (user{1-4}). I'd like to see
the same label across all boards."


Now, we have to decide if label should map directly to LED class device.
I requested removing devicename from label to satisfy 1., provided
that there was no conclusion from the thread [0]. Also some LED class
drivers already follow this scheme.

Of course I meant it to be only a temporary solution until we unify
the LED class device naming across all drivers and bindings.

Driving LED controller name can be looked up in sysfs so it doesn't
need to be a part of the LED class device name.

> I'd really like to see input0:white:numlock in the name, so same
> software has a chance to work on PC and ARM notebook. Prepending
> an30259a in the driver will break that...

You have input0 in your example. It does not say too much
about the device the LED is associated with. I assume that this
is not a device node name, since in Device Tree you don't know the
associations between DT nodes and device node numbers.

[0] https://patchwork.kernel.org/patch/9956315/

-- 
Best regards,
Jacek Anaszewski
