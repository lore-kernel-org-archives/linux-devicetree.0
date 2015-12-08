From: xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Tue, 8 Dec 2015 11:54:51 +0800
Message-ID: <5666548B.90502@huawei.com>
References: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com>
 <1728470.0OiiXMcl88@wuerfel> <5660FA2E.6040601@huawei.com>
 <3047121.2z9SCS5Au2@wuerfel> <56652912.80308@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56652912.80308-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2015/12/7 14:37, xuejiancheng wrote:
>=20
> On 2015/12/4 18:49, Arnd Bergmann wrote:
>> On Friday 04 December 2015 10:27:58 xuejiancheng wrote:
>>>>
>>>>> +            sysctrl: system-controller@12020000 {
>>>>> +                    compatible =3D "hisilicon,sysctrl";
>>>>> +                    reg =3D <0x12020000 0x1000>;
>>>>> +                    reboot-offset =3D <0x4>;
>>>>> +            };
>>>>
>>>> Is this one identical to the one in hip04?
>>>>
>>>> If not, pick a new unique compatible string
>>>
>>> Yes. It's compatible with the one in hip04.
>>
>> Ok, we should add a compatible string for that then, as the hip04 ap=
parently
>> has a slightly different layout from hip01.
>>
>> Can you add a separate patch to clarify the existing hisilicon,sysct=
rl nodes?
>>
>> It look like hi3620 accidentally uses the same string as hip04 alrea=
dy
>> but is actually a bit different.
>>
>> Maybe split out the sysctrl binding from
>> Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt, as it=
 has
>> you already have a couple of those, and it's not clear how they rela=
te
>> to one another.
>>
>> If we introduce a string for all hip04 compatible sysctrl devices, w=
e should
>> document that and use it consistently, so hi3519 becomes
>>
>> 	compatible =3D "hisilicon,hi3519-sysctrl", "hisilicon,hip04-sysctrl=
", "hisilicon,sysctrl";
>>
>> but I'd clarify in the binding documentation that "hisilicon,sysctrl=
" should
>> only be used for hip04 and hi3519 but not the others.
>>
>> As this seems to be a standard part, we can also think about making =
a
>> high-level driver for in in drivers/soc rather than relying on the s=
yscon
>> driver which we tend to use more for one-off devices with random reg=
ister
>> layouts.
>>
>    Sorry. I didn't understand your meaning well and maybe I gave you =
a wrong description.
> Please allow me to clarify it again.
>    The "sysctrl" nodes here is just used for the "reboot" function. I=
t is corresponding to
> the driver "drivers/power/reset/hisi-reboot.c". The compatible string=
 in the driver is
> "hisilicon,sysctrl".
>    The layout of this block is also different from the one in HiP04.

I'll use "syscon" as the compatible value for sysctrl node and "syscon-=
reboot" for a new reboot node.

Thank you.

>=20
>>>>> +
>>>>> +            crg: crg@12010000 {
>>>>> +                    compatible =3D "hisilicon,hi3519-crg";
>>>>
>>>>
>>>> what is a "crg"? Is there a standard name for these?
>>>
>>> The "crg" means Clock and Reset Generator. It's a block which suppl=
ies clock
>>> and reset signals for other modules in the chip. I used "hi3519-clo=
ck"
>>> in last version patch. Rob Herring suggested that it's better to us=
e "hi3519-crg"
>>> as the compatible string if it's a whole block.
>>>
>>> what about writing like this=EF=BC=9F
>>>
>>> crg: clock-reset-controller@12010000 {
>>>         compatible =3D "hisilicon,hi3519-crg";
>>>         }
>>>
>>
>> Ok, that's better.
>>
>> 	Arnd
>>
>> .
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
