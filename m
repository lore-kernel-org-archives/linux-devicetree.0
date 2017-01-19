From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCHv4 3/5] pinctrl: mvebu: pinctrl driver for 98DX3236 SoC
Date: Thu, 19 Jan 2017 21:12:02 +0000
Message-ID: <66c205acea6046978bf17e6d8fc1959f@svr-chch-ex1.atlnz.lc>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-4-chris.packham@alliedtelesis.co.nz>
 <2fca7ac2-9a88-19b1-28c5-5192b9c4a2bc@gmail.com>
 <9996b6a215f944e1a47fa6239d8de21f@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Kalyan Kinthada <Kalyan.Kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14/01/17 20:50, Chris Packham wrote:=0A=
> On 13/01/17 22:54, Sebastian Hesselbarth wrote:=0A=
>> On 13.01.2017 10:12, Chris Packham wrote:=0A=
>>> From: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>=0A=
>>>=0A=
>>> This pinctrl driver supports the 98DX3236, 98DX3336 and 98DX4251 SoCs=
=0A=
>>> from Marvell.=0A=
>>>=0A=
>>> Signed-off-by: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>=0A=
>>> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>=0A=
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>=0A=
>>> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=0A=
>>> ---=0A=
>>>=0A=
>>> Notes:=0A=
>>>     Changes in v2:=0A=
>>>     - include sdio support for the 98DX4251=0A=
>>>     Changes in v3:=0A=
>>>     - None=0A=
>>>     Changes in v4:=0A=
>>>     - Correct some discrepencies between binding and driver.=0A=
>>=0A=
>> Well, unfortunately I still see differences between the "gpio" in=0A=
>> the binding and "gpo" in the driver.=0A=
>>=0A=
>> Please go back to that list I sent you yesterday and fix them all.=0A=
>>=0A=
>=0A=
> I think you may have missed my initial reply [1]. Or I have missed your=
=0A=
> response to it. Long story short "gpo" is intentional because some of=0A=
> those pins can't be used as inputs. But if you still want me to change=0A=
> it I will.=0A=
>=0A=
> [1] - https://lkml.org/lkml/2017/1/12/117=0A=
>=0A=
=0A=
Hi Sebastian,=0A=
=0A=
Did you get a chance to consider this. Do you still want me to change =0A=
gpo -> gpio given the information above?=0A=
=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
