Return-Path: <SRS0=nFZC=UU=sifive.com=troy.benjegerdes@kernel.org>
MIME-Version: 1.0
References: <1561114429-29612-1-git-send-email-yash.shah@sifive.com>
 <1561114429-29612-2-git-send-email-yash.shah@sifive.com> <18c7992607dd1fed062bd295ac0738a759eff078.camel@wdc.com>
In-Reply-To: <18c7992607dd1fed062bd295ac0738a759eff078.camel@wdc.com>
From: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Date: Fri, 21 Jun 2019 14:18:50 -0500
Message-ID: <CAF5mof3QB8C7VjOyEvCsf9NEDkJhV3cBO5sBD+8z-GrWrnrAyg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Content-Type: multipart/alternative; boundary="000000000000c00baf058bda552f"
To: Atish Patra <Atish.Patra@wdc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "yash.shah@sifive.com" <yash.shah@sifive.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>, "palmer@sifive.com" <palmer@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
List-ID: <devicetree@vger.kernel.org>

--000000000000c00baf058bda552f
Content-Type: text/plain; charset="UTF-8"

Can you post the fsbl and other images you used to boot/test this?

I keep running into various failures when I build from source and I want to
rule out potential hardware issues related to clock and/or ddr
initialization

On Fri, Jun 21, 2019, 2:14 PM Atish Patra <Atish.Patra@wdc.com> wrote:

> On Fri, 2019-06-21 at 16:23 +0530, Yash Shah wrote:
> > DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 16
> > ++++++++++++++++
> >  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  9 +++++++++
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > index 4e8fbde..c53b4ea 100644
> > --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > @@ -225,5 +225,21 @@
> >                       #address-cells = <1>;
> >                       #size-cells = <0>;
> >               };
> > +             eth0: ethernet@10090000 {
> > +                     compatible = "sifive,fu540-macb";
> > +                     interrupt-parent = <&plic0>;
> > +                     interrupts = <53>;
> > +                     reg = <0x0 0x10090000 0x0 0x2000
> > +                            0x0 0x100a0000 0x0 0x1000>;
> > +                     reg-names = "control";
> > +                     status = "disabled";
> > +                     local-mac-address = [00 00 00 00 00 00];
> > +                     clock-names = "pclk", "hclk";
> > +                     clocks = <&prci PRCI_CLK_GEMGXLPLL>,
> > +                              <&prci PRCI_CLK_GEMGXLPLL>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +             };
> > +
> >       };
> >  };
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > index 4da8870..d783bf2 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > @@ -63,3 +63,12 @@
> >               disable-wp;
> >       };
> >  };
> > +
> > +&eth0 {
> > +     status = "okay";
> > +     phy-mode = "gmii";
> > +     phy-handle = <&phy1>;
> > +     phy1: ethernet-phy@0 {
> > +             reg = <0>;
> > +     };
> > +};
>
> Thanks. I am able to boot Unleashed with networking enabled with this
> patch.
>
> FWIW,
> Tested-by: Atish Patra <atish.patra@wdc.com>
>
> Regards,
> Atish
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

--000000000000c00baf058bda552f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you post the fsbl and other images you used to boot/t=
est this?<div dir=3D"auto"><br></div><div dir=3D"auto">I keep running into =
various failures when I build from source and I want to rule out potential =
hardware issues related to clock and/or ddr initialization</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun=
 21, 2019, 2:14 PM Atish Patra &lt;<a href=3D"mailto:Atish.Patra@wdc.com">A=
tish.Patra@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">O=
n Fri, 2019-06-21 at 16:23 +0530, Yash Shah wrote:<br>
&gt; DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added<=
br>
&gt; <br>
&gt; Signed-off-by: Yash Shah &lt;<a href=3D"mailto:yash.shah@sifive.com" t=
arget=3D"_blank" rel=3D"noreferrer">yash.shah@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/riscv/boot/dts/sifive/fu540-c000.dtsi=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 16<br>
&gt; ++++++++++++++++<br>
&gt;=C2=A0 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |=C2=A0 9 ++=
+++++++<br>
&gt;=C2=A0 2 files changed, 25 insertions(+)<br>
&gt; <br>
&gt; diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi<br>
&gt; b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi<br>
&gt; index 4e8fbde..c53b4ea 100644<br>
&gt; --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi<br>
&gt; +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi<br>
&gt; @@ -225,5 +225,21 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0#size-cells =3D &lt;0&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eth0: ethernet@100900=
00 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;sifive,fu540-macb&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0interrupt-parent =3D &lt;&amp;plic0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0interrupts =3D &lt;53&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0x0 0x10090000 0x0 0x2000<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0 0x100a0000 0x0 0x1000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg-names =3D &quot;control&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0local-mac-address =3D [00 00 00 00 00 00];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0clock-names =3D &quot;pclk&quot;, &quot;hclk&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0clocks =3D &lt;&amp;prci PRCI_CLK_GEMGXLPLL&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&amp;prci PRCI_CLK_GEMGXLPLL&gt;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0#size-cells =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 };<br>
&gt; diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts<br>
&gt; b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts<br>
&gt; index 4da8870..d783bf2 100644<br>
&gt; --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts<br>
&gt; +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts<br>
&gt; @@ -63,3 +63,12 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disable-wp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 };<br>
&gt; +<br>
&gt; +&amp;eth0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;gmii&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;phy1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy1: ethernet-phy@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
<br>
Thanks. I am able to boot Unleashed with networking enabled with this<br>
patch.<br>
<br>
FWIW, <br>
Tested-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" target=3D=
"_blank" rel=3D"noreferrer">atish.patra@wdc.com</a>&gt;<br>
<br>
Regards,<br>
Atish<br>
_______________________________________________<br>
linux-riscv mailing list<br>
<a href=3D"mailto:linux-riscv@lists.infradead.org" target=3D"_blank" rel=3D=
"noreferrer">linux-riscv@lists.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-riscv" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://lists.infradead.org/mailman=
/listinfo/linux-riscv</a><br>
</blockquote></div>

--000000000000c00baf058bda552f--
