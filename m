From: Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: fix PWM clock found on RK3288 Socs
Date: Wed, 19 Nov 2014 18:27:45 +0800
Message-ID: <546C70A1.9090707@rock-chips.com>
References: <1416367554-15185-1-git-send-email-caesar.wang@rock-chips.com> <CAD=FV=W+WU3j7OWKTxtGUv1Jt7qPesGXSOsoM=bsD5C15jttvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=W+WU3j7OWKTxtGUv1Jt7qPesGXSOsoM=bsD5C15jttvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, ZhenFu Fang <fzf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chris Zhong <chris.zhong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Doug,

=E5=9C=A8 2014/11/19 13:14, Doug Anderson =E5=86=99=E9=81=93:
> Caesar,
>
> On Tue, Nov 18, 2014 at 7:25 PM, Caesar Wang <caesar.wang@rock-chips.=
com> wrote:
>> We use the new PWM IP on RK3288,but the PWM's clock indeed incorrect=
=2E
>>
>> Signed-off-by: Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/rk3288.dtsi | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
> Right, I reported this when Kever was doing his "unused clocks" patch=
=2E
> That's why this clock is currently "ignore unused".
>
> ...but though your change is right, I'd rather your change doesn't
> land quite yet.  It totally wrecks havoc with the PWM regulator used
> on many rk3288 boards and will glitch the main "logic" voltage at
> bootup.  I have some patches that are MASSIVELY WIP:
>
> https://chromium-review.googlesource.com/230640
> WIP: regulator: pwm: Tell regulator framework that we can't turn off
>
> https://chromium-review.googlesource.com/230641
> WIP: PWM: handle the fact that firmware might have left us enabled
>
> https://chromium-review.googlesource.com/230642
> WIP: pwm-regulator stuff
>
> I think that last one might blow up into several patches.  We need to
> solve the problems from those patches before yours can really land.
>
>
> It's pretty high on my list to finish the above patches, but right no=
w
> suspend/resume issues are higher priority so it's a bit stalled...  I=
f
> someone wants to hijack any of the above patches please let me know--=
I
> won't be offended.

OK,I see.


> -Doug
>
>
>

--=20
Best regards,
Caesar


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
