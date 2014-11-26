From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: Question about fixed regulator DT properties
Date: Wed, 26 Nov 2014 19:27:06 +0200
Message-ID: <54760D6A.9080306@mentor.com>
References: <546B5EF9.3080102@mentor.com> <546CAB49.8030103@mentor.com> <20141125121749.GV7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141125121749.GV7712-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Mark,

On 25.11.2014 14:17, Mark Brown wrote:
> On Wed, Nov 19, 2014 at 04:38:01PM +0200, Vladimir Zapolskiy wrote:
>> Hello Mark,
>>
>> On 18.11.2014 17:00, Vladimir Zapolskiy wrote:
> 
> Your mail is really quite long and all in quotes which makes it hard to
> follow, brevity is really helpful to readers.

my sole purpose was to describe the problems I encounter in details,
sorry for excessive verbosity.

Just to summarize my findings:
a) "enable-active-high" property has no effect on GPIO output,
b) "regulator-boot-on" does not mean that the regulator is controlled by
bootloader or firmware exclusively.

>>> | regulator-boot-on | enable-active-high | GPIO polarity | GPIO output |
>>> +-------------------+--------------------+---------------+-------------+
>>> |        no         |         yes        |  active high  |    low      |
>>> |        no         |          no        |  active low   |   high      |
> 
>>> I'd rather think that both resulting GPIO outputs are incorrect or
>>> better to say do not correspond to my perception of "regulator-boot-on"
>>> and "enable-active-high" DTS properties described in the documentation,
>>> however above "enable-active-high" and actual GPIO polarity are the same
>>> (when they are not, it is another open topic for discussion).
> 
> What you're saying seems sensible.

Good, I read it as a confirmation that the problem exists.

>>> Should documentation be updated to reflect "regulator-boot-on" role that
>>> a regulator is re-enabled by the kernel?
> 
> I'm confused about this.  That's the sole purpose of the flag and as far
> as I can tell it's what the documentation says.

Documentation/devicetree/bindings/regulator/regulator.txt says:

  - regulator-boot-on: bootloader/firmware enabled regulator

I would suggest to add Linux kernel to that list of regulator
controllers, if it is the intention. In its current state the
documentation makes an impression that "regulator-boot-on" property
instructs the kernel to ignore regulator setup, since it is already
controlled by bootloader or firmware.

>>> Should "enable-active-high" be replaced by getting GPIO flags directly?
> 
> Probably makes sense, it predates those flags by quite some time.
> 

If you have no objection I'll take a look how to fix it by removing
"enable-active-high" flag completely from the driver's logic,
fortunately the flag has no tangible effect at the moment as it is shown
by my analysis.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
