From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/4] clocksource: rockchip: Make the driver more
 compatible
Date: Fri, 30 Oct 2015 11:42:29 +0100
Message-ID: <56334995.6090103@linaro.org>
References: <1443147298-12603-1-git-send-email-wxt@rock-chips.com>
 <1443147298-12603-2-git-send-email-wxt@rock-chips.com>
 <560A10FB.7040408@linaro.org> <2486591.i0n1KlEQoc@diego>
 <5632E765.4010207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5632E765.4010207@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <caesar.upstream@gmail.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On 10/30/2015 04:43 AM, Caesar Wang wrote:
> Hi Daniel,
>
> =E5=9C=A8 2015=E5=B9=B410=E6=9C=8801=E6=97=A5 03:14, Heiko St=C3=BCbn=
er =E5=86=99=E9=81=93:
>> Hi Daniel,
>>
>> Am Dienstag, 29. September 2015, 06:18:03 schrieb Daniel Lezcano:
>>> On 09/25/2015 04:14 AM, Caesar Wang wrote:
>>>> Build the arm64 SoCs (e.g.: RK3368) on Rockchip platform,
>>>> There are some failure with build up on timer driver for rockchip.
>>>>
>>>> Says:
>>>> /tmp/ccdAnNy5.s:47: Error: missing immediate expression at  operan=
d
>>>> 1 --
>>>> `dsb`
>>>> ...
>>>>
>>>> The problem was different semantics of dsb on btw arm32 and arm64,
>>>> Here we can convert the dsb with insteading of dsb(sy).The "sy" pa=
ram
>>>> is the default which you are allow to omit, so on arm32 dsb()and
>>>> dsb(sy)
>>>> are the same.
>>>>
>>>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
>>> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> as you have "just" Acked these patches, I guess you are expecting th=
em
>> to go
>> through the same tree as the devicetree changes, right?
>
> I'm wonder if someone will apply this series patchs but the wait.:-)
> In fact, I'm no sure that the Acked is really meaning.:-

Yes, by acking the patch I say I am ok with it and I agree it can go=20
through another tree.

I suggest before sending patches you read carefully the file=20
Documentation/SubmittingPatches.

Especially, 11), 12) and 13).

Thanks.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
