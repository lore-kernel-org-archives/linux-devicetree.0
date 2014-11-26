From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: rockchip: add binding ID for DMC (memory
 controller) clocks on rk3288
Date: Tue, 25 Nov 2014 16:49:08 -0800
Message-ID: <CAD=FV=WxeFFZekYOkttx4YcDq=td+Vpu9rFALuNu_6zs+7b2tw@mail.gmail.com>
References: <1416960783-25119-1-git-send-email-dianders@chromium.org>
	<1717801.sWHeWsmqUi@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1717801.sWHeWsmqUi@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: jeff chen <cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Tue, Nov 25, 2014 at 4:45 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Am Dienstag, 25. November 2014, 16:13:02 schrieb Doug Anderson:
>> From: Jeff Chen <cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> The DMC clocks need to be turned off at runtime, so we should have I=
Ds
>> so we can export them.
>>
>> Signed-off-by: Jeff Chen <cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> [dianders: split into two patches; adjusted commit msg]
>> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> both patches look ok to me and I'll probably pick them up tomorrow.

OK, thanks!


> Just as handling question, do you plan on sending dts changes using t=
hese
> clocks in time for 3.19 [i.e. in the next couple of days]?

There's pretty much zero chance.  Maybe negative.


> We have currently three clock patches/series adding new clock ids [th=
is one,
> the mmc phases and Sonny's i2s_clkout] and I'm trying to dertermine i=
f I need
> a shared branch for those.
>
> Currently it doesn't look like the others will provide dts patches us=
ing the
> clocks in time, so it looks like I can skip the shared branch and we =
can use
> the clock ids regularly after the merge-window. Some true for your cl=
ocks?

Yup, no problem for me.  I provided this as two patches to you just in
case it was convenient, since I saw that as feedback in previous
submissions.

Thanks!

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
