From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: hip04: NAND controller support
Date: Fri, 24 Oct 2014 14:54:52 +0800
Message-ID: <5449F7BC.2020707@gmail.com>
References: <1414052649-17868-1-git-send-email-wangzhou.bry@gmail.com> <CAN1soZyCojPe8HYQQqrPj7e84TrhTsQpupMqf5semZDn3NabCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1soZyCojPe8HYQQqrPj7e84TrhTsQpupMqf5semZDn3NabCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B410=E6=9C=8823=E6=97=A5 17:32, Haojian Zhuang wrote:
> On Thu, Oct 23, 2014 at 4:24 PM, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
>> This patch adds dts support of NAND flash controller for Hisilicon S=
oc Hip04.
>> The patch is based on v3.18-rc1. I have tested that NAND flash contr=
oller
>> works fine in Hip04 D01 board.
>>
>> Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/hip04.dtsi |   30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.=
dtsi
>> index 93b6c90..642a160 100644
>> --- a/arch/arm/boot/dts/hip04.dtsi
>> +++ b/arch/arm/boot/dts/hip04.dtsi
>> @@ -263,5 +263,35 @@
>>                          interrupts =3D <0 372 4>;
>>                  };
>>
>> +               nand: nand@4020000 {
>> +                       compatible =3D "hisilicon,504-nfc";
>> +                       reg =3D <0x4020000 0x10000>, <0x5000000 0x10=
00>;
>> +                       interrupts =3D <0 379 4>;
>> +                       nand-bus-width =3D <8>;
>> +                       nand-ecc-mode =3D "none";
>> +                       hisi,nand-ecc-bits =3D <0>;
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <1>;
>> +
>> +                       partition@0 {
>> +                               label =3D "nand_text";
>> +                               reg =3D <0x00000000 0x00400000>;
>> +                       };
>> +
>> +                       partition@00400000 {
>> +                               label =3D "nand_monitor";
>> +                               reg =3D <0x00400000 0x00400000>;
>> +                       };
>> +
>> +                       partition@00800000 {
>> +                               label =3D "nand_kernel";
>> +                               reg =3D <0x00800000 0x00800000>;
>> +                       };
>> +
>> +                       partition@01000000 {
>> +                               label =3D "nand_fs";
>> +                               reg =3D <0x01000000 0x1f000000>;
>> +                       };
>
> Partitions are different on different boards. But nand controller is
> same on each chip. You
> should define nand controller in soc dtsi file, and define partition
> in board dts file.
>

My mistake. I will move the partition information to board dts file.
Thanks a lot, Haojian.

Kind Regards
Zhou Wang
> Regards
> Haojian
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
