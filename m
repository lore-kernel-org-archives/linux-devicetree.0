Return-Path: <SRS0=Gdro=XF=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190909123840.154745-1-tmaimon77@gmail.com> <20190909123840.154745-2-tmaimon77@gmail.com>
 <20190910102505.vgyomi575ldrk2lq@holly.lan>
In-Reply-To: <20190910102505.vgyomi575ldrk2lq@holly.lan>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 10 Sep 2019 14:55:44 +0300
Message-ID: <CAP6Zq1igPJ5PvaA2YaC-=ngQOnatt4PFJj-QzaJCueDf6KA19A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: hwrng: add NPCM RNG documentation
Content-Type: multipart/alternative; boundary="0000000000002a7a3805923175cd"
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: mpm@selenic.com, herbert@gondor.apana.org.au, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, sumit.garg@linaro.org, jens.wiklander@linaro.org, vkoul@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-ID: <devicetree@vger.kernel.org>

--0000000000002a7a3805923175cd
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Sorry but I have probably miss it, thanks a lot for your comment

On Tue, 10 Sep 2019 at 13:25, Daniel Thompson <daniel.thompson@linaro.org>
wrote:

> On Mon, Sep 09, 2019 at 03:38:39PM +0300, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM Random Number Generator (RNG).
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> >
> > diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > new file mode 100644
> > index 000000000000..a697b4425fb3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > @@ -0,0 +1,17 @@
> > +NPCM SoC Random Number Generator
> > +
> > +Required properties:
> > +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> > +- reg         : Specifies physical base address and size of the
> registers.
> > +
> > +Optional property:
> > +- quality : estimated number of bits of true entropy per 1024 bits
> > +                     read from the rng.
> > +                     If this property is not defined, it defaults to
> 1000.
>
> There are pending unreplied review comments about this property (my own
> as it happens):
> https://patchwork.kernel.org/patch/11119371/
>
> No, there isn't different SoCs.
we had checked the quality of the hwrng and the results we got are set as
default.
we been asked from one of our client to have a dynamic quality, they will
like to be more strict when using the hwrng.
is it problematic to add it?

Having a controllable quality implies that the numeric quality of the
peripheral changes when it is stamped out on different SoCs (otherwise
the driver can confidently set the quality without needing any hint
from the DT). Is that really true here?


> Daniel.
>
> > +
> > +Example:
> > +
> > +rng: rng@f000b000 {
> > +     compatible = "nuvoton,npcm750-rng";
> > +     reg = <0xf000b000 0x8>;
> > +};
> > --
> > 2.18.0
> >
>

--0000000000002a7a3805923175cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,<div><br></div><div>Sorry but I=
 have probably miss it, thanks a lot for your comment</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 10 Sep 2=
019 at 13:25, Daniel Thompson &lt;<a href=3D"mailto:daniel.thompson@linaro.=
org">daniel.thompson@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, Sep 09, 2019 at 03:38:39PM +0300, =
Tomer Maimon wrote:<br>
&gt; Added device tree binding documentation for Nuvoton BMC<br>
&gt; NPCM Random Number Generator (RNG).<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/rng/nuvoton,npcm-rng.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 17 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/rng/nuvoton=
,npcm-rng.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.tx=
t b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..a697b4425fb3<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt<br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +NPCM SoC Random Number Generator<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- compatible=C2=A0 : &quot;nuvoton,npcm750-rng&quot; for the NPCM7XX =
BMC.<br>
&gt; +- reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: Specifies physical base addr=
ess and size of the registers.<br>
&gt; +<br>
&gt; +Optional property:<br>
&gt; +- quality : estimated number of bits of true entropy per 1024 bits<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0read from the rng.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0If this property is not defined, it defaults to 1000.<br>
<br>
There are pending unreplied review comments about this property (my own<br>
as it happens):<br>
<a href=3D"https://patchwork.kernel.org/patch/11119371/" rel=3D"noreferrer"=
 target=3D"_blank">https://patchwork.kernel.org/patch/11119371/</a><br>
<br></blockquote><div>No, there isn&#39;t different SoCs.</div><div>we had =
checked the quality of the hwrng and the results we got are set as default.=
</div><div>we been asked from one of our client to have a dynamic quality, =
they will like to be more strict when using the hwrng.</div><div>is it prob=
lematic to add it?</div><pre class=3D"gmail-content" style=3D"box-sizing:bo=
rder-box;overflow:auto;font-family:Menlo,Monaco,Consolas,&quot;Courier New&=
quot;,monospace;font-size:13px;padding:9.5px;margin-top:0px;margin-bottom:1=
0px;line-height:14.3px;color:rgb(51,51,51);word-break:break-all;border:0px;=
border-radius:0px">Having a controllable quality implies that the numeric q=
uality of the
peripheral changes when it is stamped out on different SoCs (otherwise
the driver can confidently set the quality without needing any hint
from the DT). Is that really true here?=C2=A0</pre><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Daniel.<br>
<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; +rng: rng@f000b000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-rng&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf000b000 0x8&gt;;<br>
&gt; +};<br>
&gt; -- <br>
&gt; 2.18.0<br>
&gt; <br>
</blockquote></div></div>

--0000000000002a7a3805923175cd--
