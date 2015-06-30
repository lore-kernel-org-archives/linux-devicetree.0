From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: Enable UART0 for SmartRG SR-400AC
Date: Wed, 01 Jul 2015 00:04:55 +0200
Message-ID: <55931287.4040609@hauke-m.de>
References: <1435103504-28592-1-git-send-email-f.fainelli@gmail.com> <CACna6rzJE8Gzrwvj+nCw=qCRho=6nZ+k1h_tFQLhNZvf5zWTDg@mail.gmail.com> <558F500C.6040004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558F500C.6040004-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2s=?= =?UTF-8?B?aQ==?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/28/2015 03:38 AM, Florian Fainelli wrote:
> Le 06/27/15 15:08, Rafa=C5=82 Mi=C5=82ecki a =C3=A9crit :
>> On 24 June 2015 at 01:51, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
>>> Enable the use of UART0 by overriding its default status property.
>>>
>>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts b/arch/a=
rm/boot/dts/bcm4708-smartrg-sr400ac.dts
>>> index d6a033b97c70..64a5e8ab65e0 100644
>>> --- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
>>> +++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
>>> @@ -118,3 +118,7 @@
>>>                 };
>>>         };
>>>  };
>>> +
>>> +&uart0 {
>>> +       status =3D "okay";
>>> +};
>>
>> We have many more changes like this in OpenWrt, I just didn't upstre=
am
>> them because of current chipcommonA state.
>>
>> It was added before we got "brcm,bus-axi" and I believe Hauke wanted
>> move it to the "correct" place at some point. Since UART is part of
>> ChipCommon device and ChipCommon is part of "brcm,bus-axi",.I guess =
we
>> should add UARTs as a ChipCommon device subnodes. We already have
>> chipcommon: chipcommon@0 {
>>         reg =3D <0x00000000 0x1000>;
>>
>>         gpio-controller;
>>         #gpio-cells =3D <2>;
>> };
>> , is it possible to move UARTs there?

I added it at the beginning of the port so I have serial, even without
adding support for bcma. I haven't look at that part later, but it
should go into the chipcommon part. Thats for the patches.

>>
>> I'm not sure if this UART cleanup should block your change. I guess =
it
>> depends on the way it'll finally look like.
>=20
> I do not think it will, see below:
>=20
>>
>> I'm also wondering: is there any preference between overwriting stat=
us
>> with something like
>> &uart0 { };
>> and
>> chipcommonA {
>>     uart0: serial@0300 { };
>> };
>> ? I don't know DT that well, just asking.
>=20
> An alias can be located pretty much anywhere in the DTS as long as th=
e
> name is unique, which is why I took this approach, because I do not h=
ave
> to do something like this and need to know the full depth of the tree=
:
>=20
> foo0 {
> 	bar0 {
> 		baz0 {
> 			status =3D "okay";
> 		};
> 	};
> };
>=20
> This is both more compact, and more robust to re-parenting the UART0
> node in case you ever wanted to do it in the future.
>=20
> I will happily fix the other DTSes to use that convention if we agree
> this is the route to take.

I haven't used that earlier because I did not know of this feature. I
think Rafa=C5=82 already did or is currently doing this steps.

Hauke

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
