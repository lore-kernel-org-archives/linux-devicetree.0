From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: update device tree
 binding for Allwinner PRCM CCUs
Date: Wed, 22 Mar 2017 02:22:22 +0800
Message-ID: <115431490120542@web34g.yandex.ru>
References: <20170315172808.64011-1-icenowy@aosc.xyz>
	 <20170315172808.64011-2-icenowy@aosc.xyz> <20170321074117.vdfjynauuuv6fivp@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBYG6YXDAKGQESALL3VA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170321074117.vdfjynauuuv6fivp@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



21.03.2017, 15:41, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Thu, Mar 16, 2017 at 01:28:04AM +0800, Icenowy Zheng wrote:
>> =C2=A0Many Allwinner SoCs after A31 have a CCU in PRCM block.
>>
>> =C2=A0Give the ones on H3 and A64 compatible strings.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0Changes in v2:
>> =C2=A0- Add iosc for R_CCU's on H3/A64. (A31, A23 and A33 seem to have d=
ifferent
>> =C2=A0=C2=A0=C2=A0clock for mux 3 of ar100 clk. Investgations are needed=
 for them.)
>>
>> =C2=A0=C2=A0Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 18 +=
++++++++++++++++-
>> =C2=A0=C2=A01 file changed, 17 insertions(+), 1 deletion(-)
>>
>> =C2=A0diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt=
 b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
>> =C2=A0index 68512aa398a9..4a4addff595d 100644
>> =C2=A0--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
>> =C2=A0+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
>> =C2=A0@@ -7,9 +7,11 @@ Required properties :
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-a23-ccu"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-a33-ccu"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-h3-ccu"
>> =C2=A0+ - "allwinner,sun8i-h3-r-ccu"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-v3s-ccu"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun9i-a80-ccu"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun50i-a64-ccu"
>> =C2=A0+ - "allwinner,sun50i-a64-r-ccu"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun50i-h5-ccu"
>>
>> =C2=A0=C2=A0- reg: Must contain the registers base address and length
>> =C2=A0@@ -20,7 +22,11 @@ Required properties :
>> =C2=A0=C2=A0- #clock-cells : must contain 1
>> =C2=A0=C2=A0- #reset-cells : must contain 1
>>
>> =C2=A0-Example:
>> =C2=A0+For the PRCM CCUs on H3/A64, one more clock is needed:
>> =C2=A0+- "iosc": another frequency oscillator used for CPUS (usually at =
32000Hz,
>> =C2=A0+ not the same with losc)
>
> This is called the internal oscillator in the datasheet, it would
> probably make more sense to call it that way in the documentation too.
>
> This oscillator seems to be clocked at 16MHz, so we should represent
> it as such.
>
> And I'm wondering, are you *sure* that it's fed directly from the
> internal oscillator, or goes through the registers in the RTC, with
> the 32 divider and 16 prescaler by default that makes it at roughly
> the same rate (31.25kHz).

In fact I know nothing about it -- I only represented the code in BSP
clock driver.

The mux value 3 varies from SoC to SoC. For A64/H5 it's 32000,
for A33 it's 667000 (seems to be directly the internal OSC, as the
user manual says the internal OSC is 600~700kHz; but it's named
cpuosc rather than iosc in A33 BSP clock driver); for A80 it's even
PLL_AUDIO.

Maybe we should find a way to deal with it before it's finally revealed?

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
