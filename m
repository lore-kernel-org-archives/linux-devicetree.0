From: xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 5/6] mfd: dt-bindings: add device tree bindings for
 Hi3519 sysctrl
Date: Tue, 12 Jan 2016 16:17:14 +0800
Message-ID: <5694B68A.6040300@huawei.com>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com>
 <1452219400-32478-6-git-send-email-xuejiancheng@huawei.com>
 <20160111054846.GD3331@x1> <56935EA8.4060801@huawei.com>
 <20160111085555.GE14104@x1> <5694584D.7040301@huawei.com>
 <20160112074107.GK19803@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160112074107.GK19803@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Lee,

On 2016/1/12 15:41, Lee Jones wrote:
> On Tue, 12 Jan 2016, xuejiancheng wrote:
>=20
>>
>>
>> On 2016/1/11 16:55, Lee Jones wrote:
>>> On Mon, 11 Jan 2016, xuejiancheng wrote:
>>>> On 2016/1/11 13:48, Lee Jones wrote:
>>>>> On Fri, 08 Jan 2016, Jiancheng Xue wrote:
>>>>>
>>>>>> Add device tree bindings for Hi3519 system controller.
>>>>>>
>>>>>> Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/mfd/hi3519.txt | 14 +++++++++=
+++++
>>>>>>  1 file changed, 14 insertions(+)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/hi3519=
=2Etxt
>>>>>
>>>>> I have this patch, but none of the others in the set, thus I am
>>>>> lacking context.
>>>>>
>>>> I can forward other patches in the set to you. Thank you.
>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/hi3519.txt b/=
Documentation/devicetree/bindings/mfd/hi3519.txt
>>>>>> new file mode 100644
>>>>>> index 0000000..115c5be
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/mfd/hi3519.txt
>>>>>> @@ -0,0 +1,14 @@
>>>>>> +* Hisilicon Hi3519 System Controller Block
>>>>>> +
>>>>>> +This bindings use the following binding:
>>>>>> +Documentation/devicetree/bindings/mfd/syscon.txt
>>>>>> +
>>>>>> +Required properties:
>>>>>> +- compatible: "hisilicon,hi3519-sysctrl".
>>>>>> +- reg: the register region of this block
>>>>>> +
>>>>>> +Examples:
>>>>>> +sysctrl: system-controller@12010000 {
>>>>>> +	compatible =3D "hisilicon,hi3519-sysctrl", "syscon";
>>>>>> +	reg =3D <0x12010000 0x1000>;
>>>>>> +};
>>>>>
>>>>> There is no requirement (nor want) for binding documents where th=
e
>>>>> given device is simply using highly generic bindings.  This just
>>>>> amounts to churn.
>>>>>
>>>> This block is specific for Hi3519 SOC, and may has its own driver.
>>>
>>> Does it have its own driver currently?
>>>
>> Not yet.
>> Arnd Bergmann and Rob Herring all suggested adding a specific compat=
ible string
>> with the SOC name. This binding is just used for describing the comp=
atible string now.
>> When more functions on hi3519 SOC are added later, the specific driv=
er will be also
>> needed.
>=20
> Save this binding until it has more functionality.  We here "I'll add
> to this later" all too often.
>=20

In the hi3519.dtsi file, there is a system-controller device node descr=
ibed like below:
sysctrl: system-controller@12010000 {
	compatible =3D "hisilicon,hi3519-sysctrl", "syscon";
	reg =3D <0x12010000 0x1000>;
};
Do you mean that I should remove "hisilicon,hi3519-sysctrl" and just us=
e "syscon" as the
compatible string?=E3=80=80
If I want to add "hisilicon,hi3519-sysctrl" for hi3519. where should I =
put this binding?
Could you give some suggestions?  Thank you very much!

>>>> So I think it's better to keep this binding.
>>>
>>
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
