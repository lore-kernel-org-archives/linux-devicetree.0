From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: phy: add binding for
 Allwinner USB3 PHY
Date: Thu, 12 Jul 2018 00:19:28 +0800
Message-ID: <C01136F1-594C-4459-B9C6-6E0434855234@aosc.io>
References: <20180706153805.25842-1-icenowy@aosc.io> <20180706153805.25842-7-icenowy@aosc.io> <20180711161356.GA4685@rob-hp-laptop>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBPO4TDNAKGQEVAWJLQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180711161356.GA4685@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=8812=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=8812=
:13:56, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Jul 06, 2018 at 11:38:02PM +0800, Icenowy Zheng wrote:
>> The new Allwinner H6 SoC contains a USB3 PHY that is wired to the
>> external USB3 pins of the SoC.
>>=20
>> Add a device tree binding for the PHY.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Splitted from the PHY driver patch in v1.
>>=20
>>  .../bindings/phy/sun50i-usb3-phy.txt          | 24
>+++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644
>Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
>>=20
>> diff --git
>a/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
>b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
>> new file mode 100644
>> index 000000000000..912d55f9f69d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
>> @@ -0,0 +1,24 @@
>> +Allwinner sun50i USB3 PHY
>> +-----------------------
>> +
>> +Required properties:
>> +- compatible : should be one of
>> +  * allwinner,sun60i-h6-usb3-phy
>> +- reg : a list of offset + length pairs
>> +- #phy-cells : from the generic phy bindings, must be 0
>> +- clocks : phandle + clock specifier for the phy clock
>> +- resets : phandle + reset specifier for the phy reset
>> +
>> +Optional Properties:
>> +- phy-supply : from the generic phy bindings, a phandle to a
>regulator that
>> +	       provides power to VBUS.
>
>Power to the phy or Vbus? If the latter only, then this property should
>
>be elsewhere (like a connector node).

I don't think there's connector nodes for USB ports now.

And by checking existed device trees, use phy-supply on USB
phy is common. It's seen on Meson GXBB, RK3399 and Hi6220
in arch/arm64/boot/dts.

>
>> +
>> +Example:
>> +	usb3phy: phy@5210000 {
>> +		compatible =3D "allwinner,sun50i-h6-usb3-phy";
>> +		reg =3D <0x5210000 0x10000>;
>> +		clocks =3D <&ccu CLK_USB_PHY1>;
>> +		resets =3D <&ccu RST_USB_PHY1>;
>> +		#phy-cells =3D <0>;
>> +		status =3D "disabled";
>> +	};
>> --=20
>> 2.17.1
>>=20
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree"
>in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
