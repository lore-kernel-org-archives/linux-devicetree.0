Return-Path: <SRS0=ExXm=YY=gmail.com=kpc528@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170110053605.yqclykdgi3tgndnp@rob-hp-laptop>
References: <1483930734-10309-1-git-send-email-punnaia@xilinx.com> <20170110053605.yqclykdgi3tgndnp@rob-hp-laptop>
From: Punnaiah Choudary <kpc528@gmail.com>
Date: Tue, 10 Jan 2017 11:30:25 +0530
Message-ID: <CAHLkNHL=2WGcK7QMGP-r8ZJKGdbuMSUj1HAt7SAX4G=3HDxBgA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] mtd: arasan: Add device tree binding documentation
Content-Type: multipart/alternative; boundary=001a1143f9b04e8f1d0545b73329
To: Rob Herring <robh@kernel.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@atmel.com, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, michals@xilinx.com, punnaia <kalluripunnaiahchoudary@gmail.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

--001a1143f9b04e8f1d0545b73329
Content-Type: text/plain; charset=UTF-8

Hi Rob,

   Thanks for the review.

On Tue, Jan 10, 2017 at 11:06 AM, Rob Herring <robh@kernel.org> wrote:

> On Mon, Jan 09, 2017 at 08:28:53AM +0530, Punnaiah Choudary Kalluri wrote:
> > This patch adds the dts binding document for arasan nand flash
> > controller.
> >
> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> > ---
> > Changes in v7:
> > - Corrected the acronyms those should be in caps
> > changes in v6:
> > - Removed num-cs property
> > - Separated nandchip from nand controller
> > changes in v5:
> > - None
> > Changes in v4:
> > - Added num-cs property
> > - Added clock support
> > Changes in v3:
> > - None
> > Changes in v2:
> > - None
> > ---
> >  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38
> ++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > new file mode 100644
> > index 0000000..f20adfc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > @@ -0,0 +1,38 @@
> > +Arasan NAND Flash Controller with ONFI 3.1 support
> > +
> > +Required properties:
> > +- compatible: Should be "arasan,nfc-v3p10"
>
> Needs a note that it must also have an SoC specific compatible string.
>

    Sorry,  i couldnt understand this comment. could you elaborate bit

>
> > +- reg: Memory map for module access
> > +- interrupt-parent: Interrupt controller the interrupt is routed through
> > +- interrupts: Should contain the interrupt for the device
> > +- clock-name: List of input clocks - "clk_sys", "clk_flash"
>
> clk_ is redundant.
>

     I have defined these clock names as per the controller data sheet.
     So, i feel it is fine to have them in sync with the datasheet.
     Please let me know if you still want me to change this.



