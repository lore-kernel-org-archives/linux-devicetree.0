From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v6 11/13] ARM: dts: sun8i: add DE2 nodes for
 V3s SoC
Date: Fri, 05 May 2017 20:34:16 +0800
Message-ID: <47D16B11-E976-464C-92AD-213D837C8F68@aosc.io>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-12-icenowy@aosc.io> <CAGb2v67uE2iuP+wrL2t0fSMY8C1qnX=pYru7pZGX+0WhC_z2EA@mail.gmail.com> <8ad5de02ffc13348dfc71e9ec203205c@aosc.io> <20170505123035.pwh3idz73ujrd3hx@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBWHCWHEAKGQES2RQUTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170505123035.pwh3idz73ujrd3hx@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888:3=
0:35, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, May 05, 2017 at 04:53:43PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
>> > > +               de2_clocks: clock@1000000 {
>> > > +                       compatible =3D
>"allwinner,sun50i-h5-de2-clk";
>> >=20
>> > I am a bit skeptical about this. Since the V3S only has one mixer,
>do
>> > the clocks
>> > for the second one even exist?
>>=20
>> It's described in the de_clock.c in the BSP source code, and in
>hardware
>> these bits can be really set (although without clock output).
>>=20
>> So I use this compatible which has still the extra clocks.
>
>If it's not usable, then it shouldn't be in the code, it's basically
>dead code.

Thus should we have one more DE2 CCU compatible without mixer1
clocks for V3s?

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
