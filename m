From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: dts: hix5hd2: add wdg node
Date: Fri, 29 Aug 2014 16:12:54 +0800
Message-ID: <54003606.5090407@linaro.org>
References: <1409204060-9223-1-git-send-email-zhangfei.gao@linaro.org> <1409204060-9223-7-git-send-email-zhangfei.gao@linaro.org> <53FEF4A7.2040001@gmail.com> <20140828171228.GR14650@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140828171228.GR14650@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/29/2014 01:12 AM, Mark Rutland wrote:
> On Thu, Aug 28, 2014 at 10:21:43AM +0100, Dinh Nguyen wrote:
>>
>>
>> On 8/28/14, 12:34 AM, Zhangfei Gao wrote:
>>> Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>   arch/arm/boot/dts/hisi-x5hd2.dtsi |    9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/=
hisi-x5hd2.dtsi
>>> index 152f3ad..7b1cb53 100644
>>> --- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
>>> +++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
>>> @@ -365,6 +365,15 @@
>>>   				#interrupt-cells =3D <2>;
>>>   				status =3D "disabled";
>>>   			};
>>> +
>>> +			wdg0: wdg@a2c000 {
>>
>> A nit-pick here, but everybody else is using 'wdt' for a watchdog ti=
mer
>> node.

Sure=EF=BC=8Cwill change to
wdt0: watchdog@a2c000

>>
>>> +				compatible =3D "arm,sp805", "arm,primecell";
>>
>> I didn't see an entry for "arm,sp805" in Documentations, should ther=
e be
>> one?
>
> There probably should, yes. It looks like only the sp804 is documente=
d.
>
> Pawel, it looks like you were the first sp805,sp810 dt user. Care to =
put
> together a couple of documents? ;)
>

Yes, that would be great,
Not find bindings for drivers/watchdog/sp805_wdt.c.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
