From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 3/9] arm64: allwinner: dts: h6: add
 USB2-related device nodes
Date: Sat, 07 Jul 2018 11:33:12 +0800
Message-ID: <01FABE3C-DA8F-4526-9A6C-C89BDA197316@aosc.io>
References: <20180706153805.25842-1-icenowy@aosc.io> <20180706153805.25842-4-icenowy@aosc.io> <CAGb2v663fgFQTHGCMmKwuf4RyW59YSbhtyr5nLBRRxakkEfRzw@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBFHJQDNAKGQEBMNUKSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v663fgFQTHGCMmKwuf4RyW59YSbhtyr5nLBRRxakkEfRzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=8811:=
31:39, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Jul 6, 2018 at 11:37 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> Allwinner H6 has two USB2 ports, one OTG and one host-only.
>>
>> Add device tree nodes related to them.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 90
>++++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> index c72da8cd9ef5..62fc0f5e10ba 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> @@ -174,6 +174,96 @@
>>                         status =3D "disabled";
>>                 };
>>
>> +               usb2otg: usb@5100000 {
>> +                       compatible =3D "allwinner,sun8i-a33-musb";
>> +                       reg =3D <0x05100000 0x0400>;
>> +                       clocks =3D <&ccu CLK_BUS_OTG>;
>> +                       resets =3D <&ccu RST_BUS_OTG>;
>> +                       interrupts =3D <GIC_SPI 23
>IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names =3D "mc";
>> +                       phys =3D <&usb2phy 0>;
>> +                       phy-names =3D "usb";
>> +                       extcon =3D <&usb2phy 0>;
>> +                       status =3D "disabled";
>> +               };
>> +
>> +               usb2phy: phy@5100400 {
>> +                       compatible =3D "allwinner,sun50i-h6-usb-phy";
>> +                       reg =3D <0x05100400 0x14>,
>> +                             <0x05101800 0x4>,
>> +                             <0x05311800 0x4>;
>> +                       reg-names =3D "phy_ctrl",
>> +                                   "pmu0",
>> +                                   "pmu3";
>> +                       clocks =3D <&ccu CLK_USB_PHY0>,
>> +                                <&ccu CLK_USB_PHY3>;
>> +                       clock-names =3D "usb0_phy",
>> +                                     "usb3_phy";
>> +                       resets =3D <&ccu RST_USB_PHY0>,
>> +                                <&ccu RST_USB_PHY3>;
>> +                       reset-names =3D "usb0_reset",
>> +                                     "usb3_reset";
>> +                       status =3D "disabled";
>> +                       #phy-cells =3D <1>;
>> +               };
>> +
>> +               ehci0: usb@5101000 {
>> +                       compatible =3D "allwinner,sun50i-h6-ehci",
>"generic-ehci";
>> +                       reg =3D <0x05101000 0x100>;
>> +                       interrupts =3D <GIC_SPI 24
>IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&ccu CLK_BUS_OHCI0>,
>> +                                <&ccu CLK_BUS_EHCI0>,
>> +                                <&ccu CLK_USB_OHCI0>;
>> +                       resets =3D <&ccu RST_BUS_OHCI0>,
>> +                                <&ccu RST_BUS_EHCI0>;
>> +                       status =3D "disabled";
>> +               };
>> +
>> +               ohci0: usb@5101400 {
>> +                       compatible =3D "allwinner,sun50i-h6-ohci",
>"generic-ohci";
>> +                       reg =3D <0x05101400 0x100>;
>> +                       interrupts =3D <GIC_SPI 25
>IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&ccu CLK_BUS_OHCI0>,
>> +                                <&ccu CLK_USB_OHCI0>;
>> +                       resets =3D <&ccu RST_BUS_OHCI0>;
>> +                       status =3D "disabled";
>> +               };
>> +
>> +               usb3phy: phy@5210000 {
>
>Maybe you should split this one out and put it in the USB 3.0 patch?

Sorry, -EREBASE.

>
>ChenYu
>
>> +                       compatible =3D "allwinner,sun50i-h6-usb3-phy";
>> +                       reg =3D <0x5210000 0x10000>;
>> +                       clocks =3D <&ccu CLK_USB_PHY1>;
>> +                       resets =3D <&ccu RST_USB_PHY1>;
>> +                       #phy-cells =3D <0>;
>> +                       status =3D "disabled";
>> +               };
>> +
>> +               ehci3: usb@5311000 {
>> +                       compatible =3D "allwinner,sun50i-h6-ehci",
>"generic-ehci";
>> +                       reg =3D <0x05311000 0x100>;
>> +                       interrupts =3D <GIC_SPI 28
>IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&ccu CLK_BUS_OHCI3>,
>> +                                <&ccu CLK_BUS_EHCI3>,
>> +                                <&ccu CLK_USB_OHCI3>;
>> +                       resets =3D <&ccu RST_BUS_OHCI3>,
>> +                                <&ccu RST_BUS_EHCI3>;
>> +                       phys =3D <&usb2phy 3>;
>> +                       phy-names =3D "usb";
>> +                       status =3D "disabled";
>> +               };
>> +
>> +               ohci3: usb@5311400 {
>> +                       compatible =3D "allwinner,sun50i-h6-ohci",
>"generic-ohci";
>> +                       reg =3D <0x05311400 0x100>;
>> +                       interrupts =3D <GIC_SPI 29
>IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&ccu CLK_BUS_OHCI3>,
>> +                                <&ccu CLK_USB_OHCI3>;
>> +                       resets =3D <&ccu RST_BUS_OHCI3>;
>> +                       phys =3D <&usb2phy 3>;
>> +                       phy-names =3D "usb";
>> +                       status =3D "disabled";
>> +               };
>> +
>>                 r_ccu: clock@7010000 {
>>                         compatible =3D "allwinner,sun50i-h6-r-ccu";
>>                         reg =3D <0x07010000 0x400>;
>> --
>> 2.17.1
>>
>> --
>> You received this message because you are subscribed to the Google
>Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it,
>send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
