Return-Path: <SRS0=iwVP=WF=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com> <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808173232.4d79d698@collabora.com>
In-Reply-To: <20190808173232.4d79d698@collabora.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Aug 2019 18:26:23 +0300
Message-ID: <CAP6Zq1iW0C0FDOoqmn5r_xk5HQFWw+GgLfeapvt-8mB50N2Vvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
Content-Type: multipart/alternative; boundary="0000000000008275f7058fb0aee6"
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, linux-spi@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--0000000000008275f7058fb0aee6
Content-Type: text/plain; charset="UTF-8"

Hi Boris,

Thanks a lot for your comment.

On Thu, 8 Aug 2019 at 18:32, Boris Brezillon <boris.brezillon@collabora.com>
wrote:

> On Thu,  8 Aug 2019 16:14:48 +0300
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>
> > +
> > +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> > +     .exec_op = npcm_fiu_exec_op,
>
> No npcm_supports_op()? That's suspicious, especially after looking at
> the npcm_fiu_exec_op() (and the functions called from there) where the
> requested ->buswidth seems to be completely ignored...
>
> Sorry but I do not fully understand it, do you mean a support for the
buswidth?
If yes it been done in the UMA functions as follow:

                uma_cfg |= ilog2(op->cmd.buswidth);
                uma_cfg |= ilog2(op->addr.buswidth) <<
                        NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
                uma_cfg |= ilog2(op->data.buswidth) <<
                        NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
                uma_cfg |= op->addr.nbytes << NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
                regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, op->addr.val);

> +     .dirmap_create = npcm_fiu_dirmap_create,
> > +     .dirmap_read = npcm_fiu_direct_read,
> > +     .dirmap_write = npcm_fiu_direct_write,
> > +};
> > +
>

Thanks,

Tomer

--0000000000008275f7058fb0aee6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Boris,<div><br></div><div>Th=
anks a lot for your comment.</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, 8 Aug 2019 at 18:32, Boris Brezill=
on &lt;<a href=3D"mailto:boris.brezillon@collabora.com">boris.brezillon@col=
labora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu,=C2=A0 8 Aug 2019 16:14:48 +0300<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
<br>
&gt; +<br>
&gt; +static const struct spi_controller_mem_ops npcm_fiu_mem_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.exec_op =3D npcm_fiu_exec_op,<br>
<br>
No npcm_supports_op()? That&#39;s suspicious, especially after looking at<b=
r>
the npcm_fiu_exec_op() (and the functions called from there) where the<br>
requested -&gt;buswidth seems to be completely ignored...<br>
<br></blockquote><div>Sorry but I do not fully understand it, do you mean a=
 support for the buswidth?</div><div>If yes it been done in the UMA functio=
ns as follow:</div><div><div style=3D"font-family:&quot;Courier New&quot;;f=
ont-size:11pt;color:rgb(0,0,0)">
<pre>                uma_cfg |=3D <span style=3D"font-weight:bolder">ilog2<=
/span>(op-&gt;cmd.buswidth);
                uma_cfg |=3D <span style=3D"font-weight:bolder">ilog2</span=
>(op-&gt;addr.buswidth) &lt;&lt;
                        NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
                uma_cfg |=3D <span style=3D"font-weight:bolder">ilog2</span=
>(op-&gt;data.buswidth) &lt;&lt;
                        NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
                uma_cfg |=3D op-&gt;addr.nbytes &lt;&lt; NPCM_FIU_UMA_CFG_A=
DDSIZ_SHIFT;
                <span style=3D"font-weight:bolder">regmap_write</span>(fiu-=
&gt;regmap, NPCM_FIU_UMA_ADDR, op-&gt;addr.val);
</pre></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0.dirmap_create =3D npcm_fiu_dirmap_create,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dirmap_read =3D npcm_fiu_direct_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dirmap_write =3D npcm_fiu_direct_write,<br>
&gt; +};<br>
&gt; +<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div=
>Tomer=C2=A0</div></div></div></div>

--0000000000008275f7058fb0aee6--
