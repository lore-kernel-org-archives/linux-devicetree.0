From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: spear600: Add missing interrupt-parent of rtc
Date: Fri, 12 Jan 2018 09:56:40 +0100
Message-ID: <CAK8P3a2SO4=YKBE3L_AKsyfNe77YR7a8F=dvbS=ic03=6NK8MA@mail.gmail.com>
References: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar@linaro.org>
 <20180112020711.6gp2pnsxxjzelidq@localhost> <20180112032223.GK3626@vireshk-i7>
 <CAOesGMggU73asY1SEUDD_BsWcrGYR___o8e5omjziOPEwJgqBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMggU73asY1SEUDD_BsWcrGYR___o8e5omjziOPEwJgqBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ARM-SoC Maintainers <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 12, 2018 at 4:23 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Thu, Jan 11, 2018 at 7:22 PM, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 11-01-18, 18:07, Olof Johansson wrote:
>>> On Thu, Jan 11, 2018 at 11:28:51AM +0530, Viresh Kumar wrote:
>>> > The interrupt-parent of rtc was missing, add it.
>>> >
>>> > Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
>>> > Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.8+
>>> > Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>> > Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>
>>> Applied to next/dt. Is stable really needed on this? It's been broken since
>>> pretty much forever, and nobody has complained... :)
>>
>> Not sure. Just thought it may be useful for someone somewhere :)
>
> Ok. Left the tags there, but didn't merge into fixes since we're late
> in -rc and this didn't seem critical at this time.

My plan was to have these in the fixes branch in the hope of making
it to a clean build for 4.15 after all, they fix warnings that got introduced
by the updated dtc checks in 4.15-rc1.

We are getting fairly close, but it seems we still miss a few, so we
might as well give up at this point. The remaining fixes should be easy
to backport into v4.15.y if we decide to do it, of further back even.
For v4.14 and before, the in-kernel copy of dtc won't warn, but mainline
dtc will.

Greg, let me know your thoughts on this for the upcoming 4.15.y
release. We had hundreds of dtc warnings in 4.15-rc1, many of them
about important bugs, now we're down to a couple of warnings
for platforms we don't care about much, and I expect the last of
these fixes to land in 4.16-rc1 or maybe -rc2. Shall we backport
them all to get a clean 4.15.y release?

Note: there was at least one dtc warning fix that caused a serious
regression in code that relied on a device probe to fail because of
an invalid node (a fix is still in the works for 4.15), though generally
the fixes are really harmless and can only make things better.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
