From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/9] clocksource/cadence_ttc: Store timer frequency
 in driver data
Date: Wed, 18 Dec 2013 15:53:51 +0100
Message-ID: <52B1B6FF.7000400@linaro.org>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com> <1385514296-26702-4-git-send-email-soren.brinkmann@xilinx.com> <5cff3201-db97-4061-a686-bf79ac17d4fe@CO1EHSMHS006.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5cff3201-db97-4061-a686-bf79ac17d4fe-W/Q257+MkyH5op9OF0Koj7jjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/17/2013 08:21 PM, S=C3=B6ren Brinkmann wrote:
> Hi Daniel,
>
> On Tue, Nov 26, 2013 at 05:04:50PM -0800, Soren Brinkmann wrote:
>> It is not allowed to call clk_get_rate() from interrupt context. To
>> avoid such calls the timer input frequency is stored in the driver's
>> data struct which makes it accessible to the driver in any context.
>>
>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> I doubt that we'll resolve all issues with this series before the
> holidays or even the next merge window. Could you take this patch int=
o
> your tree for 3.14? It is not directly related to the cpufreq work an=
d
> fixes an actual issue that triggers a kernel WARN under some conditio=
n
> (I missed preserving the details and the trace). That would take the
> easy stuff out of the way and we can focus on the more controversial
> changes.

You are asking to take it for 3.14 but shouldn't it go as a 3.13 fix ?

   -- Daniel

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
