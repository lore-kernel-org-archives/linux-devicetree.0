From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] tick: broadcast: Deny per-cpu clockevents from being
 broadcast sources
Date: Fri, 13 Sep 2013 10:25:57 +0200
Message-ID: <5232CC15.8090208@linaro.org>
References: <1379004640-15117-1-git-send-email-soren.brinkmann@xilinx.com> <1379004640-15117-2-git-send-email-soren.brinkmann@xilinx.com> <alpine.DEB.2.02.1309122224420.4089@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1309122224420.4089-3cz04HxQygjZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/12/2013 10:30 PM, Thomas Gleixner wrote:
> On Thu, 12 Sep 2013, Soren Brinkmann wrote:
>> From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>
>> On most ARM systems the per-cpu clockevents are truly per-cpu in
>> the sense that they can't be controlled on any other CPU besides
>> the CPU that they interrupt. If one of these clockevents were to
>> become a broadcast source we will run into a lot of trouble
>> because the broadcast source is enabled on the first CPU to go
>> into deep idle (if that CPU suffers from FEAT_C3_STOP) and that
>> could be a different CPU than what the clockevent is interrupting
>> (or even worse the CPU that the clockevent interrupts could be
>> offline).
>>
>> Theoretically it's possible to support per-cpu clockevents as the
>> broadcast source but so far we haven't needed this and supporting
>> it is rather complicated. Let's just deny the possibility for now
>> until this becomes a reality (let's hope it never does!).
>=20
> Well, we can't do it this way. There are globally accessible clock
> event devices which deliver only to cpu0. So the mask check might be
> causing failure here.
>=20
> Just add a feature flag CLOCK_EVT_FEAT_PERCPU to the clock event
> device and check for it.

It sounds probably more understandable than dealing with the cpumasks.

I am wondering if this is semantically opposed to
http://lwn.net/Articles/566270/ ?

[PATCH V3 0/6] cpuidle/ppc: Enable broadcast support for deep idle stat=
es

  -- Daniel

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

  * English - detected
  * English
  * French

  * English
  * French

 <javascript:void(0);>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
