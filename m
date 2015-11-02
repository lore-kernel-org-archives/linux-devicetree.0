From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clocksource: rockchip: Make the driver more
 compatible
Date: Mon, 2 Nov 2015 18:28:38 +0100
Message-ID: <56379D46.1000402@linaro.org>
References: <1443147298-12603-1-git-send-email-wxt@rock-chips.com>
 <5632E765.4010207@gmail.com> <56334995.6090103@linaro.org>
 <21587719.mnFBFBzBeI@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <21587719.mnFBFBzBeI@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/31/2015 12:47 AM, Heiko Stuebner wrote:
> Hi Daniel,
>
> Am Freitag, 30. Oktober 2015, 11:42:29 schrieb Daniel Lezcano:
>> On 10/30/2015 04:43 AM, Caesar Wang wrote:
>>> Hi Daniel,
>>>
>>> =E5=9C=A8 2015=E5=B9=B410=E6=9C=8801=E6=97=A5 03:14, Heiko St=C3=BC=
bner =E5=86=99=E9=81=93:
>>>> Hi Daniel,
>>>>
>>>> Am Dienstag, 29. September 2015, 06:18:03 schrieb Daniel Lezcano:
>>>>> On 09/25/2015 04:14 AM, Caesar Wang wrote:
>>>>>> Build the arm64 SoCs (e.g.: RK3368) on Rockchip platform,
>>>>>> There are some failure with build up on timer driver for rockchi=
p.
>>>>>>
>>>>>> Says:
>>>>>> /tmp/ccdAnNy5.s:47: Error: missing immediate expression at  oper=
and
>>>>>> 1 --
>>>>>> `dsb`
>>>>>> ...
>>>>>>
>>>>>> The problem was different semantics of dsb on btw arm32 and arm6=
4,
>>>>>> Here we can convert the dsb with insteading of dsb(sy).The "sy" =
param
>>>>>> is the default which you are allow to omit, so on arm32 dsb()and
>>>>>> dsb(sy)
>>>>>> are the same.
>>>>>>
>>>>>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>> Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> as you have "just" Acked these patches, I guess you are expecting =
them
>>>> to go
>>>> through the same tree as the devicetree changes, right?
>>>
>>> I'm wonder if someone will apply this series patchs but the wait.:-=
)
>>> In fact, I'm no sure that the Acked is really meaning.:-
>>
>> Yes, by acking the patch I say I am ok with it and I agree it can go
>> through another tree.
>
> although I guess the two clocksource changes could very well just go
> through your tree. dsb() -> dsb(sy) is supposed to be equal and the s=
econd
> one is just cosmetics.  The Kconfig and dts changes need to wait in a=
ny case
> for 4.5 ... but I guess that may be true for the clocksource changes =
as well?

Heiko, Caesar,

I am wondering if the dsb() is really necessary. Is it possible you tes=
t=20
the timer by removing this instruction ? Otherwise I will have to setup=
=20
my board again and it will take awhile.


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
