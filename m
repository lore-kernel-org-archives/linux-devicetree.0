From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 05/11] ARM: dts: zynq: Add QSPI for Parallella
Date: Fri, 25 Jul 2014 12:43:09 +0200
Message-ID: <53D234BD.2040005@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-6-git-send-email-afaerber@suse.de> <ddb38ce5-9e31-4c94-967c-7784c7fba75c@BN1BFFO11FD028.protection.gbl> <53D20E5B.9070501@monstr.eu> <53D21887.2020305@suse.de> <53D2258B.9000609@xilinx.com> <7aabd35a-0b4a-4d03-9976-ef3926929ddc@BL2FFO11FD027.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7aabd35a-0b4a-4d03-9976-ef3926929ddc-xjCwUguQ558+FoeucOxqwGYJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harini Katakam <harini.katakam-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org" <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Harini,

Am 25.07.2014 12:31, schrieb Harini Katakam:
>> -----Original Message-----
>> From: Michal Simek [mailto:michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org]
>> Sent: Friday, July 25, 2014 3:08 PM
>> To: Andreas F=C3=A4rber; monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org; Soren Brinkmann
>> Cc: Harini Katakam; Michal Simek; Andreas Olofsson; Matteo Vit; Sean
>> Rickerd; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM9gwCICpdfJQ@public.gmane.org=
d.org;
>> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Rob Herring; Pawel Moll; Mark Rutland;=
 Ian
>> Campbell; Kumar Gala; Russell King
>> Subject: Re: [PATCH v2 05/11] ARM: dts: zynq: Add QSPI for Parallell=
a
>>
>> On 07/25/2014 10:42 AM, Andreas F=C3=A4rber wrote:
>>> Am 25.07.2014 09:59, schrieb Michal Simek:
>>>> On 07/25/2014 01:18 AM, S=C3=B6ren Brinkmann wrote:
>>>>> On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
>>>>>> Prepare SPI0 and SPI1 while at it.
>>>
>>>> Patch subject is incorrect. You are adding SPI and QSPI.
>>>
>>> Yes, it originally added only QSPI, but I considered it a good deed=
 to
>>> add SPI as well while already reading that part of the TRM. :)
>>>
>>>>>>
>>>>>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> --- v2: Ne=
w
>>>>>>
>>>>>> arch/arm/boot/dts/zynq-7000.dtsi      | 37
>>>>>> +++++++++++++++++++++++++++++++++++
>>>>>> arch/arm/boot/dts/zynq-parallella.dts |  4 ++++ 2 files
>>>>>> changed, 41 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi
>>>>>> b/arch/arm/boot/dts/zynq-7000.dtsi index 8fd826a..eed3df0
>>>>>> 100644 --- a/arch/arm/boot/dts/zynq-7000.dtsi +++
>>>>>> b/arch/arm/boot/dts/zynq-7000.dtsi @@ -122,6 +122,30 @@
>>>>>> interrupts =3D <0 50 4>; };
>>>>>>
>>>>>> +		spi0: spi@e0006000 { +			compatible =3D
>> "xlnx,zynq-spi-r1p6";
>>>>>> +			reg =3D <0xe0006000 0x1000>; +			status
>> =3D "disabled"; +
>>>>>> interrupt-parent =3D <&intc>; +			interrupts =3D <0 26 4>;
>> +
>>>>>> clocks =3D <&clkc 25>, <&clkc 34>; +			clock-names =3D
>> "ref_clk",
>>>>>> "pclk"; +			#address-cells =3D <1>; +			#size-
>> cells =3D <0>; +		};
>>>>>> + +		spi1: spi@e0007000 { +			compatible =3D
>>>>>> "xlnx,zynq-spi-r1p6"; +			reg =3D <0xe0007000 0x1000>; +
>> 			status
>>>>>> =3D "disabled"; +			interrupt-parent =3D <&intc>; +
>> 		interrupts =3D
>>>>>> <0 49 4>; +			clocks =3D <&clkc 26>, <&clkc 35>; +
>> 		clock-names
>>>>>> =3D "ref_clk", "pclk"; +			#address-cells =3D <1>; +
>> 		#size-cells
>>>>>> =3D <0>; +		}; +
>>>>> Until here things look good.
>>>>>
>>>>>> gem0: ethernet@e000b000 { compatible =3D "cdns,gem"; reg =3D
>>>>>> <0xe000b000 0x4000>; @@ -140,6 +164,19 @@ clock-names =3D "pclk"=
,
>>>>>> "hclk", "tx_clk"; };
>>>>>>
>>>>>> +		qspi: qspi@e000d000 { +			compatible =3D
>>>>>> "xlnx,zynq-spi-r1p6"; +			reg =3D <0xe000d000 0x1000>; +
>> 			status
>>>>>> =3D "disabled"; +			interrupt-parent =3D <&intc>; +
>> 		interrupts =3D
>>>>>> <0 19 4>; +			clocks =3D <&clkc 10>, <&clkc 43>; +
>> 		clock-names
>>>>>> =3D "ref_clk", "pclk"; +			num-cs =3D <1>; +
>> 	#address-cells =3D
>>>>>> <1>; +			#size-cells =3D <0>; +		}; +
>>>>> I'm not sure what the status of this driver is. I think QSPI is
>>>>> still under review on the mailing lists and I don't think we
>>>>> should add this yet.
>>>
>>>> Driver for qspi is not in the mainline yet but it doesn't mean tha=
t
>>>> this fragment won't work. Harini: Can you please correct me if I a=
m
>>>> wrong?
>>>
>=20
> It can be added but it will have to be disabled as there is no qspi d=
river
> at the moment in mainline.

Did you read the actual patch? It's using the upstream SPI driver for
now, and it's disabled for anything but the new board I'm adding.

https://patchwork.kernel.org/patch/4620201/

Wouldn't a dedicated QSPI driver only result in a compatible string
being prepended before the SPI compatible string?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
