From: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Add mdio node to ethernet node
Date: Mon, 21 Mar 2016 09:32:58 +0100
Message-ID: <CAOf5uw=jUeh0YDQu2SFjMsRzVH-WaXeZoq5mAbAQwD_dwttjnA@mail.gmail.com>
References: <1458300056-6174-1-git-send-email-tomeu.vizoso@collabora.com>
	<56EC744F.90308@suse.de>
	<CAAObsKBXuTw37YJb+Fhq_NgZw2rjPQ14phF1yRG+N2mEu9uBmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKBXuTw37YJb+Fhq_NgZw2rjPQ14phF1yRG+N2mEu9uBmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi

On Mon, Mar 21, 2016 at 9:23 AM, Tomeu Vizoso
<tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> On 18 March 2016 at 22:34, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> wro=
te:
>> Am 18.03.2016 um 12:20 schrieb Tomeu Vizoso:
>>> So the dwmac device manages to probe again.
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> Fixes: 88f8b1bb41c6 ("stmmac: Fix 'eth0: No PHY found' regression")
>>> ---
>>>  arch/arm/boot/dts/rk3288-rock2-som.dtsi | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/rk3288-rock2-som.dtsi b/arch/arm/boo=
t/dts/rk3288-rock2-som.dtsi
>>> index 1ece66f3e162..4ba7ddecb478 100644
>>> --- a/arch/arm/boot/dts/rk3288-rock2-som.dtsi
>>> +++ b/arch/arm/boot/dts/rk3288-rock2-som.dtsi
>>> @@ -101,6 +101,14 @@
>>>       snps,reset-delays-us =3D <0 10000 30000>;
>>>       rx_delay =3D <0x10>;
>>>       tx_delay =3D <0x30>;
>>> +     mdio0 {
>>> +             #address-cells =3D <1>;
>>> +             #size-cells =3D <0>;
>>> +             compatible =3D "snps,dwmac-mdio";
>>> +             ethphy1: ethernet-phy@1 {
>>> +                     reg =3D <1>;
>>> +             };
>>> +     };
>>
>> This is a) ugly for lack of white lines in between, b) unnecessary s=
ince
>> this is being fixed in the stmmac driver where it will benefit more =
than
>> just this one SoM.
>
> So is this redundant information, or just not necessary with the
> present kernel driver because of some assumption in its current
> implementation?
>

I have the same fix on my firefly tree. Look likes correct and describe=
 the
connection

Michael

> Thanks,
>
> Tomeu
>
>> Regards,
>> Andreas
>>
>>>  };
>>>
>>>  &i2c0 {
>>
>> --
>> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 =
(AG N=C3=BCrnberg)
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip



--=20
| Michael Nazzareno Trimarchi                     Amarula Solutions BV =
|
| COO  -  Founder                                      Cruquiuskade 47 =
|
| +31(0)851119172                                 Amsterdam 1018 AM NL =
|
|                  [`as] http://www.amarulasolutions.com               =
|
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
