From: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Subject: Re: [RFC] improve binding for linux,wdt-gpio
Date: Thu, 30 Jul 2015 08:15:30 +0200
Message-ID: <55B9C102.50608@topic.nl>
References: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de> <20150728212155.GA18137@roeck-us.net> <20150729073513.GB15360@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150729073513.GB15360-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=EF=BB=BFOn 29-07-15 09:35, Uwe Kleine-K=C3=B6nig wrote:
> Hello Guenter,
>
> On Tue, Jul 28, 2015 at 02:21:55PM -0700, Guenter Roeck wrote:
>> On Tue, Jul 28, 2015 at 10:33:48PM +0200, Uwe Kleine-K=C3=B6nig wrot=
e:
>>> This is just a suggestion up to now, I don't have any code yet to s=
hare.
>>>
>>> Apart from minor rewording to make the document easier to understan=
d and
>>> less ambiguous the relevant changes are:
>>>
>>>   - add an "enable-gpio" property.
>>>     I admit the device I'm currently working with doesn't have this=
=2E
>>>     Still I imagine this to be a common hardware property. I added =
it
>>>     mainly to demonstrate the shortcomings of the existing binding.
>>>   - rename "gpios" to "trigger-gpio"
>>>     This is more descriptive. And given there is "enable-gpio" now,=
 too,
>>>     using plain "gpios" seems wrong.
>>>   - deprecate always-running
>>>     Apart from the description describing the driver behaviour and =
not
>>>     the device property, always-running only seems to make sense in
>>>     combination with hw_algo =3D "level" and in reality should only
>>>     invalidate the sentence: "The watchdog timer is disabled when G=
PIO is
>>>     left floating or connected to a three-state buffer."
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
> I'd go for these properties then:
>
> 	toggle-gpio: the gpio used to stroke the watchdog
> 	enable-gpio: optional, the gpio to enable and disable the watchdog
> 	disable-on-tri-state: optional, signals that the watchdog can
> 		be stopped by setting the trigger-gpio to tri-state.
> 	compatible, hw_algo and hw_margin_ms: as before.
> I think there is no need for a property that signals that the watchdo=
g
> is unstoppable. For level-gpio-watchdogs you can do it by setting the
> trigger gpio to inactive, and you cannot stop level-gpio-watchdogs
> unless enable-gpio or disable-on-tri-state is specified.
> If we ever feel the need to describe a gpio watchdog with a input tha=
t
> starts the device but cannot stop it, I'd suggest to use "start-gpio"
> for that one.

I don't see any change in the number of properties required to describe=
=20
things. So the driver just gets more complicated, especially if you wan=
t it to=20
be somewhat backward compatible.

The way you describe how one could get the "always-running" effect does=
n't=20
really sound intuitive. It's much easier to just have a property that p=
lainly=20
explains that the watchdog is unstoppable, than that that is the result=
 of=20
combining a bunch of seemingly unrelated properties together to get the=
 driver=20
to do what needs to be done.

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
> For hw_algo =3D "level" there is probably no device with an enable in=
put
> and for hw_algo =3D "toggle" any sane hardware engineer would simply
> enable the watchdog once the first toggle is detected on WDI. (OK,
> assuming hardware engineers being sane turned out to be a weak argume=
nt
> often in the past.)
>
>> That gets us into the rat-hole of arguing if property X describes dr=
iver
>> behavior or the hardware, and of rejecting properties because they m=
ay
>> be driver descriptions in some use cases (because 'always-running' c=
an
>> be set even if the hardware doesn't mandate it, making it driver beh=
avior).
>> I'd rather not go there.
> I think we agree here, that "always-running" is a hardware property.

I'd that "always-running" describes both. The driver must be always str=
oking=20
(what a nice word) the watchdog because the watchdog is always watching=
=2E

>>> ...
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans-yhtFebqMsb9it5bFGTN0CAC/G2K4zDHf@public.gmane.org
Website: www.topicproducts.com

Please consider the environment before printing this e-mail





--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
