From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: only select PINCTRL_SUNXI for
 Allwinner platforms
Date: Wed, 01 Mar 2017 02:57:20 +0800
Message-ID: <608421488308240@web22h.yandex.ru>
References: <20170228172444.59655-1-icenowy@aosc.xyz>
	 <20170228172444.59655-2-icenowy@aosc.xyz> <c878ba53-a33a-e042-2d65-11f86a47b844@arm.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBEUQ27CQKGQEQB2S77Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <c878ba53-a33a-e042-2d65-11f86a47b844-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



01.03.2017, 02:17, "Andre Przywara" <andre.przywara-5wv7dgnIgG8@public.gmane.org>:
> Hi,
>
> On 28/02/17 17:24, Icenowy Zheng wrote:
>> =C2=A0As the pinctrl driver selecting is refactored in Kconfig file of
>> =C2=A0pinctrl-sunxi, now we can select only PINCTRL_SUNXI for Allwinner
>> =C2=A0platform, and the default value of several pinctrl drivers useful =
on
>> =C2=A0ARM64 Allwinner SoCs will become Y.
>>
>> =C2=A0Drop the select of per-SoC pinctrl choices, but select PINCTRL_SUN=
XI.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0=C2=A0arch/arm64/Kconfig.platforms | 2 +-
>> =C2=A0=C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> =C2=A0diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.pla=
tforms
>> =C2=A0index 129cc5ae4091..f6db2a938b1e 100644
>> =C2=A0--- a/arch/arm64/Kconfig.platforms
>> =C2=A0+++ b/arch/arm64/Kconfig.platforms
>> =C2=A0@@ -4,7 +4,7 @@ config ARCH_SUNXI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Allwin=
ner sunxi 64-bit SoC Family"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select GENER=
IC_IRQ_CHIP
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select PINCT=
RL
>> =C2=A0- select PINCTRL_SUN50I_A64
>> =C2=A0+ select PINCTRL_SUNXI
>
> Why do we need to add this generic PINCTRL_SUNXI here? This is selected
> already by the SoC specific PINCTRL symbols (see your previous patch).
>
> Cheers,
> Andre.

Oh yes... You're right...

>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
This enables support for Allwinner sunxi based SoCs like the A64.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
