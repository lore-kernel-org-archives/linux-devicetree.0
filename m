From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 8/9] arm64: allwinner: dts: h6: add USB3
 device nodes
Date: Sat, 07 Jul 2018 11:37:52 +0800
Message-ID: <76682488-74B8-4CEE-ACD5-29C667C438AE@aosc.io>
References: <20180706153805.25842-1-icenowy@aosc.io> <20180706153805.25842-9-icenowy@aosc.io> <CAGb2v67=FeGJ6PJLsru5ScXdTyLdCczQ7BNRmOnh-+4g7iCFqg@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBHHLQDNAKGQENHZXBTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67=FeGJ6PJLsru5ScXdTyLdCczQ7BNRmOnh-+4g7iCFqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=8811:=
35:22, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Jul 6, 2018 at 11:38 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> Allwinner H6 SoC features USB3 functionality, with a DWC3 controller
>and
>> a custom PHY.
>>
>> Add device tree nodes for them.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v2:
>> - Rebased on top of the USB2 support patch.
>> - Dropped the dwc3-of-simple device.
>>
>>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 24
>++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> index 62fc0f5e10ba..6738e97ee37f 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> @@ -229,6 +229,30 @@
>>                         status =3D "disabled";
>>                 };
>>
>> +               dwc3: dwc3 {
>> +                       compatible =3D "snps,dwc3";
>> +                       reg =3D <0x5200000 0x10000>;
>> +                       interrupts =3D <GIC_SPI 26
>IRQ_TYPE_LEVEL_HIGH>;
>> +                       /* The only clock is shared. */
>> +                       clocks =3D <&ccu CLK_BUS_XHCI>,
>> +                                <&ccu CLK_BUS_XHCI>,
>> +                                <&ccu CLK_BUS_XHCI>;
>> +                       clock-names =3D "ref", "bus_early", "suspend";
>
>The diagram in the user manual also shows the low speed 32k oscillator
>being fed into DWC3. Maybe someone with more knowledge of what the IP
>block expects can give us a clue about which one of these it is.

If possible, I think it's suspend clock.

I have checked RK3399 clk tree and USB3 ref is just a gate
on 24M osc, and bus clock is surely CLK_BUS_XHCI.

>
>ChenYu
>
>> +                       resets =3D <&ccu RST_BUS_XHCI>;
>> +                       /*
>> +                        * The datasheet of the chip doesn't declare
>the
>> +                        * peripheral function, and there's no boards
>known
>> +                        * to have a USB Type-B port routed to the
>port.
>> +                        * In addition, no one has tested the
>peripheral
>> +                        * function yet.
>> +                        * So set the dr_mode to "host" in the DTSI
>file.
>> +                        */
>> +                       dr_mode =3D "host";
>> +                       phys =3D <&usb3phy>;
>> +                       phy-names =3D "usb3-phy";
>> +                       status =3D "disabled";
>> +               };
>> +
>>                 usb3phy: phy@5210000 {
>>                         compatible =3D "allwinner,sun50i-h6-usb3-phy";
>>                         reg =3D <0x5210000 0x10000>;
>> --
>> 2.17.1
>>
>> --
>> You received this message because you are subscribed to the Google
>Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it,
>send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
