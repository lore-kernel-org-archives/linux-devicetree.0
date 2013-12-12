From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] time: Serialize calls to 'clockevents_update_freq'
 in the timing core
Date: Thu, 12 Dec 2013 13:07:45 +0100
Message-ID: <52A9A711.1040002@linaro.org>
References: <alpine.DEB.2.02.1312071151340.30673@ionos.tec.linutronix.de> <1386635686-15686-1-git-send-email-soren.brinkmann@xilinx.com> <1386635686-15686-2-git-send-email-soren.brinkmann@xilinx.com> <52A87799.8010300@linaro.org> <ba4dce4a-1332-4fd8-80de-41347bb5b7b2@TX2EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ba4dce4a-1332-4fd8-80de-41347bb5b7b2-8XeO8fnFoNFEus+KprP3J7jjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/11/2013 09:09 PM, S=C3=B6ren Brinkmann wrote:
> Hi Daniel,
>
> On Wed, Dec 11, 2013 at 03:32:57PM +0100, Daniel Lezcano wrote:
>> On 12/10/2013 01:34 AM, Soren Brinkmann wrote:
>>> From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>>>
>>> We can identify the broadcast device in the core and serialize all
>>> callers including interrupts on a different CPU against the update.
>>> Also, disabling interrupts is moved into the core allowing callers =
to
>>> leave interrutps enabled when calling clockevents_update_freq().
>>>
>>> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   kernel/time/clockevents.c    | 29 ++++++++++++++++++++++-------
>>>   kernel/time/tick-broadcast.c | 25 +++++++++++++++++++------
>>>   kernel/time/tick-internal.h  |  4 ++++
>>>   3 files changed, 45 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
>>> index 086ad6043bcb..641d91003a45 100644
>>> --- a/kernel/time/clockevents.c
>>> +++ b/kernel/time/clockevents.c
>>> @@ -439,6 +439,16 @@ void clockevents_config_and_register(struct cl=
ock_event_device *dev,
>>>   }
>>>   EXPORT_SYMBOL_GPL(clockevents_config_and_register);
>>>
>>> +int __clockevents_update_freq(struct clock_event_device *dev, u32 =
freq)
>>> +{
>>> +	clockevents_config(dev, freq);
>>> +
>>> +	if (dev->mode !=3D CLOCK_EVT_MODE_ONESHOT)
>>> +		return 0;
>>> +
>>> +	return clockevents_program_event(dev, dev->next_event, false);
>>> +}
>>> +
>>
>> ./arch/arm/kernel/smp_twd.c should be modified to call
>> __clockevents_update_freq instead of clockevents_update_freq, no ?
>
> IIUC, the __-version is only for timer core internal usage and not an
> exported interface. Doesn't the non-__ version work for the twd?
> I don't see issues on my Zynq platform with these patches.

I don't think there is an issue but if we can rid of the extra code=20
added in clockevents_update_freq with this patch for twd, it would make=
=20
sense. The __-version means the function is lockless and there is a=20
function without '__' in the name with the lock.

> Another side note regarding the twd: Shouldn't we set the
> CLOCK_EVT_FEAT_PERCPU flag we introduced recently for that timer?

Yes.

There will be some fun with the patchset http://lwn.net/Articles/566270=
/=20
where the local timer could be used as a broadcast timer.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
