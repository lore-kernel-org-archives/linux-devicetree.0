From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC] improve binding for linux,wdt-gpio
Date: Thu, 30 Jul 2015 00:25:07 -0700
Message-ID: <55B9D153.5080202@roeck-us.net>
References: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de> <20150728212155.GA18137@roeck-us.net> <20150729073513.GB15360@pengutronix.de> <55B8F603.4000003@roeck-us.net> <20150730065951.GI15360@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150730065951.GI15360-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Uwe,

On 07/29/2015 11:59 PM, Uwe Kleine-K=F6nig wrote:
> Hello Guenter,
>
> On Wed, Jul 29, 2015 at 08:49:23AM -0700, Guenter Roeck wrote:
>> On 07/29/2015 12:35 AM, Uwe Kleine-K=F6nig wrote:
>>>> always-running is meant to indicate that the watchdog can not be s=
topped
>>>> (meaning a timer has to be used to send keepalives while the watch=
dog
>>>> device is closed). The documentation specifically states that.
>>>>
>>>> 	"If the watchdog timer cannot be disabled ..."
>>>>
>>>> How would you express that condition without always-running or a s=
imilar
>>>> attribute ?  I am also not sure how that relates to hw_algo; I tho=
ught
>>>> those properties are orthogonal.
>>> For hw_algo =3D "level" the inactive level of the gpio disables the
>>> watchdog (and resets the counter). So always-running doesn't make s=
ense
>>> for this type.
>>>
>> That is not what is currently implemented. "level" just means that
> I'm not talking (yet) about the implementation.
>> the watchdog is pinged using a -high-low-high- or -low-high-low-
>> sequence, while toggle means that the level is changed with each
>> ping (-low-(wait)-high-(wait)-low-(wait)-high-...).
> Currently the document tells us:
>
> 	hw_algo: [...]
> 	- level: Low or high level starts counting WDT timeout, the
> 	  opposite level disables the WDT.
>
> So similar to the "toggle" description there is some behaviour about
> being disabled in certain states implied.
>

It might be that you put too much emphasis on the documentation and
little or none on the code. We already established that the documentati=
on
is less than perfect. It might make sense to clean up the documentation
first to ensure that it matches what it is actually meant to document.

Sure, I understand, the devicetree bindings are supposed to be
implementation independent. We all know that this is an ideal view
which often does not match reality, as the code tends to be written
first and the devicetree bindings tend to be an afterthought.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
