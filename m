From: Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [RESEND PATCH v1 4/4] clk: rockchip: rk3036: fix and add node id for emac clock
Date: Sat, 2 Jan 2016 10:34:46 +0800
Message-ID: <01110793-A349-4006-82A2-4489CE832B19@rock-chips.com>
References: <1451293433-32392-1-git-send-email-zhengxing@rock-chips.com> <5681E8E4.2010303@rock-chips.com> <5681F121.3070307@rock-chips.com> <1562268.fb58QJ4jV7@diego>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1562268.fb58QJ4jV7@diego>
Sender: linux-clk-owner@vger.kernel.org
To: =?GB2312?Q?Heiko_St=A8=B9bner?= <heiko@sntech.de>
Cc: Yakir Yang <ykk@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michael Turquette <mturquette@baylibre.com>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, keescook@google.com, linux-clk@vger.kernel.org, leozwang@google.com, xing.zheng@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko,
    Thank you for your patch, I will apply and test it later.

Thanks.

> =D4=DA 2016=C4=EA1=D4=C22=C8=D5=A3=AC06:10=A3=ACHeiko St=A8=B9bner <h=
eiko@sntech.de> =D0=B4=B5=C0=A3=BA
>=20
> Hi Xing,
>=20
> Am Dienstag, 29. Dezember 2015, 10:34:09 schrieb Xing Zheng:
>> On 2015=C4=EA12=D4=C229=C8=D5 09:59, Yakir Yang wrote:
>>> On 12/28/2015 08:41 PM, Heiko St=A8=B9bner wrote:
>>>> Am Montag, 28. Dezember 2015, 17:03:53 schrieb Xing Zheng:
>>>>> Due to referred old version TRM, there is incorrect emac clock no=
de,
>>>>> we should fix it. The SEL_21_9 is the parent of SEL_21_4.
>>>>>=20
>>>>> In the emac driver, we need to refer HCLK_MAC, and because There =
are
>>>>> only 3PLLs (APLL/GPLL/DPLL) on the rk3036, most clock are under t=
he
>>>>> GPLL, and it is unable to provide the accurate rate for mac_ref w=
hich
>>>>> need to 50MHz probability, we should let it under the APLL and ar=
e
>>>>> able to set the freq which integer multiples of 50MHz, so we add =
these
>>>>> emac node for reference.
>>>>=20
>>>> I don't really follow here. While I do understand that the emac ne=
eds
>>>> 50MHz, I
>>>> don't think using the APLL as source is helpful.
>>>>=20
>>>> The APLL is the main clocksource for the cpu-cores, including freq=
uency
>>>> scaling, and while it currently only lists 816MHz as sole frequenc=
y,
>>>> you're
>>>> pretty much guaranteed to not get your correct multiple of 50MHz f=
rom
>>>> there
>>>> either. And limiting the cpu to just do 600MHz to get the mac work=
ing
>>>> sounds
>>>> pretty bad ;-) .
>>>>=20
>>>>=20
>>>> In the rk3036 cru-node the gpll gets set to 594MHz. Is there a
>>>> special reason
>>>> why it needs to be 594MHz and cannot be a round 600MHz? Because th=
at
>>>> would
>>>> also provide your 50MHz-multiple nicely.
>>>=20
>>> Yes, this magic 594MHz would help to support the standard HDMI
>>> resolutions, here are the math:
>>>=20
>>> 1920x1080-60Hz DCLK =3D 148.5MHz =3D 594MHz / 4
>>> 1280x720-60Hz DCLK =3D 74.25MHz =3D 594MHz / 8
>>> 720x480-60Hz DCLK =3D 27MHz =3D 594MHz / 22
>>>=20
>>> Thanks,
>>> - Yakir
>>=20
>> Thanks Yakir.
>>=20
>> Hi Heiko,
>> From the above, do you have better idea for the RK3036's emac withou=
t
>> ext-oscillator?
>=20
> During the last days I did play a bit with the clock framework. As I =
don't=20
> have a Kylin (or any rk3036) board, I did build a test-case with pclk=
_cpu on=20
> the rk3188 (which can be affected by the armclk if not reparented to =
the=20
> gpll), which got sucessfully adapted to get back to (or near) the ori=
ginally=20
> requested frequency.
>=20
> So ideally you could roll back your mux/div split here and try the at=
tached=20
> diff. In theory it should help :-) .
> As can be seen by the FIXMEs, not fully finished, but I'd like to det=
ermine if=20
> it fixes the issue at least.
>=20
>=20
> Heiko
> <clk-keep-req-rate.diff>

