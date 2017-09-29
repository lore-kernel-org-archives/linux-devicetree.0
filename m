From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: sun8i: Add basic dtsi file
 for Allwinner R40
Date: Fri, 29 Sep 2017 18:25:15 +0800
Message-ID: <7F10060D-6A37-4417-9E24-1BB007580126@aosc.io>
References: <20170928092543.45648-1-icenowy@aosc.io> <20170928092543.45648-2-icenowy@aosc.io> <20170928151103.ov3o5pn5h7inzzan@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBFV7XDHAKGQE7LFASKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170928151103.ov3o5pn5h7inzzan@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B49=E6=9C=8828=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8811=
:11:03, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0=
:
>Hi,
>
>On Thu, Sep 28, 2017 at 09:25:41AM +0000, Icenowy Zheng wrote:
>> +		/*
>> +		 * The max-frequency properties in all MMC controller nodes
>> +		 * are conservative values proven to work on Banana Pi M2
>> +		 * Ultra (the first community available R40 board).
>> +		 * As the board doesn't wire MMC3 out, the property is not
>> +		 * set in MMC3.
>> +		 * TODO: measure the accurate max frequency of the controllers.
>> +		 */
>> +		mmc0: mmc@1c0f000 {
>> +			compatible =3D "allwinner,sun8i-r40-mmc",
>> +				     "allwinner,sun50i-a64-mmc";
>> +			reg =3D <0x01c0f000 0x1000>;
>> +			clocks =3D <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
>> +			clock-names =3D "ahb", "mmc";
>> +			resets =3D <&ccu RST_BUS_MMC0>;
>> +			reset-names =3D "ahb";
>> +			pinctrl-0 =3D <&mmc0_pins>;
>> +			pinctrl-names =3D "default";
>> +			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>> +			max-frequency =3D <25000000>;
>> +			status =3D "disabled";
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +		};
>
>Sorry if it wasn't really clear, but my point was more than you should
>just drop the max-frequency property

Then set it in the boards' DTS?

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
