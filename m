From: "Yankejian (Hackim Yim)" <yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND net-next] net: updates HNS config and documents
Date: Thu, 22 Oct 2015 10:51:19 +0800
Message-ID: <56284F27.4010109@huawei.com>
References: <1445308604-95860-1-git-send-email-yankejian@huawei.com>
 <CAL_JsqJ+4BK2KDX5+t6GGEYv3pPDc+crktiMqgu6QTZi7WDrxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ+4BK2KDX5+t6GGEYv3pPDc+crktiMqgu6QTZi7WDrxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: liguozhu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huangdaode <huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, lipeng321-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2015/10/22 9:26, Rob Herring =E5=86=99=E9=81=93:
> On Mon, Oct 19, 2015 at 9:36 PM, yankejian <yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wro=
te:
>> updates the bindings documents and dtsi file according to the review
>> comments from Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Signed-off-by: yankejian <yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: huangdaode <huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20

Thanks!

>> ---
>>  Documentation/devicetree/bindings/net/hisilicon-hns-mdio.txt | 2 +-
>>  arch/arm64/boot/dts/hisilicon/hip05_hns.dtsi                 | 8 ++=
+-----
>>  2 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/hisilicon-hns-mdi=
o.txt b/Documentation/devicetree/bindings/net/hisilicon-hns-mdio.txt
>> index 9940aa0..9c23fdf 100644
>> --- a/Documentation/devicetree/bindings/net/hisilicon-hns-mdio.txt
>> +++ b/Documentation/devicetree/bindings/net/hisilicon-hns-mdio.txt
>> @@ -12,7 +12,7 @@ Example:
>>           mdio@803c0000 {
>>                     #address-cells =3D <1>;
>>                     #size-cells =3D <0>;
>> -                   compatible =3D "hisilicon,mdio","hisilicon,hns-m=
dio";
>> +                   compatible =3D "hisilicon,hns-mdio","hisilicon,m=
dio";
>>                     reg =3D <0x0 0x803c0000 0x0 0x10000>;
>>
>>                     ethernet-phy@0 {
>> diff --git a/arch/arm64/boot/dts/hisilicon/hip05_hns.dtsi b/arch/arm=
64/boot/dts/hisilicon/hip05_hns.dtsi
>> index 3500586..606dd5a 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hip05_hns.dtsi
>> +++ b/arch/arm64/boot/dts/hisilicon/hip05_hns.dtsi
>> @@ -13,14 +13,12 @@ soc0: soc@000000000 {
>>                 reg =3D <0x0 0x803c0000 0x0 0x10000
>>                        0x0 0x80000000 0x0 0x10000>;
>>
>> -               soc0_phy4: ethernet-phy@4 {
>> +               soc0_phy0: ethernet-phy@0 {
>>                         reg =3D <0x0>;
>> -                       device_type =3D "ethernet-phy";
>>                         compatible =3D "ethernet-phy-ieee802.3-c22";
>>                 };
>> -               soc0_phy5: ethernet-phy@5 {
>> +               soc0_phy1: ethernet-phy@1 {
>>                         reg =3D <0x1>;
>> -                       device_type =3D "ethernet-phy";
>>                         compatible =3D "ethernet-phy-ieee802.3-c22";
>>                 };
>>         };
>> @@ -37,7 +35,7 @@ soc0: soc@000000000 {
>>                        0x0 0xc7000000 0x0 0x60000
>>                        >;
>>
>> -               phy-handle =3D <0 0 0 0 &soc0_phy4 &soc0_phy5 0 0>;
>> +               phy-handle =3D <0 0 0 0 &soc0_phy0 &soc0_phy1 0 0>;
>>                 interrupts =3D <
>>                         /* [14] ge fifo err 8 / xge 6**/
>>                         149 0x4 150 0x4 151 0x4 152 0x4
>> --
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree=
" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> .
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
