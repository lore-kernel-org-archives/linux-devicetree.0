From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: allwinner: a64: add SRAM
 controller device tree node
Date: Tue, 19 Jun 2018 22:27:09 +0800
Message-ID: <15798B96-01B4-4D48-8695-64D4DC80E7D3@aosc.io>
References: <20180614153548.9644-1-wens@csie.org> <20180614153548.9644-5-wens@csie.org> <CAMty3ZARNpBOQKvS7knH8kWE2+bvjuJoAA4cFGZK8+GzTUQ5zA@mail.gmail.com> <2687631.x8iGEoiUx5@jernej-laptop> <5C14D945-0795-4100-86E2-6FBF04350715@aosc.io> <CAMty3ZCsPXh7Fhmhtd7UjTmJ9id+NeaZDVqkix1iQz7-fDqoUw@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBD5GUTMQKGQEKQJ4NOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZCsPXh7Fhmhtd7UjTmJ9id+NeaZDVqkix1iQz7-fDqoUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.orgJagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B46=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883:=
36:19, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Jun 15, 2018 at 4:39 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>
>>
>> =E4=BA=8E 2018=E5=B9=B46=E6=9C=8815=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=881:27:21, "Jernej =C5=A0krabec"
><jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =E5=86=99=E5=88=B0:
>>>Dne =C4=8Detrtek, 14. junij 2018 ob 19:09:56 CEST je Jagan Teki
>napisal(a):
>>>> On Thu, Jun 14, 2018 at 9:05 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>wrote:
>>>> > From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> >
>>>> > Allwinner A64 has a SRAM controller, and in the device tree
>>>currently
>>>> > we have a syscon node to enable EMAC driver to access the EMAC
>>>clock
>>>> > register. As SRAM controller driver can now export regmap for
>this
>>>> > register, replace the syscon node to the SRAM controller device
>>>node,
>>>> > and let EMAC driver to acquire its EMAC clock regmap.
>>>> >
>>>> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> > [wens-jdAy2FN1RRM@public.gmane.org: Updated compatible string]
>>>> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>>> > ---
>>>> >
>>>> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 19
>>>+++++++++++++++++--
>>>> >  1 file changed, 17 insertions(+), 2 deletions(-)
>>>> >
>>>> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> > b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
>>>> > 1b2ef28c42bd..87968dafe1dc 100644
>>>> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> > @@ -169,9 +169,24 @@
>>>> >
>>>> >                 ranges;
>>>> >
>>>> >                 syscon: syscon@1c00000 {
>>>> >
>>>> > -                       compatible =3D
>>>> > "allwinner,sun50i-a64-system-controller", -
>>>
>>>> > "syscon";
>>>> > +                       compatible =3D
>>>> > "allwinner,sun50i-a64-system-control";
>>>> >
>>>> >                         reg =3D <0x01c00000 0x1000>;
>>>> >
>>>> > +                       #address-cells =3D <1>;
>>>> > +                       #size-cells =3D <1>;
>>>> > +                       ranges;
>>>> > +
>>>> > +                       sram_c: sram@18000 {
>>>> > +                               compatible =3D "mmio-sram";
>>>> > +                               reg =3D <0x00018000 0x28000>;
>>>> > +                               #address-cells =3D <1>;
>>>> > +                               #size-cells =3D <1>;
>>>> > +                               ranges =3D <0 0x00018000 0x28000>;
>>>> > +
>>>> > +                               de2_sram: sram-section@0 {
>>>>
>>>> So, this can attach to display-engine node through allwinner,sram
>and
>>>> add support to claim the sram on sun4i/sun4i_drv.c, correct?
>>>
>>>Actually, it has to be added to display_clocks node and claimed in
>>>drivers/
>>>clk/sunxi-ng/ccu-sun8i-de2.c
>>
>> Sorry it's old practice.
>>
>> My new way is to add a bus driver which claims the SRAM.
>
>Are you pointing this driver[1] ? if yes do we have recent version
>patches for these changes so-that I can import.

I'll resend it when this patchset is ready.

>
>[1] https://patchwork.kernel.org/patch/10290399/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
