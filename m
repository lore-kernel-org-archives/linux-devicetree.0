From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v7 0/5] This is the 1st version of suspend for RK3288.
Date: Mon, 10 Nov 2014 21:47:35 -0800
Message-ID: <CAD=FV=UJAzVgZedrJJaxCc+3FdJp__NV9-9pY=wTH_ZydXrQcg@mail.gmail.com>
References: <1415368177-6637-1-git-send-email-zyw@rock-chips.com>
	<7hwq76pqyz.fsf@deeprootsystems.com>
	<22835729.YDXmW0qp6M@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <22835729.YDXmW0qp6M@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 10, 2014 at 4:40 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Hi Chris,
>
> Am Freitag, 7. November 2014, 14:48:20 schrieb Kevin Hilman:
>> Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> writes:
>> > RK3288 can shut down the cpu, gpu and other device controllers in =
suspend,
>> > and it will pull the GLOBAL_PWROFF pin to high in the final stage =
of the
>> > process of suspend, pull the pin to low again when resume.
>>
>> The cover letter still doesn't state what this series applies to, or
>> what its dependencies are for testing, even though it was requested =
in
>> earlier reviews[1].  I discovered (again) by trial and error it appl=
ies
>> to current linux-next.  I also discovered (as was earlier discussed[=
2])
>> that it still does not resume using current upstream code, and those
>> dependencies are not described here either.  These are the kinds of
>> things that are crucial in a cover letter in order to help reviewers=
 and
>> testers not have to spend time digging through the archives trying t=
o
>> remember from the previous round of reviews.
>>
>> Please, please list the out-of-tree dependencies, and how to test,
>> including how you tested it, and on what hardware.
>
> I'll second what Kevin said.
>
> I guess the regulator suspend handling [0] is one of the requirements=
, but I'd
> think there is more. And while Doug had a quite long list of suspend-=
related
> patches in his try, for now we'll need the minimal set to enable this=
 series
> to sucessfully wake the system again after going to suspend.

With the current series we have in the Chrome OS tree, the WIP power
domain patches are a requirement, which makes testing very hard.  I've
suggested that Chris try going back to leaving the GPU on his patches.
It's possible you could get basic suspend/resume without power domain
patches in that case.  Once power domain stuff is in good shape then
we can turn off the GPU, I think.

=2E..all of those things are needed to actually get the system into the
lowest power state, but starting simple makes a lot of sense.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
