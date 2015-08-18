From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: correct regulator PM properties
Date: Tue, 18 Aug 2015 22:38:05 +0200
Message-ID: <CABxcv==UJXn+v3KE9EE=ry_0aC-T1PBePjyKzn7oawtF=rrNzw@mail.gmail.com>
References: <1439923455-109818-1-git-send-email-briannorris@chromium.org>
	<1439923455-109818-2-git-send-email-briannorris@chromium.org>
	<51457775.D3ds00ymOJ@phil>
	<CABxcv==hssVa-b=cOjh3QhEOmQPZVvEPt0apLHQOva3GjJb9PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABxcv==hssVa-b=cOjh3QhEOmQPZVvEPt0apLHQOva3GjJb9PA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Brian Norris <briannorris@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandru M Stan <amstan@chromium.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 18, 2015 at 10:30 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> On Tue, Aug 18, 2015 at 9:17 PM, Heiko Stuebner <heiko@sntech.de> wrote:
>>>
>>>               vcc5v_touch: SWITCH_REG2 {
>>>                       regulator-name = "vcc5v_touch";
>>> -                     regulator-suspend-mem-disabled;
>>> +                     regulator-state-mem {
>>> +                             regulator-on-in-suspend;
>>> +                     };
>>
>> wouldn't regulator-suspend-mem-disabled translate to regulator-off-in-suspend?
>
> Correct, the downstream regulator-suspend-mem-disabled is equivalent
> to regulator-off-in-suspend in mainline.
>
>> At least looks like it according to https://lkml.org/lkml/2013/7/25/592
>>
>
> I guess you meant https://lkml.org/lkml/2014/10/10/162 since it was
> Chanwoo's and not Vincent's version that finally landed.
>
>>

oh, now I got that you referenced Vincent's patch just to show the
regulator-suspend-mem-disabled property description.

Sorry for the noise then but yes you are right about the translation :-)

Best regards,
Javier
