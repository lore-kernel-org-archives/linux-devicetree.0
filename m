From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: sun8i: r40: add USB host port
 nodes for R40
Date: Tue, 10 Oct 2017 07:24:28 +0800
Message-ID: <55B35500-67FC-40AA-9A07-98C843DE55B3@aosc.io>
References: <20171008042906.46779-1-icenowy@aosc.io> <20171008042906.46779-3-icenowy@aosc.io> <20171009210340.ak6wo3vqnwj4gom4@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBNUK6DHAKGQEBKS26SA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171009210340.ak6wo3vqnwj4gom4-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B410=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=885=
:03:40, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0=
:
>On Sun, Oct 08, 2017 at 04:29:02AM +0000, Icenowy Zheng wrote:
>> From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>=20
>> Allwinner R40 SoC features a USB OTG port and two USB HOST ports.
>>=20
>> Add support for the host ports in the DTSI file.
>>=20
>> The OTG controller still cannot work with existing compatibles, and
>needs
>> more investigation. So it's not added yet.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-r40.dtsi | 78
>++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 78 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi
>b/arch/arm/boot/dts/sun8i-r40.dtsi
>> index d5a6745409ae..f6c917cbbaac 100644
>> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
>> @@ -173,6 +173,84 @@
>>  			#size-cells =3D <0>;
>>  		};
>> =20
>> +		usbphy: phy@1c13400 {
>> +			compatible =3D "allwinner,sun8i-r40-usb-phy";
>> +			reg =3D <0x01c13400 0x14>,
>> +			      <0x01c14800 0x4>,
>> +			      <0x01c19800 0x4>,
>> +			      <0x01c1c800 0x4>;
>> +			reg-names =3D "phy_ctrl",
>> +				    "pmu0",
>> +				    "pmu1",
>> +				    "pmu2";
>> +			clocks =3D <&ccu CLK_USB_PHY0>,
>> +				 <&ccu CLK_USB_PHY1>,
>> +				 <&ccu CLK_USB_PHY2>;
>> +			clock-names =3D "usb0_phy",
>> +				      "usb1_phy",
>> +				      "usb2_phy";
>> +			resets =3D <&ccu RST_USB_PHY0>,
>> +				 <&ccu RST_USB_PHY1>,
>> +				 <&ccu RST_USB_PHY2>;
>> +			reset-names =3D "usb0_reset",
>> +				      "usb1_reset",
>> +				      "usb2_reset";
>> +			status =3D "disabled";
>> +			#phy-cells =3D <1>;
>> +		};
>> +
>> +		ehci1: usb@1c19000 {
>> +			compatible =3D "allwinner,sun8i-r40-ehci", "generic-ehci";
>> +			reg =3D <0x01c19000 0x100>;
>
>What is the actual size here?

The OHCI/EHCI/PHY-PHY three parts are listed in the user manual
as one MMIO zone.

The size can be at most 0x400, as the OHCI is at offset 0x400.

>
>> +			interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&ccu CLK_BUS_OHCI1>,
>> +				 <&ccu CLK_BUS_EHCI1>,
>> +				 <&ccu CLK_USB_OHCI1>;
>> +			resets =3D <&ccu RST_BUS_OHCI1>,
>> +				 <&ccu RST_BUS_EHCI1>;
>
>Why do you need to take the OHCI resources too?

AW's strange design -- without OHCI resources taken EHCI
won't work.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
