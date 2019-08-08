Return-Path: <SRS0=SfsX=WE=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com> <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808132740.GG3795@sirena.co.uk>
In-Reply-To: <20190808132740.GG3795@sirena.co.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 8 Aug 2019 18:37:06 +0300
Message-ID: <CAP6Zq1j7jHejdx9h-nxCJcVjtGx_3rHmay7R8nn11DLaE8Q4gA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
Content-Type: multipart/alternative; boundary="000000000000f45bbc058f9cb6ba"
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>, bbrezillon@kernel.org, Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, linux-spi@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000f45bbc058f9cb6ba
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the prompt reply.

On Thu, 8 Aug 2019 at 16:27, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Aug 08, 2019 at 04:14:48PM +0300, Tomer Maimon wrote:
>
> > +     ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD
> > +             | SPI_TX_DUAL | SPI_TX_QUAD;
> > +     ctrl->setup = npcm_fiu_setup;
>
> I'm not seeing where we implement dual or quad modes in the driver?
> There's some
>
>
Do you mean you do not see where it is implemented in the NPCM FIU driver?

for example in our driver we modify the access type (singe, dual or quad)
according the op->addr.buswidth
for example in the npcm_fiu_set_drd function.

        regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
                           NPCM_FIU_DRD_CFG_ACCTYPE,
                           ilog2(op->addr.buswidth) <<
                           NPCM_FIU_DRD_ACCTYPE_SHIFT);

we also modify it in the UMA R/W functions.

> +     dev_info(dev, "NPCM %s probe succeed\n", fiu->info->name);
>
> Just remove this, it makes the log more verbose but doesn't really add
> any information.
>

I will remove it.

Thanks,

Tomer

--000000000000f45bbc058f9cb6ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mark,<div><br></div><div>Thanks for th=
e prompt reply.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 8 Aug 2019 at 16:27, Mark Brown &lt;<a href=3D=
"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 08, 2019 at 04:14=
:48PM +0300, Tomer Maimon wrote:<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctrl-&gt;mode_bits =3D SPI_RX_DUAL | SPI_RX_QUAD<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| SPI_TX_DUAL | SPI_T=
X_QUAD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctrl-&gt;setup =3D npcm_fiu_setup;<br>
<br>
I&#39;m not seeing where we implement dual or quad modes in the driver?<br>
There&#39;s some <br>
<br></blockquote><div>=C2=A0</div><div>Do you mean you do not see where it =
is implemented in the NPCM FIU driver?</div><div><br></div><div>for example=
 in our driver we modify the access type (singe, dual or quad) according th=
e=C2=A0<span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;=
font-size:11pt">op-&gt;addr.buswidth</span></div><div>for example in the=C2=
=A0<span style=3D"font-weight:bolder;color:rgb(0,0,0);font-family:&quot;Cou=
rier New&quot;;font-size:11pt">npcm_fiu_set_drd function.</span></div><div>=
<div style=3D"font-family:&quot;Courier New&quot;;font-size:11pt;color:rgb(=
0,0,0)">
<pre>        <span style=3D"font-weight:bolder">regmap_update_bits</span>(f=
iu-&gt;regmap, NPCM_FIU_DRD_CFG,
                           NPCM_FIU_DRD_CFG_ACCTYPE,
                           <span style=3D"font-weight:bolder">ilog2</span>(=
op-&gt;addr.buswidth) &lt;&lt;
                           NPCM_FIU_DRD_ACCTYPE_SHIFT);
</pre></div></div><div>we also modify it in the UMA R/W functions.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;NPCM %s probe succeed\n&quot;=
, fiu-&gt;info-&gt;name);<br>
<br>
Just remove this, it makes the log more verbose but doesn&#39;t really add<=
br>
any information.<br></blockquote><div><br></div><div>I will remove it.</div=
><div><br></div><div>Thanks,</div><div><br></div><div>Tomer=C2=A0</div></di=
v></div>

--000000000000f45bbc058f9cb6ba--
