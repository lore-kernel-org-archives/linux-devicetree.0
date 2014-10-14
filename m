Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <4094180.e6s5oT6HgP@phil>
References: <1412965848-18663-1-git-send-email-djkurtz@chromium.org>
 <1412965848-18663-4-git-send-email-djkurtz@chromium.org> <4094180.e6s5oT6HgP@phil>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Tue, 14 Oct 2014 15:22:24 +0800
Message-ID: <CAGS+omCtRup=a+QiEZF9jk3pkJ6whtO9Ycoxa0Y7nnh2sWAphA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: rk3288: add VOP iommu nodes
Content-Type: multipart/alternative; boundary=001a11c2ca04ac3aaa05055ce11d
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Grant Grundler <grundler@chromium.org>, Simon Xue <xxm@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11c2ca04ac3aaa05055ce11d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2014 at 6:33 AM, Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:

> Hi Daniel,
>
> Am Samstag, 11. Oktober 2014, 02:30:48 schrieb Daniel Kurtz:
> > Add device nodes for the VOP iommus.
> > Device nodes for other iommus will be added in later patches.
> >
> > The iommu nodes use the #iommu-cells property as described in:
> >   Documentation/devicetree/bindings/iommu/iommu.txt
> >
> > Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> > Signed-off-by: Simon Xue <xxm@rock-chips.com>
> > ---
> >  arch/arm/boot/dts/rk3288.dtsi | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rk3288.dtsi
> b/arch/arm/boot/dts/rk3288.dtsi
> > index 5950b0a..cbc92fa 100644
> > --- a/arch/arm/boot/dts/rk3288.dtsi
> > +++ b/arch/arm/boot/dts/rk3288.dtsi
> > @@ -271,6 +271,24 @@
> >               status =3D "disabled";
> >       };
> >
> > +     vopb_mmu: iommu@0xff930300 {
>
> please use the address without the 0x here ... iommu@ff930300
>

I've been doing it wrong for a while and noone else noticed :-).  Thanks!
I will resend.


> Thanks
> Heiko
>
> > +             compatible =3D "rockchip,iommu";
> > +             reg =3D <0xff930300 0x100>;
> > +             interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names =3D "vopb_mmu";
> > +             #iommu-cells =3D <0>;
> > +             status =3D "disabled";
> > +     };
> > +
> > +     vopl_mmu: iommu@0xff940300 {
> > +             compatible =3D "rockchip,iommu";
> > +             reg =3D <0xff940300 0x100>;
> > +             interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names =3D "vopl_mmu";
> > +             #iommu-cells =3D <0>;
> > +             status =3D "disabled";
> > +     };
> > +
> >       gic: interrupt-controller@ffc01000 {
> >               compatible =3D "arm,gic-400";
> >               interrupt-controller;
>
>

--001a11c2ca04ac3aaa05055ce11d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Oct 14, 2014 at 6:33 AM, Heiko St=C3=BCbner <span dir=3D"ltr">&=
lt;<a href=3D"mailto:heiko@sntech.de" target=3D"_blank">heiko@sntech.de</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Daniel,<br>
<br>
Am Samstag, 11. Oktober 2014, 02:30:48 schrieb Daniel Kurtz:<br>
<span class=3D"">&gt; Add device nodes for the VOP iommus.<br>
&gt; Device nodes for other iommus will be added in later patches.<br>
&gt;<br>
&gt; The iommu nodes use the #iommu-cells property as described in:<br>
&gt;=C2=A0 =C2=A0Documentation/devicetree/bindings/iommu/iommu.txt<br>
&gt;<br>
&gt; Signed-off-by: Daniel Kurtz &lt;<a href=3D"mailto:djkurtz@chromium.org=
">djkurtz@chromium.org</a>&gt;<br>
&gt; Signed-off-by: Simon Xue &lt;<a href=3D"mailto:xxm@rock-chips.com">xxm=
@rock-chips.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/rk3288.dtsi | 18 ++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 18 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.=
dtsi<br>
&gt; index 5950b0a..cbc92fa 100644<br>
&gt; --- a/arch/arm/boot/dts/rk3288.dtsi<br>
&gt; +++ b/arch/arm/boot/dts/rk3288.dtsi<br>
&gt; @@ -271,6 +271,24 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot=
;disabled&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vopb_mmu: iommu@0xff930300 {<br>
<br>
</span>please use the address without the 0x here ... iommu@ff930300<br></b=
lockquote><div><br></div><div>I&#39;ve been doing it wrong for a while and =
noone else noticed :-).=C2=A0 Thanks!</div><div>I will resend.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
Thanks<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Heiko<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
rockchip,iommu&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xff93030=
0 0x100&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GI=
C_SPI 15 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-names =3D &=
quot;vopb_mmu&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#iommu-cells =3D &lt;=
0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;disa=
bled&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vopl_mmu: iommu@0xff940300 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
rockchip,iommu&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xff94030=
0 0x100&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GI=
C_SPI 16 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-names =3D &=
quot;vopl_mmu&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#iommu-cells =3D &lt;=
0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;disa=
bled&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gic: interrupt-controller@ffc01000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &=
quot;arm,gic-400&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-contro=
ller;<br>
<br>
</div></div></blockquote></div><br></div></div>

--001a11c2ca04ac3aaa05055ce11d--
