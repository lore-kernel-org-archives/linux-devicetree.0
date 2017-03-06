From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v7 6/6] arm64: dts: sunxi: add support for
 the Orange Pi PC 2 board
Date: Mon, 06 Mar 2017 18:47:01 +0800
Message-ID: <1690011488797221@web29m.yandex.ru>
References: <20170305233138.64574-1-icenowy@aosc.xyz>
	 <20170305233138.64574-7-icenowy@aosc.xyz> <20170306103729.y7tsj6dyydf2zmmr@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBJ746TCQKGQEKOQHKCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170306103729.y7tsj6dyydf2zmmr@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



06.03.2017, 18:37, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Mon, Mar 06, 2017 at 07:31:38AM +0800, Icenowy Zheng wrote:
>> =C2=A0From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>>
>> =C2=A0The Orange Pi PC 2 is a typical single board computer using the
>> =C2=A0Allwinner H5 SoC. Apart from the usual suspects it features three
>> =C2=A0separately driven USB ports and a Gigabit Ethernet port.
>> =C2=A0Also it has a SPI NOR flash soldered, from which the board can boo=
t
>> =C2=A0from. This enables the SBC to behave like a "real computer" with
>> =C2=A0built-in firmware.
>>
>> =C2=A0Add the board specific .dts file, which includes the H5 .dtsi and
>> =C2=A0enables the peripherals that we support so far.
>>
>> =C2=A0Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> =C2=A0[Icenowy: dropped all GPIO pinctrl nodes, change red LED gpio,
>> =C2=A0=C2=A0change MMC cd to active-low, rename some node names to preve=
nt
>> =C2=A0=C2=A0underscores]
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>
> And here your prefix should be "arm64: allwinner: h5:"

Is this a new standard to have SoC name in prefix?

>
> (This also applies to your previous patch).
>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
