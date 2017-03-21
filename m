From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH v2 1/5] dt-bindings: update device tree
 binding for Allwinner PRCM CCUs
Date: Tue, 21 Mar 2017 19:37:32 +0800
Message-ID: <20170321143806.c0ku8Okq@smtp3j.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBKFBYTDAKGQEO3QPZTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B43=E6=9C=8821=E6=97=A5 =E4=B8=8B=E5=8D=883:41=E4=BA=8E Maxime R=
ipard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Mar 16, 2017 at 01:28:04AM +0800, Icenowy Zheng wrote:=20
> > Many Allwinner SoCs after A31 have a CCU in PRCM block.=20
> >=20
> > Give the ones on H3 and A64 compatible strings.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> > Changes in v2:=20
> > - Add iosc for R_CCU's on H3/A64. (A31, A23 and A33 seem to have differ=
ent=20
> >=C2=A0=C2=A0 clock for mux 3 of ar100 clk. Investgations are needed for =
them.)=20
> >=20
> >=C2=A0 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 18 ++++++=
+++++++++++-=20
> >=C2=A0 1 file changed, 17 insertions(+), 1 deletion(-)=20
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Do=
cumentation/devicetree/bindings/clock/sunxi-ccu.txt=20
> > index 68512aa398a9..4a4addff595d 100644=20
> > --- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt=20
> > +++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt=20
> > @@ -7,9 +7,11 @@ Required properties :=20
> >=C2=A0 - "allwinner,sun8i-a23-ccu"=20
> >=C2=A0 - "allwinner,sun8i-a33-ccu"=20
> >=C2=A0 - "allwinner,sun8i-h3-ccu"=20
> > + - "allwinner,sun8i-h3-r-ccu"=20
> >=C2=A0 - "allwinner,sun8i-v3s-ccu"=20
> >=C2=A0 - "allwinner,sun9i-a80-ccu"=20
> >=C2=A0 - "allwinner,sun50i-a64-ccu"=20
> > + - "allwinner,sun50i-a64-r-ccu"=20
> >=C2=A0 - "allwinner,sun50i-h5-ccu"=20
> >=C2=A0=20
> >=C2=A0 - reg: Must contain the registers base address and length=20
> > @@ -20,7 +22,11 @@ Required properties :=20
> >=C2=A0 - #clock-cells : must contain 1=20
> >=C2=A0 - #reset-cells : must contain 1=20
> >=C2=A0=20
> > -Example:=20
> > +For the PRCM CCUs on H3/A64, one more clock is needed:=20
> > +- "iosc": another frequency oscillator used for CPUS (usually at 32000=
Hz,=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not the same wi=
th losc)=20
>
> This is called the internal oscillator in the datasheet, it would=20
> probably make more sense to call it that way in the documentation too.=20
>
> This oscillator seems to be clocked at 16MHz, so we should represent=20
> it as such.=20
>
> And I'm wondering, are you *sure* that it's fed directly from the=20
> internal oscillator, or goes through the registers in the RTC, with=20
> the 32 divider and 16 prescaler by default that makes it at roughly=20
> the same rate (31.25kHz).=20

BSP clock driver makes it a 32000Hz fixed clock.

>
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.=20
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org=20
> For more options, visit https://groups.google.com/d/optout.=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
