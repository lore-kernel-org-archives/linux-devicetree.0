Return-Path: <lho@apm.com>
MIME-Version: 1.0
In-Reply-To: <20150506084143.GA22949@pd.tnic>
References: <1430884947-16787-1-git-send-email-lho@apm.com>
	<20150506084143.GA22949@pd.tnic>
Date: Wed, 6 May 2015 10:00:45 -0700
Message-ID: <CAPw-ZT=LepJr2Smjy81yhcTANdMRw99x1vR9rMoYsnHW_P3HPg@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] edac: Add APM X-Gene SoC memory controller EDAC driver
From: Loc Ho <lho@apm.com>
Content-Type: multipart/alternative; boundary=047d7bfcf7a672524e05156cbc27
To: Borislav Petkov <bp@alien8.de>
Cc: Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-edac@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jon Masters <jcm@redhat.com>, "patches@apm.com" <patches@apm.com>
List-ID: <devicetree@vger.kernel.org>

--047d7bfcf7a672524e05156cbc27
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

> This patch adds support for the APM X-Gene SoC memory controller EDAC
> driver
> > for DT.
> >
> > v8:
> > * Change ASM_EDAC_H to __ASM_EDAC_H in file edac.h
> > * Add WARN_ONCE in stub function atomic_scrub
> > * Update DTS binding documentation (with only memory controller node)
> > * Temporary remove L1/L2, L3, and SoC driver code and update memory
> driver
> >   code accordingly
>
> What does that mean exactly? They'll get added later?
>

It is not include in this first patch set. Yes, it will be added later. I
will response along with Arnd subsequent email.=E2=80=8B



> It is called now xgene_edac_mc.c. Am I to expect more
> xgene_edac_<functional_unit>.c submissions?


=E2=80=8BYes=E2=80=8B



> What happened to building
> everything around the shared IRQ handler?
>

=E2=80=8BIt was discussed with Rob already in previous email. As we don't t=
ouch the
shared status registers besides reading status, it will just register as
shared interrupt.=E2=80=8B



>
> Also, I see this SOB chain in some of the patches:
>
> Signed-off-by: Feng Kan <fkan@apm.com>
> Signed-off-by: Loc Ho <lho@apm.com>
>
> and it is not clear who did what, from looking at the chain.
>
> If you both authored the patches, you can write
>
> Originally-by: Feng
> [ Loc: did this and that]
> Signed-off-by: Loc
>
> for example.
>
> See Documentation/SubmittingPatches for more info.
>

=E2=80=8BOkay... Feng was the originally author.

-Loc

--047d7bfcf7a672524e05156cbc27
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">&gt; This patch adds support for=
 the APM X-Gene SoC memory controller EDAC driver<br>
&gt; for DT.<br>
&gt;<br>
&gt; v8:<br>
&gt; * Change ASM_EDAC_H to __ASM_EDAC_H in file edac.h<br>
&gt; * Add WARN_ONCE in stub function atomic_scrub<br>
&gt; * Update DTS binding documentation (with only memory controller node)<=
br>
&gt; * Temporary remove L1/L2, L3, and SoC driver code and update memory dr=
iver<br>
&gt;=C2=A0 =C2=A0code accordingly<br>
<br>
What does that mean exactly? They&#39;ll get added later?<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif">It is not include in this first patch set. Yes, it wi=
ll be added later. I will response along with Arnd subsequent email.=E2=80=
=8B</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">It is ca=
lled now xgene_edac_mc.c. Am I to expect more<br>
xgene_edac_&lt;functional_unit&gt;.c submissions? </blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,s=
ans-serif">=E2=80=8BYes=E2=80=8B</div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">What happened to building<br>
everything around the shared IRQ handler?<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-s=
erif">=E2=80=8BIt was discussed with Rob already in previous email. As we d=
on&#39;t touch the shared status registers besides reading status, it will =
just register as shared interrupt.=E2=80=8B</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
Also, I see this SOB chain in some of the patches:<br>
<br>
Signed-off-by: Feng Kan &lt;<a href=3D"mailto:fkan@apm.com">fkan@apm.com</a=
>&gt;<br>
Signed-off-by: Loc Ho &lt;<a href=3D"mailto:lho@apm.com">lho@apm.com</a>&gt=
;<br>
<br>
and it is not clear who did what, from looking at the chain.<br>
<br>
If you both authored the patches, you can write<br>
<br>
Originally-by: Feng<br>
[ Loc: did this and that]<br>
Signed-off-by: Loc<br>
<br>
for example.<br>
<br>
See Documentation/SubmittingPatches for more info.<br></blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif">=E2=80=8BOkay... Feng was the originally author.</div><div c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br=
></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif">-Loc</div><br></div></div></div></div>

--047d7bfcf7a672524e05156cbc27--
