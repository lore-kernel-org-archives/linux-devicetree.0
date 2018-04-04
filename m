Return-Path: <SRS0=WIL1=GZ=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2MhXOPKob++DzWrMdmDwSkUketpdv-_VAEsEQSMkkNCQ@mail.gmail.com>
References: <1522059113-20418-1-git-send-email-tmaimon77@gmail.com> <CAK8P3a2MhXOPKob++DzWrMdmDwSkUketpdv-_VAEsEQSMkkNCQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 4 Apr 2018 14:15:14 +0300
Message-ID: <CAP6Zq1hDmU=niz3_43X-E-YsUXDmk7mmOeWAkHtZGq9+qoZxZQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] arm: dts: modify Nuvoton NPCM750 device tree
Content-Type: multipart/alternative; boundary="001a114ac76ced8c48056903ef34"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>, Brendan Higgins <brendanhiggins@google.com>, Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-ID: <devicetree@vger.kernel.org>

--001a114ac76ced8c48056903ef34
Content-Type: text/plain; charset="UTF-8"

On 29 March 2018 at 23:37, Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Mar 26, 2018 at 12:11 PM, Tomer Maimon <tmaimon77@gmail.com>
> wrote:
> > The NPCM7xx are a family of BMC's that include several chips as:
> > NPCM750, NPCM730 etc.
> >
> > All of the NPCM7xx BMC's have the common modules like Cortex-A9,
> > WDT, timers, etc, and there are a optional modules that can be added.
> >
> > NPCM750 device tree already pushed to arm-soc.git:
> > https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-
> soc.git/commit/?h=for-next&id=d6bdd009c21db3f677dd1d1bbb8c20bc819074bc
> >
> > After discussion with Rob Herring we have modified the structure
> > of the NPCM7xx device tree as follow:
> >
> > nuvoton-common-npcm7xx device tree include all common modules
> > nuvoton-npcm750 device tree include specific npcm750 modules,
> > the nuvoton-npcm750 device tree include nuvoton-common-npcm7xx device
> tree
> >
> > In addition, the NPCM7xx device tree include the following changes:
> >         - watchdog module added
> >         - clock module modification
> >         - serial module modification
> >         - Modify Makefile NPCM7XX configuration name
> >
> > Sorry if it cause more work after pushing NPCM750 device tree.
>
> I only see one patch here, which fails to describe the changes and
> combines all of the above changes into one commit.
>
> Please follow the usual style for sending patches and do one thing
> at a time. In particular, never move large parts of a file code around
> in a patch that also contains other changes, those need to be split
> up. Each patch should also have a description that explains what
> it's for.
>
>        Arnd
>

sent again (split patches)

Thanks!

--001a114ac76ced8c48056903ef34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 29 March 2018 at 23:37, Arnd Bergmann <span dir=3D"ltr">&lt;<a href=
=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arndb.de</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Mar 26, 201=
8 at 12:11 PM, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com">tmai=
mon77@gmail.com</a>&gt; wrote:<br>
&gt; The NPCM7xx are a family of BMC&#39;s that include several chips as:<b=
r>
&gt; NPCM750, NPCM730 etc.<br>
&gt;<br>
&gt; All of the NPCM7xx BMC&#39;s have the common modules like Cortex-A9,<b=
r>
&gt; WDT, timers, etc, and there are a optional modules that can be added.<=
br>
&gt;<br>
&gt; NPCM750 device tree already pushed to arm-soc.git:<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc=
.git/commit/?h=3Dfor-next&amp;id=3Dd6bdd009c21db3f677dd1d1bbb8c20bc819074bc=
" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/=
linux/kernel/git/arm/arm-<wbr>soc.git/commit/?h=3Dfor-next&amp;id=3D<wbr>d6=
bdd009c21db3f677dd1d1bbb8c20<wbr>bc819074bc</a><br>
&gt;<br>
&gt; After discussion with Rob Herring we have modified the structure<br>
&gt; of the NPCM7xx device tree as follow:<br>
&gt;<br>
&gt; nuvoton-common-npcm7xx device tree include all common modules<br>
&gt; nuvoton-npcm750 device tree include specific npcm750 modules,<br>
&gt; the nuvoton-npcm750 device tree include nuvoton-common-npcm7xx device =
tree<br>
&gt;<br>
&gt; In addition, the NPCM7xx device tree include the following changes:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- watchdog module added<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- clock module modification<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- serial module modification<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Modify Makefile NPCM7XX configurati=
on name<br>
&gt;<br>
&gt; Sorry if it cause more work after pushing NPCM750 device tree.<br>
<br>
</span>I only see one patch here, which fails to describe the changes and<b=
r>
combines all of the above changes into one commit.<br>
<br>
Please follow the usual style for sending patches and do one thing<br>
at a time. In particular, never move large parts of a file code around<br>
in a patch that also contains other changes, those need to be split<br>
up. Each patch should also have a description that explains what<br>
it&#39;s for.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Arnd<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">sent =
again (split patches)</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Thanks!</div></div>

--001a114ac76ced8c48056903ef34--