> > +           (See clock bindings for details)
> > +- clocks: Clock phandles (see clock bindings for details)
> > +
> > +Optional properties:
> > +- arasan,has-mdma: Enables DMA support
> > +
> > +For NAND partition information please refer the below file
> > +Documentation/devicetree/bindings/mtd/partition.txt
> > +
> > +Example:
> > +     nand0: nand@ff100000 {
> > +             compatible = "arasan,nfc-v3p10"
> > +             reg = <0x0 0xff100000 0x1000>;
> > +             clock-name = "clk_sys", "clk_flash"
> > +             clocks = <&misc_clk &misc_clk>;
> > +             interrupt-parent = <&gic>;
> > +             interrupts = <0 14 4>;
> > +             arasan,has-mdma;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>
> > +
> > +             nand@0 {
> > +                     reg = <0>
> > +                     partition@0 {
> > +                             label = "filesystem";
> > +                             reg = <0x0 0x0 0x1000000>;
> > +                     };
> > +                     (...)
> > +             };
> > +     };
> > --
> > 2.7.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a1143f9b04e8f1d0545b73329
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Rob,<br></div>=C2=A0=C2=A0=C2=A0 <br></div>=
=C2=A0=C2=A0 Thanks for the review.<br><div><div><div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On Tue, Jan 10, 2017 at 11:06 AM, Rob =
Herring <span dir=3D"ltr">&lt;<a href=3D"mailto:robh@kernel.org" target=3D"=
_blank">robh@kernel.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"=
>On Mon, Jan 09, 2017 at 08:28:53AM +0530, Punnaiah Choudary Kalluri wrote:=
<br>
&gt; This patch adds the dts binding document for arasan nand flash<br>
&gt; controller.<br>
&gt;<br>
&gt; Signed-off-by: Punnaiah Choudary Kalluri &lt;<a href=3D"mailto:punnaia=
@xilinx.com">punnaia@xilinx.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v7:<br>
&gt; - Corrected the acronyms those should be in caps<br>
&gt; changes in v6:<br>
&gt; - Removed num-cs property<br>
&gt; - Separated nandchip from nand controller<br>
&gt; changes in v5:<br>
&gt; - None<br>
&gt; Changes in v4:<br>
&gt; - Added num-cs property<br>
&gt; - Added clock support<br>
&gt; Changes in v3:<br>
&gt; - None<br>
&gt; Changes in v2:<br>
&gt; - None<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/mtd/<wbr>arasan_nfc.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 38 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 38 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/mtd/ar=
asan_nfc.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/mtd/arasan_nfc.txt=
 b/Documentation/devicetree/<wbr>bindings/mtd/arasan_nfc.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f20adfc<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/mtd/arasan_nfc.txt<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +Arasan NAND Flash Controller with ONFI 3.1 support<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- compatible: Should be &quot;arasan,nfc-v3p10&quot;<br>
<br>
</div></div>Needs a note that it must also have an SoC specific compatible =
string.<br></blockquote><div><br>=C2=A0=C2=A0=C2=A0 Sorry,=C2=A0 i couldnt =
understand this comment. could you elaborate bit=C2=A0 <br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt; +- reg: Memory map for module access<br>
&gt; +- interrupt-parent: Interrupt controller the interrupt is routed thro=
ugh<br>
&gt; +- interrupts: Should contain the interrupt for the device<br>
&gt; +- clock-name: List of input clocks - &quot;clk_sys&quot;, &quot;clk_f=
lash&quot;<br>
<br>
</span>clk_ is redundant.<br></blockquote><div><br>=C2=A0 =C2=A0=C2=A0 I ha=
ve defined these clock names as per the controller data sheet.<br><div>=C2=
=A0 =C2=A0=C2=A0 So, i feel it is fine to have them in sync with the datash=
eet.<br></div>=C2=A0=C2=A0=C2=A0=C2=A0 Please let me know if you still want=
 me to change this.<br><br><br> </div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(See clock bindings for deta=
ils)<br>
&gt; +- clocks: Clock phandles (see clock bindings for details)<br>
&gt; +<br>
&gt; +Optional properties:<br>
&gt; +- arasan,has-mdma: Enables DMA support<br>
&gt; +<br>
&gt; +For NAND partition information please refer the below file<br>
&gt; +Documentation/devicetree/<wbr>bindings/mtd/partition.txt<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nand0: nand@ff100000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
arasan,nfc-v3p10&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0xff1=
00000 0x1000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-name =3D &quot;=
clk_sys&quot;, &quot;clk_flash&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;m=
isc_clk &amp;misc_clk&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-parent =3D =
&lt;&amp;gic&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;0 =
14 4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arasan,has-mdma;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &l=
t;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0=
&gt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0partition@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;filesystem&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x0 0x1000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(...)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"gmail-HOEnZb"><font color=3D"#888888">&gt; --<br=
>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe devicet=
ree&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">=
majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordo=
mo-info.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/<=
wbr>majordomo-info.html</a><br>
</font></span></blockquote></div><br></div></div></div></div></div>

--001a1143f9b04e8f1d0545b73329--
