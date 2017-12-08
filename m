From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 3/6] clocksource: stm32: only use 32 bits timers
Date: Fri, 8 Dec 2017 13:51:46 +0100
Message-ID: <56efa18e-481b-bd1b-7a54-db4a21073313@linaro.org>
References: <20171208113250.359-1-benjamin.gaignard@st.com>
 <20171208113250.359-4-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171208113250.359-4-benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/2017 12:32, Benjamin Gaignard wrote:
> From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> The clock driving counters is at 90MHz so the maximum period
> for 16 bis counters is around 728us (2^16 / 90.000.000).
> For 32 bits counters this period is close 47 secondes which is
> more acceptable.
> 
> When using 16 bits counters the kernel may not be able to boot
> because it has a too high overhead compare to the clockevent period.
> Downgrading the rating of 16bits counter won't change anything
> to this problem so this patch remove 16 bits counters support
> and makes sure that they won't be probed anymore.

Benjamin,

there is an inconsistency in this description and the patchset. This is
why it is so confusing to review and understand the purpose.

Why are you preventing the clockevents to work with 16bits while the
issue is related to the clocksource you introduce in the next patch ?

Also, why are you removing the DT nodes ?

Accept to register the clocksource only if it is a 32bits timer. Let the
clockevents to register themselves and have the rating to sort out the
this. I do believe that is what Thomas asked you the first time.

You can keep the hardware description in the DT and boot gracefully with
the first 32bits timer succeeding the init.

Take the time to think about it, comment and let's reach an agreement
before you send another version, I'm tired to review again and again
these stm32 timers.

Thanks.

  -- Daniel




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
