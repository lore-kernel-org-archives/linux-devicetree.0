From: Caesar Wang <caesar.upstream@gmail.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: rockchip: Add the OTP gpio pinctrl
Date: Thu, 19 Nov 2015 10:44:02 +0800
Message-ID: <564D3772.9050402@gmail.com>
References: <1445599528-18825-1-git-send-email-wxt@rock-chips.com>
 <1445599528-18825-4-git-send-email-wxt@rock-chips.com>
 <CAD=FV=WBCD8WsXV2mAGUD6y=BFScbFc9U3XA7jAB-rqOLp4qGA@mail.gmail.com>
 <2741625.HAsG2fX6yg@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2741625.HAsG2fX6yg@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Doug Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

=E5=9C=A8 2015=E5=B9=B410=E6=9C=8825=E6=97=A5 15:55, Heiko St=C3=BCbner=
 =E5=86=99=E9=81=93:
> Am Freitag, 23. Oktober 2015, 08:25:08 schrieb Doug Anderson:
>> On Fri, Oct 23, 2015 at 4:25 AM, Caesar Wang <wxt@rock-chips.com> wr=
ote:
>>> Add the "init" anf "sleep" pinctrl as the OTP gpio state.
>>> We need the OTP pin is gpio state before resetting the TSADC contro=
ller,
>>> since the tshut polarity will generate a high signal.
>>>
>>> "init" pinctrl property is defined by Doug's Patch[0].
>>>
>>> Patch[0]:
>>> https://patchwork.kernel.org/patch/7454311/
>>>
>>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>> Changes in v4: None
>>>
>>> Changes in v3:
>>>    - Add the "sleep" pinctrl as the gpio state in PATCH[3/3]
>>>
>>> Changes in v2:
>>>    - Add some commits for more obvious in PATCH[2/2]
>>>
>>> Changes in v1:
>>>    - As the Doug comments, drop the thermal driver patchs since
>>>   =20
>>>      we can with pinctrl changing to work.
>>>   =20
>>>    - As the Doug's patch to add the 'init' property.
>>>  =20
>>>   arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++--
>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>> I realized that the subject of this patch should probably contain th=
e
>> word rk3288, but I presume Heiko would rather add that himself than
>> for you to spin this again.  ;)
> yep :-) ... no need to respin for such an easy change

That's seem this patch didn't merge into your v4.5-armsoc/soc branch.:-=
)

I guess this patch should merge into  kernel-4.4 since the Patch[1/3] /=
=20
[2/3] have been merged into 4.4-rc1.:-P

>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--=20
Thanks,
Caesar
