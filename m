From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clocksource: rockchip: Make the driver more
 compatible
Date: Tue, 3 Nov 2015 10:00:39 +0800
Message-ID: <56381547.5070109@gmail.com>
References: <1443147298-12603-1-git-send-email-wxt@rock-chips.com>
 <5632E765.4010207@gmail.com> <56334995.6090103@linaro.org>
 <21587719.mnFBFBzBeI@phil> <56379D46.1000402@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56379D46.1000402-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Daniel,

=E5=9C=A8 2015=E5=B9=B411=E6=9C=8803=E6=97=A5 01:28, Daniel Lezcano =E5=
=86=99=E9=81=93:
> On 10/31/2015 12:47 AM, Heiko Stuebner wrote:
>> Hi Daniel,
>>
>> Am Freitag, 30. Oktober 2015, 11:42:29 schrieb Daniel Lezcano:
>>> On 10/30/2015 04:43 AM, Caesar Wang wrote:
>>>> Hi Daniel,
>>>>
>>>> =E5=9C=A8 2015=E5=B9=B410=E6=9C=8801=E6=97=A5 03:14, Heiko St=C3=BC=
bner =E5=86=99=E9=81=93:
>>>>> Hi Daniel,
>>>>>
>>>>> Am Dienstag, 29. September 2015, 06:18:03 schrieb Daniel Lezcano:
>>>>>> On 09/25/2015 04:14 AM, Caesar Wang wrote:
>>>>>>> Build the arm64 SoCs (e.g.: RK3368) on Rockchip platform,
>>>>>>> There are some failure with build up on timer driver for rockch=
ip.
>>>>>>>
>>>>>>> Says:
>>>>>>> /tmp/ccdAnNy5.s:47: Error: missing immediate expression at  ope=
rand
>>>>>>> 1 --
>>>>>>> `dsb`
>>>>>>> ...
>>>>>>>
>>>>>>> The problem was different semantics of dsb on btw arm32 and arm=
64,
>>>>>>> Here we can convert the dsb with insteading of dsb(sy).The "sy"=
=20
>>>>>>> param
>>>>>>> is the default which you are allow to omit, so on arm32 dsb()an=
d
>>>>>>> dsb(sy)
>>>>>>> are the same.
>>>>>>>
>>>>>>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>>> Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>> as you have "just" Acked these patches, I guess you are expecting=
=20
>>>>> them
>>>>> to go
>>>>> through the same tree as the devicetree changes, right?
>>>>
>>>> I'm wonder if someone will apply this series patchs but the wait.:=
-)
>>>> In fact, I'm no sure that the Acked is really meaning.:-
>>>
>>> Yes, by acking the patch I say I am ok with it and I agree it can g=
o
>>> through another tree.
>>
>> although I guess the two clocksource changes could very well just go
>> through your tree. dsb() -> dsb(sy) is supposed to be equal and the=20
>> second
>> one is just cosmetics.  The Kconfig and dts changes need to wait in=20
>> any case
>> for 4.5 ... but I guess that may be true for the clocksource changes=
=20
>> as well?
>
> Heiko, Caesar,
>
> I am wondering if the dsb() is really necessary. Is it possible you=20
> test the timer by removing this instruction ? Otherwise I will have t=
o=20
> setup my board again and it will take awhile.
>

As the @Arnd suggestion,

That's seem ok for me.
Although the writel_relaxed() and writel() a bit different  with DSB()=20
and L2's sync.

Do I need send the patch v3?  I will test that on my board.

I'm no sure that why the clocksource driver didn't use the=20
writel_relaxed() to work.
Okay, I think we should according to the suggestion or required.

--=20
Thanks,
Caesar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
