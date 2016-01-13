From: xuejiancheng <xuejiancheng@huawei.com>
Subject: Re: [PATCH v5 5/6] mfd: dt-bindings: add device tree bindings for
 Hi3519 sysctrl
Date: Wed, 13 Jan 2016 17:08:20 +0800
Message-ID: <56961404.1000602@huawei.com>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com>
 <20160112083946.GN19803@x1> <5694C725.6010502@huawei.com>
 <5675031.hi9rRCqFXs@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5675031.hi9rRCqFXs@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee.jones@linaro.org>, mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 2016/1/13 6:51, Arnd Bergmann wrote:
> On Tuesday 12 January 2016 17:28:05 xuejiancheng wrote:
>>>>>>>
>>>>>> Not yet.
>>>>>> Arnd Bergmann and Rob Herring all suggested adding a specific co=
mpatible string
>>>>>> with the SOC name. This binding is just used for describing the =
compatible string now.
>>>>>> When more functions on hi3519 SOC are added later, the specific =
driver will be also
>>>>>> needed.
>>>>>
>>>>> Save this binding until it has more functionality.  We here "I'll=
 add
>>>>> to this later" all too often.
>>>>>
>>>>
>>>> In the hi3519.dtsi file, there is a system-controller device node =
described like below:
>>>> sysctrl: system-controller@12010000 {
>>>>      compatible =3D "hisilicon,hi3519-sysctrl", "syscon";
>>>>      reg =3D <0x12010000 0x1000>;
>>>> };
>>>> Do you mean that I should remove "hisilicon,hi3519-sysctrl" and ju=
st use "syscon" as the
>>>> compatible string?=E3=80=80
>>>
>>> Where is this compatible string _used_?
>>>
>>>> If I want to add "hisilicon,hi3519-sysctrl" for hi3519. where shou=
ld I put this binding?
>>>> Could you give some suggestions?  Thank you very much!
>>>
>>> If you're not using the compatible i.e. the device doesn't have its
>>> own driver yet, then there is no need to supply the binding at all,=
 is
>>> there?
>>>
>>
>> OK. Thank you.
>>
>=20
> Sorry for stepping in late here. I still think that every syscon devi=
ce should
> come with a specific compatible string, so we have the option of crea=
ting a
> driver later on, and I'd like to see a binding document that lists th=
ose strings
> (which I believe exists here).
>=20
> It's really hard to add compatible strings later on, anything else we=
 can
> work around by keying off that string and adding a workaround in the =
kernel.
>=20

Is it OK if I put this binding document into the directory "Documentati=
on/devicetree/bindings/arm/hisilicon"?

Thank you.

> 	Arnd
>=20
> .
>=20
