From: xuejiancheng <xuejiancheng@huawei.com>
Subject: Re: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Mon, 7 Dec 2015 14:37:06 +0800
Message-ID: <56652912.80308@huawei.com>
References: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com>
 <1728470.0OiiXMcl88@wuerfel> <5660FA2E.6040601@huawei.com>
 <3047121.2z9SCS5Au2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3047121.2z9SCS5Au2@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, suwenping@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, gaofei@hisilicon.com, ml.yang@hisilicon.com, yanghongwei@hisilicon.com
List-Id: devicetree@vger.kernel.org


On 2015/12/4 18:49, Arnd Bergmann wrote:
> On Friday 04 December 2015 10:27:58 xuejiancheng wrote:
>>>
>>>> +            sysctrl: system-controller@12020000 {
>>>> +                    compatible =3D "hisilicon,sysctrl";
>>>> +                    reg =3D <0x12020000 0x1000>;
>>>> +                    reboot-offset =3D <0x4>;
>>>> +            };
>>>
>>> Is this one identical to the one in hip04?
>>>
>>> If not, pick a new unique compatible string
>>
>> Yes. It's compatible with the one in hip04.
>=20
> Ok, we should add a compatible string for that then, as the hip04 app=
arently
> has a slightly different layout from hip01.
>=20
> Can you add a separate patch to clarify the existing hisilicon,sysctr=
l nodes?
>=20
> It look like hi3620 accidentally uses the same string as hip04 alread=
y
> but is actually a bit different.
>=20
> Maybe split out the sysctrl binding from
> Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt, as it =
has
> you already have a couple of those, and it's not clear how they relat=
e
> to one another.
>=20
> If we introduce a string for all hip04 compatible sysctrl devices, we=
 should
> document that and use it consistently, so hi3519 becomes
>=20
> 	compatible =3D "hisilicon,hi3519-sysctrl", "hisilicon,hip04-sysctrl"=
, "hisilicon,sysctrl";
>=20
> but I'd clarify in the binding documentation that "hisilicon,sysctrl"=
 should
> only be used for hip04 and hi3519 but not the others.
>=20
> As this seems to be a standard part, we can also think about making a
> high-level driver for in in drivers/soc rather than relying on the sy=
scon
> driver which we tend to use more for one-off devices with random regi=
ster
> layouts.
>=20
   Sorry. I didn't understand your meaning well and maybe I gave you a =
wrong description.
Please allow me to clarify it again.
   The "sysctrl" nodes here is just used for the "reboot" function. It =
is corresponding to
the driver "drivers/power/reset/hisi-reboot.c". The compatible string i=
n the driver is
"hisilicon,sysctrl".
   The layout of this block is also different from the one in HiP04.

>>>> +
>>>> +            crg: crg@12010000 {
>>>> +                    compatible =3D "hisilicon,hi3519-crg";
>>>
>>>
>>> what is a "crg"? Is there a standard name for these?
>>
>> The "crg" means Clock and Reset Generator. It's a block which suppli=
es clock
>> and reset signals for other modules in the chip. I used "hi3519-cloc=
k"
>> in last version patch. Rob Herring suggested that it's better to use=
 "hi3519-crg"
>> as the compatible string if it's a whole block.
>>
>> what about writing like this=EF=BC=9F
>>
>> crg: clock-reset-controller@12010000 {
>>         compatible =3D "hisilicon,hi3519-crg";
>>         }
>>
>=20
> Ok, that's better.
>=20
> 	Arnd
>=20
> .
>=20
