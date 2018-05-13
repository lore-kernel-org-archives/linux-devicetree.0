Return-Path: <SRS0=RBed=IA=gmail.com=ykaneko0929@kernel.org>
MIME-Version: 1.0
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
 <1522759385-17661-3-git-send-email-ykaneko0929@gmail.com> <20180409212129.w55kgl6s6fz4pi6v@rob-hp-laptop>
 <20180509180950.b35wrl35sxunjmpg@verge.net.au>
In-Reply-To: <20180509180950.b35wrl35sxunjmpg@verge.net.au>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Mon, 14 May 2018 05:55:43 +0900
Message-ID: <CAH1o70L_vyEKPmhTQC0jtsUp53-cMTRPA6w7RgzqD1gMW9ah9Q@mail.gmail.com>
Subject: Re: [PATCH/RFT v3 2/3] dt-bindings: thermal: rcar-thermal: add
 R8A77995 support
Content-Type: multipart/alternative; boundary="000000000000599816056c1c988b"
To: Simon Horman <horms@verge.net.au>
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh@kernel.org>, Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--000000000000599816056c1c988b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon-san,

2018=E5=B9=B45=E6=9C=8810=E6=97=A5(=E6=9C=A8) 3:10 Simon Horman <horms@verg=
e.net.au>:

> On Mon, Apr 09, 2018 at 04:21:29PM -0500, Rob Herring wrote:
> > On Tue, Apr 03, 2018 at 09:43:04PM +0900, Yoshihiro Kaneko wrote:
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 7 +++++=
--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> > > index 349e635..5ab5fcd 100644
> > > --- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> > > +++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> > > @@ -3,7 +3,8 @@
> > >  Required properties:
> > >  - compatible               : "renesas,thermal-<soctype>",
> > >                        "renesas,rcar-gen2-thermal" (with thermal-zone=
)
> or
> > > -                      "renesas,rcar-thermal" (without thermal-zone)
> as fallback.
> > > +                      "renesas,rcar-thermal" (without thermal-zone) =
as
> > > +                           fallback except R-Car D3.
> > >                       Examples with soctypes are:
> > >                         - "renesas,thermal-r8a73a4" (R-Mobile APE6)
> > >                         - "renesas,thermal-r8a7743" (RZ/G1M)
> > > @@ -12,13 +13,15 @@ Required properties:
> > >                         - "renesas,thermal-r8a7791" (R-Car M2-W)
> > >                         - "renesas,thermal-r8a7792" (R-Car V2H)
> > >                         - "renesas,thermal-r8a7793" (R-Car M2-N)
> > > +                       - "renesas,thermal-r8a77995" (R-Car D3)
> > >  - reg                      : Address range of the thermal registers.
> > >                       The 1st reg will be recognized as common regist=
er
> > >                       if it has "interrupts".
> > >
> > >  Option properties:
> > >
> > > -- interrupts               : use interrupt
> > > +- interrupts               : use interrupt.
> > > +                          Should contain 3 interrupts for R-Car D3.
> >
> > And how many for other chips?
>
> How about this?
>
>                                 If present should contain 3 interrupts fo=
r
>                                 R-Car D3 or 1 interrupt otherwise.


Thanks!
I will update the patch with your suggestion.


>
> > >
> > >  Example (non interrupt support):
> > >
> > > --
> > > 1.9.1
> > >
> >
>

--000000000000599816056c1c988b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi Simon-san,</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"auto">2018=E5=B9=B45=E6=9C=8810=E6=97=A5(=E6=9C=A8) 3:10 Simon Ho=
rman &lt;<a href=3D"mailto:horms@verge.net.au">horms@verge.net.au</a>&gt;:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Mon, Apr 09, 2018 at 04:21:29PM =
-0500, Rob Herring wrote:<br>
&gt; On Tue, Apr 03, 2018 at 09:43:04PM +0900, Yoshihiro Kaneko wrote:<br>
&gt; &gt; Signed-off-by: Yoshihiro Kaneko &lt;<a href=3D"mailto:ykaneko0929=
@gmail.com" target=3D"_blank">ykaneko0929@gmail.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Geert Uytterhoeven &lt;<a href=3D"mailto:geert%2Bren=
esas@glider.be" target=3D"_blank">geert+renesas@glider.be</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 Documentation/devicetree/bindings/thermal/rcar-thermal.txt =
| 7 +++++--<br>
&gt; &gt;=C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/Documentation/devicetree/bindings/thermal/rcar-therm=
al.txt b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt<br>
&gt; &gt; index 349e635..5ab5fcd 100644<br>
&gt; &gt; --- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt<=
br>
&gt; &gt; +++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt<=
br>
&gt; &gt; @@ -3,7 +3,8 @@<br>
&gt; &gt;=C2=A0 Required properties:<br>
&gt; &gt;=C2=A0 - compatible=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0: &quot;renesas,thermal-&lt;soctype&gt;&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;renesas,rcar-gen2-thermal&quot; (with thermal-zone)=
 or<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;renesas,rcar-thermal&quot; (without thermal-zone) as fa=
llback.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;renesas,rcar-thermal&quot; (without thermal-zone) as<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fallback except R-Car D3.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Examples with soctypes are:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- &quot;renesas,thermal-r8a73a4&quot; (R-Mobile APE=
6)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- &quot;renesas,thermal-r8a7743&quot; (RZ/G1M)<br>
&gt; &gt; @@ -12,13 +13,15 @@ Required properties:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- &quot;renesas,thermal-r8a7791&quot; (R-Car M2-W)<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- &quot;renesas,thermal-r8a7792&quot; (R-Car V2H)<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- &quot;renesas,thermal-r8a7793&quot; (R-Car M2-N)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0- &quot;renesas,thermal-r8a77995&quot; (R-Car D3)<br>
&gt; &gt;=C2=A0 - reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 : Address range of the thermal registers.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0The 1st reg will be recognized as common register<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if it has &quot;interrupts&quot;.<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 Option properties:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -- interrupts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0: use interrupt<br>
&gt; &gt; +- interrupts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0: use interrupt.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Should contain 3 interrupts for R-Car D3.<br>
&gt; <br>
&gt; And how many for other chips?<br>
<br>
How about this?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If present should contain 3 interrup=
ts for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 R-Car D3 or 1 interrupt otherwise.</=
blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks!</div><div =
dir=3D"auto">I will update the patch with your suggestion.</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 Example (non interrupt support):<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -- <br>
&gt; &gt; 1.9.1<br>
&gt; &gt; <br>
&gt; <br>
</blockquote></div></div>

--000000000000599816056c1c988b--
