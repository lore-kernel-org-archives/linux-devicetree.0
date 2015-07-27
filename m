Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
In-Reply-To: <1437965782.5614.4.camel@mtksdaap41>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com>
	<1437706925-3222-8-git-send-email-jamesjj.liao@mediatek.com>
	<CAGS+omAUAHZUJQMnWJbH7NXB_Etp=OF3dWyMB7Ri1+rAyzyPBg@mail.gmail.com>
	<1437965782.5614.4.camel@mtksdaap41>
Date: Mon, 27 Jul 2015 13:34:34 +0800
Message-ID: <CAGS+omAJ5EDhsn90t=CMXN_jcYvr+s4S5S25HGPX1+GbENR5eQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: mt8173: Add subsystem clock controller
 device nodes
From: Daniel Kurtz <djkurtz@google.com>
Content-Type: multipart/alternative; boundary=001a113f25fe780326051bd4b513
To: James Liao <jamesjj.liao@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream <srv_heupstream@mediatek.com>, Heiko Stubner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ricky Liang <jcliang@chromium.org>
List-ID: <devicetree@vger.kernel.org>

--001a113f25fe780326051bd4b513
Content-Type: text/plain; charset=UTF-8

On Jul 27, 2015 09:56, "James Liao" <jamesjj.liao@mediatek.com> wrote:
>
> Hi Daniel,
>
> On Fri, 2015-07-24 at 19:32 +0800, Daniel Kurtz wrote:
> > > @@ -88,6 +88,13 @@
> > >                 #clock-cells = <0>;
> > >         };
> > >
> > > +       cpum_ck: dummy_clk {
> >
> > I'm not a big fan of this "dummy_clk".
> > The 'name' part of the devicetree node is supposed to be generic.
> > So, perhaps just oscillator@2, and move it down below clk32k:
oscillator@1.
> > Otherwise:
>
> cpum_ck is a test clock which only available in IC test. It's empty on
> MT8173 evaluation or production boards. Should we name this kind of
> empty clock as an oscillator? Or is there a better name for it?

When and if it is used, it would be an oscillator of some kind. It is only
"dummy" because it is not currently used.

I am not an expert, but I think these names should be generic, and
"oscillator" is consistent with what is used elsewhere in this file for off
chip clock sources.

-Dan

>
>
> Best regards,
>
> James
>

--001a113f25fe780326051bd4b513
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 27, 2015 09:56, &quot;James Liao&quot; &lt;<a href=3D"mailto:jamesjj=
.liao@mediatek.com">jamesjj.liao@mediatek.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Daniel,<br>
&gt;<br>
&gt; On Fri, 2015-07-24 at 19:32 +0800, Daniel Kurtz wrote:<br>
&gt; &gt; &gt; @@ -88,6 +88,13 @@<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0#clock-cells =3D &lt;0&gt;;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cpum_ck: dummy_clk {<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not a big fan of this &quot;dummy_clk&quot;.<br>
&gt; &gt; The &#39;name&#39; part of the devicetree node is supposed to be =
generic.<br>
&gt; &gt; So, perhaps just oscillator@2, and move it down below clk32k: osc=
illator@1.<br>
&gt; &gt; Otherwise:<br>
&gt;<br>
&gt; cpum_ck is a test clock which only available in IC test. It&#39;s empt=
y on<br>
&gt; MT8173 evaluation or production boards. Should we name this kind of<br=
>
&gt; empty clock as an oscillator? Or is there a better name for it?</p>
<p dir=3D"ltr">When and if it is used, it would be an oscillator of some ki=
nd. It is only &quot;dummy&quot; because it is not currently used.</p>
<p dir=3D"ltr">I am not an expert, but I think these names should be generi=
c, and &quot;oscillator&quot; is consistent with what is used elsewhere in =
this file for off chip clock sources.</p>
<p dir=3D"ltr">-Dan</p>
<p dir=3D"ltr">&gt;<br>
&gt;<br>
&gt; Best regards,<br>
&gt;<br>
&gt; James<br>
&gt;<br>
</p>

--001a113f25fe780326051bd4b513--
