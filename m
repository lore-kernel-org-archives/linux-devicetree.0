From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 5/7] arm: dts: sun8i: split Allwinner H3 .dtsi
Date: Mon, 27 Feb 2017 08:20:40 +0000
Message-ID: <579a2e9f-335f-04b7-fce2-ee4d2128141f@arm.com>
References: <20170226011956.53581-1-icenowy@aosc.xyz>
 <20170226011956.53581-6-icenowy@aosc.xyz>
 <CAGb2v67qywz9EdTzguAOEtWYqqrOZ-jSMTgkRza3dysUsCN6rw@mail.gmail.com>
Reply-To: marc.zyngier-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCPZR5X4TYBBBX6CZ7CQKGQEDKGJPGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67qywz9EdTzguAOEtWYqqrOZ-jSMTgkRza3dysUsCN6rw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26/02/17 03:46, Chen-Yu Tsai wrote:
> Hi,

[...]

>> -               gic: interrupt-controller@01c81000 {
>> -                       compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>> -                       reg = <0x01c81000 0x1000>,
>> -                             <0x01c82000 0x2000>,
>> -                             <0x01c84000 0x2000>,
>> -                             <0x01c86000 0x2000>;
>> -                       interrupt-controller;
>> -                       #interrupt-cells = <3>;
>> -                       interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> 
> The gic bits seem to be the same for both SoCs, aside from the
> different compatible
> string. Marc had sent a series to change them all to arm,gic-400, which is the
> proper name for it, but it wasn't merged. I'm assuming the compatibles
> are equal?
> If so then it can also be shared.

The series was fixing the various GICv2 memory maps, and is now in
mainline. If you have a good indication that all these SoCs are indeed
featuring a gic-400, feel free to amend the DT.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
