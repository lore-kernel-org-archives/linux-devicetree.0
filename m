From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/2] Increase the maximum cpu frequency of rk3288
Date: Tue, 25 Nov 2014 09:37:40 -0800
Message-ID: <CAD=FV=XJXHmRst-fcR0c7UfFPKgfS+g0aFhvxSk8RKRXN4L75Q@mail.gmail.com>
References: <1416908253-31721-1-git-send-email-zyw@rock-chips.com>
	<5474AAB4.2060301@rock-chips.com>
	<3297542.UgVU3NH89O@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3297542.UgVU3NH89O@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Nov 25, 2014 at 8:23 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Hi Chris, Kever,
>
> Am Mittwoch, 26. November 2014, 00:13:40 schrieb Kever Yang:
>> On 11/25/2014 05:37 PM, Chris Zhong wrote:
>> > The maximum cpu frequency of rk3288 can up to 1.8Ghz, but the vdd_=
cpu need
>> > set to 1.4v. I've tested these patches on rk3288 evb board.
>>
>> I'm not sure why you need this patch, I think we have a discuss
>> for the cpu operating point before.
>> In this case:
>> 1. rk3288.dtsi is for all the rk3288 Soc based system, you may need
>> a separate opp table in rk3288-evb-rk808.dts;
>> 2. 1.4V may beyond the supported voltage range too much,
>>      and it's not a good idea to add it to rk3288.dtsi as a safe vol=
tage.
>> 3. Do you have a stress/heavy load test on evb with 1.4v at 1.8GHz?
>
> That is how I remember it as well ... the default opp table is suppos=
ed to
> contain only the safest of values, while individual boards can then i=
ncrease
> those in conjunction with their thermal design.
>
> As the evb itself does only have the naked soc without any heat-sink =
or
> similar, I'm not even sure if these additional frequencies should be =
enabled
> there at all.

I'm not sure that the story from Rockchip is all straight about all of
this stuff, but I will say that:

* The latest datasheet I have (1.3) shows the maximum CPU frequency as
1.8GHz.  It shows the maximum CPU voltage as TBD.  That indicates that
rk3288.dtsi ought to list 1.8GHz values.

* The 1.4V number comes from folks at Rockchip.  Please check with
Jianqun Xu and Eddie Cai to check.  If 1.4V is not safe we certainly
shouldn't use it.  I believe they have seen boards where 1.8GHz needed
1.4V to be reliable.  Either the SoCs on these boards are out of spec
or 1.4V is needed.

* If you're worried about heat we should make sure that all the
thermal changes are in.  That will still let you run at 1.8GHz
temporarily.  You can put a heatsync on and run faster.

* These numbers are still conservative as far as I understand.  For
instance on rk3288-pinky 1.8GHz is a full .1V lower at 1.3V.

* If EVB was shipped with pre-production chips that can't support high
voltages or frequencies, it should override the table to remove the
high frequencies.  However, if the table that Chris submitted is
generally correct (and conservative) for rk3288 devices that are
expected in real products then it seems like it ought to land in
rk3288.dtsi.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
