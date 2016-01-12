From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 5/6] mfd: dt-bindings: add device tree bindings for
 Hi3519 sysctrl
Date: Tue, 12 Jan 2016 07:41:07 +0000
Message-ID: <20160112074107.GK19803@x1>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com>
 <1452219400-32478-6-git-send-email-xuejiancheng@huawei.com>
 <20160111054846.GD3331@x1>
 <56935EA8.4060801@huawei.com>
 <20160111085555.GE14104@x1>
 <5694584D.7040301@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5694584D.7040301@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuejiancheng <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Tue, 12 Jan 2016, xuejiancheng wrote:

>=20
>=20
> On 2016/1/11 16:55, Lee Jones wrote:
> > On Mon, 11 Jan 2016, xuejiancheng wrote:
> >> On 2016/1/11 13:48, Lee Jones wrote:
> >>> On Fri, 08 Jan 2016, Jiancheng Xue wrote:
> >>>
> >>>> Add device tree bindings for Hi3519 system controller.
> >>>>
> >>>> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/mfd/hi3519.txt | 14 +++++++++=
+++++
> >>>>  1 file changed, 14 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/mfd/hi3519=
=2Etxt
> >>>
> >>> I have this patch, but none of the others in the set, thus I am
> >>> lacking context.
> >>>
> >> I can forward other patches in the set to you. Thank you.
> >>
> >>>> diff --git a/Documentation/devicetree/bindings/mfd/hi3519.txt b/=
Documentation/devicetree/bindings/mfd/hi3519.txt
> >>>> new file mode 100644
> >>>> index 0000000..115c5be
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/mfd/hi3519.txt
> >>>> @@ -0,0 +1,14 @@
> >>>> +* Hisilicon Hi3519 System Controller Block
> >>>> +
> >>>> +This bindings use the following binding:
> >>>> +Documentation/devicetree/bindings/mfd/syscon.txt
> >>>> +
> >>>> +Required properties:
> >>>> +- compatible: "hisilicon,hi3519-sysctrl".
> >>>> +- reg: the register region of this block
> >>>> +
> >>>> +Examples:
> >>>> +sysctrl: system-controller@12010000 {
> >>>> +	compatible =3D "hisilicon,hi3519-sysctrl", "syscon";
> >>>> +	reg =3D <0x12010000 0x1000>;
> >>>> +};
> >>>
> >>> There is no requirement (nor want) for binding documents where th=
e
> >>> given device is simply using highly generic bindings.  This just
> >>> amounts to churn.
> >>>
> >> This block is specific for Hi3519 SOC, and may has its own driver.
> >=20
> > Does it have its own driver currently?
> >=20
> Not yet.
> Arnd Bergmann and Rob Herring all suggested adding a specific compati=
ble string
> with the SOC name. This binding is just used for describing the compa=
tible string now.
> When more functions on hi3519 SOC are added later, the specific drive=
r will be also
> needed.

Save this binding until it has more functionality.  We here "I'll add
to this later" all too often.

> >> So I think it's better to keep this binding.
> >=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
