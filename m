Return-Path: <SRS0=iwVP=WF=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com> <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808132740.GG3795@sirena.co.uk> <CAP6Zq1j7jHejdx9h-nxCJcVjtGx_3rHmay7R8nn11DLaE8Q4gA@mail.gmail.com>
 <20190808185522.GJ3795@sirena.co.uk>
In-Reply-To: <20190808185522.GJ3795@sirena.co.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Aug 2019 18:31:10 +0300
Message-ID: <CAP6Zq1jzvEPWehT5VVd6+=zTB7c+RsGjPr2XzmQa4n1NDOrSOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
Content-Type: multipart/alternative; boundary="0000000000009de0be058fb0bf5c"
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, linux-spi@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--0000000000009de0be058fb0bf5c
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for your prompt reply.

I will like to send another patch with support for the spi_mem_op->addr
field.

I am going to vacation until 25/08 I will send the new patch (V3) as soon I
will be back.

Thanks for your support,

Tomer

On Thu, 8 Aug 2019 at 21:55, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Aug 08, 2019 at 06:37:06PM +0300, Tomer Maimon wrote:
>
> > for example in our driver we modify the access type (singe, dual or quad)
> > according the op->addr.buswidth
> > for example in the npcm_fiu_set_drd function.
>
> >         regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> >                            NPCM_FIU_DRD_CFG_ACCTYPE,
> >                            ilog2(op->addr.buswidth) <<
> >                            NPCM_FIU_DRD_ACCTYPE_SHIFT);
>
> > we also modify it in the UMA R/W functions.
>
> Ah, it's only for the flash functions - that's fine.
>

--0000000000009de0be058fb0bf5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mark,<div><br></div><div>Thanks for your prompt reply.<=
/div><div><br></div><div>I will like to send another patch with support for=
 the spi_mem_op-&gt;addr field.</div><div><br></div><div>I am going to vaca=
tion until 25/08 I will send the new patch (V3) as soon I will be back.</di=
v><div><br></div><div>Thanks for your support,</div><div><br></div><div>Tom=
er</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, 8 Aug 2019 at 21:55, Mark Brown &lt;<a href=3D"mailto:broon=
ie@kernel.org" target=3D"_blank">broonie@kernel.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 08, 2019 at =
06:37:06PM +0300, Tomer Maimon wrote:<br>
<br>
&gt; for example in our driver we modify the access type (singe, dual or qu=
ad)<br>
&gt; according the op-&gt;addr.buswidth<br>
&gt; for example in the npcm_fiu_set_drd function.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NP=
CM_FIU_DRD_CFG,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_CFG_ACCTYPE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ilog2(op-&gt;addr.buswidth) &lt;&lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_ACCTYPE_SHIFT);<br>
<br>
&gt; we also modify it in the UMA R/W functions.<br>
<br>
Ah, it&#39;s only for the flash functions - that&#39;s fine.<br>
</blockquote></div>

--0000000000009de0be058fb0bf5c--
