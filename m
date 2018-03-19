From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v4 0/9] Initial Allwinner H6 support
Date: Mon, 19 Mar 2018 09:28:23 +0800
Message-ID: <F40271A8-3782-4A69-8C40-3909EB296C66@aosc.io>
References: <20180316140215.28663-1-icenowy@aosc.io> <20180318201744.dw6hnm2vdybaunev@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBSVEXTKQKGQECOABCOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180318201744.dw6hnm2vdybaunev@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B43=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=884:=
17:44, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Mar 16, 2018 at 10:02:06PM +0800, Icenowy Zheng wrote:
>> This patchset adds initial support for the Allwinner H6 SoC.
>>=20
>> It's quite different from earlier Allwinner SoCs. For example, the
>> memory map is refactored, and the CCU is rearranged. It's also the
>first
>> Allwinner SoC with PCI Express interface (although the implementation
>> of the PCI Express controller is broken), and the second one with USB
>> 3.0 (the first one is A80).
>>=20
>> This patchset adds the most basical support for it, including the
>main pin
>> controller, the main CCU and the basical device tree.
>>=20
>> Icenowy Zheng (9):
>>   pinctrl: sunxi: refactor irq related register function to have desc
>>   pinctrl: sunxi: introduce IRQ bank conversion function
>>   pinctrl: sunxi: change irq_bank_base to irq_bank_map
>>   pinctrl: sunxi: add support for the Allwinner H6 main pin
>controller
>>   clk: sunxi-ng: Support fixed post-dividers on NKMP style clocks
>>   dt-bindings: add device tree binding for Allwinner H6 main CCU
>>   clk: sunxi-ng: add support for the Allwinner H6 CCU
>>   arm64: allwinner: h6: add the basical Allwinner H6 DTSI file
>>   arm64: allwinner: h6: add support for Pine H64 board
>
>Applied the !pinctrl patches.

Oops, one clock (CLK_HDMI_SLOW) is missing in the CCU
driver, as Jernej pointed out.

Should I send a patch that fix it?

>
>Thanks!
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
