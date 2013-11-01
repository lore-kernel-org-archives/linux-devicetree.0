From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 4/9] of/irq: Refactor interrupt-map parsing
Date: Fri, 01 Nov 2013 13:07:33 -0600
Message-ID: <5273FBF5.2080004@wwwdotorg.org>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org> <1381869563-16083-5-git-send-email-grant.likely@linaro.org> <CAOesGMj03kgJXttm80pHvPYeqg5hOaeOJAJ4DA8tf5LxqdArrQ@mail.gmail.com> <CACxGe6uE+KvycQq3XBavRcvprff6PhBaxX54W_Cb1cfuVpMXvQ@mail.gmail.com> <20131031185714.GA12646@quad.lixom.net> <20131101175317.A812AC40868@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131101175317.A812AC40868-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/01/2013 11:53 AM, Grant Likely wrote:
> On Thu, 31 Oct 2013 11:57:14 -0700, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> On Wed, Oct 30, 2013 at 02:25:21PM -0700, Grant Likely wrote:
>>> (Sorry for HTML mail)
>>>
>>> Can you put #define DEBUG at the top of drivers/of/irq.c and send me the
>>> log output from before and after the commit?
>>
>> Here you go, quite verbose log below.
>>
>> Looks like we're tripping the "no reg passed in" checks, not sure if related.
> 
> I think I've found the bug. See if this helps...
> 
> From 54a6d89d63361f8117ff69e4b65efabb12b897c7 Mon Sep 17 00:00:00 2001
> From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Fri, 1 Nov 2013 10:50:50 -0700
> Subject: [PATCH] of: Fixup interrupt parsing failure.

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, this fixes the clocksource errors that I was seeing when
performing CPU hotplug, as mentioned in:

https://lkml.org/lkml/2013/10/31/430
Re: [RFC 4/9] of/irq: Refactor interrupt-map parsing [CPU hotplug
clockevents issue]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
