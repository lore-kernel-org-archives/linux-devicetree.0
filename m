From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC] improve binding for linux,wdt-gpio
Date: Wed, 29 Jul 2015 08:49:23 -0700
Message-ID: <55B8F603.4000003@roeck-us.net>
References: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de> <20150728212155.GA18137@roeck-us.net> <20150729073513.GB15360@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150729073513.GB15360-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Uwe,

On 07/29/2015 12:35 AM, Uwe Kleine-K=F6nig wrote:
> Hello Guenter,
>
[ ... ]
>>
>> always-running is meant to indicate that the watchdog can not be sto=
pped
>> (meaning a timer has to be used to send keepalives while the watchdo=
g
>> device is closed). The documentation specifically states that.
>>
>> 	"If the watchdog timer cannot be disabled ..."
>>
>> How would you express that condition without always-running or a sim=
ilar
>> attribute ?  I am also not sure how that relates to hw_algo; I thoug=
ht
>> those properties are orthogonal.
> For hw_algo =3D "level" the inactive level of the gpio disables the
> watchdog (and resets the counter). So always-running doesn't make sen=
se
> for this type.
>
That is not what is currently implemented. "level" just means that
the watchdog is pinged using a -high-low-high- or -low-high-low-
sequence, while toggle means that the level is changed with each
ping (-low-(wait)-high-(wait)-low-(wait)-high-...).

>> Of course, 'always-running' _may_ describe driver behavior, but that=
 doesn't
> Well in the current state of the binding document we have:
>
> 	add this flag to have the driver keep toggling the signal
> 	without a client.
>
> Sure it is meant to describe a hardware specific property, but it tal=
ks
> about the driver.
>
Then the fix is to update the binding document.

> I'd go for these properties then:
>
> 	toggle-gpio: the gpio used to stroke the watchdog

'toggle' means something different in the current implementation.

> 	enable-gpio: optional, the gpio to enable and disable the watchdog
> 	disable-on-tri-state: optional, signals that the watchdog can
> 		be stopped by setting the trigger-gpio to tri-state.
> 	compatible, hw_algo and hw_margin_ms: as before.
> 	=09

I would agree that a separate 'enable' property would make sense (if yo=
u
have a watchdog needing it). Similar to disable-on-tri-state, if there
is some hardware which is implemented that way (mixing up hw_algo=3D=3D=
toggle
with that state doesn't seem correct). Deprecating hw_algo and replacin=
g it
with something more sensible might make sense as well ('algorithm' ?).

We have to be careful not to mix up hw_algo and enable, though.

> I think there is no need for a property that signals that the watchdo=
g
> is unstoppable. For level-gpio-watchdogs you can do it by setting the
> trigger gpio to inactive, and you cannot stop level-gpio-watchdogs
> unless enable-gpio or disable-on-tri-state is specified.
> If we ever feel the need to describe a gpio watchdog with a input tha=
t
> starts the device but cannot stop it, I'd suggest to use "start-gpio"
> for that one.
>
>> have to be the case. There are lots of watchdogs out there which can=
 not be
>> stopped. Some of them run all the time, others can not be stopped on=
ce
>> started.
> Yeah, I'm aware of that. For this driver however I wouldn't expect th=
at
> you have a dedicated enable-gpio if you cannot disable the device wit=
h it.

Why ? There are lots of chips which implement exactly that. There is an
enable bit in some register which can be used to enable the watchdog,
but once enabled it can not be stopped. I don't see why a gpio driven
watchdog would have to be any different.

> For hw_algo =3D "level" there is probably no device with an enable in=
put

Why should that be the case ?

> and for hw_algo =3D "toggle" any sane hardware engineer would simply
> enable the watchdog once the first toggle is detected on WDI. (OK,
> assuming hardware engineers being sane turned out to be a weak argume=
nt
> often in the past.)
>
I still don't see the relationship between enable and the toggle/level
algorithm. Really, those two properties are orthogonal.

>>> I'm aware that using ...-gpios is more common than ...-gpio. I don'=
t
>>> feel strong here, but as only a single gpio makes sense here, havin=
g
>>> -gpios seems wrong.
>>>
>> Documentation/devicetree/bindings/gpio/gpio.txt states that gpio pin
>> references should be named <name>-gpios. It even lists examples such=
 as
>>
>> 	enable-gpios =3D <&gpio2 2>;
>>
>> I thought this was a hard rule, and I seem to recall requests to cha=
nge
>> something-gpio to something-spios, but I may be wrong.
> Yeah, I'm aware of that. I talked about that in #armlinux yesterday, =
and
> Mark Brown (added to Cc:) said:
>
> 	Well, I'd prefer to change the standard TBH and allow singular.
> 	This keeps coming up and causing confusion for no good reason.
>
> Sounds sensible in my ears.
>

Makes sense to me, but I'd like to see that done first.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
