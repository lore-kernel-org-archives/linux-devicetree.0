Return-Path: <SRS0=iwVP=WF=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com> <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808173232.4d79d698@collabora.com> <CAP6Zq1iW0C0FDOoqmn5r_xk5HQFWw+GgLfeapvt-8mB50N2Vvg@mail.gmail.com>
 <20190809172557.346e7c41@collabora.com> <CAP6Zq1hc0kNHzCE6tcLZdv7NcNWEdn5nh=Wzd8pdbZTuj31Hbg@mail.gmail.com>
 <20190809175140.77747c8d@collabora.com>
In-Reply-To: <20190809175140.77747c8d@collabora.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Aug 2019 19:19:12 +0300
Message-ID: <CAP6Zq1g7atvoqYMZpe0DZGCf+6vUtVbD-j5T8ZAtLBPJ3w4S3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
Content-Type: multipart/alternative; boundary="000000000000623893058fb16bf2"
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, linux-spi@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000623893058fb16bf2
Content-Type: text/plain; charset="UTF-8"

O.K.

Thanks a lot for the clarifications

I will add it in the next patch.

On Fri, 9 Aug 2019 at 18:51, Boris Brezillon <boris.brezillon@collabora.com>
wrote:

> On Fri, 9 Aug 2019 18:47:08 +0300
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > On Fri, 9 Aug 2019 at 18:26, Boris Brezillon <
> boris.brezillon@collabora.com>
> > wrote:
> >
> > > On Fri, 9 Aug 2019 18:26:23 +0300
> > > Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > > > Hi Boris,
> > > >
> > > > Thanks a lot for your comment.
> > > >
> > > > On Thu, 8 Aug 2019 at 18:32, Boris Brezillon <
> > > boris.brezillon@collabora.com>
> > > > wrote:
> > > >
> > > > > On Thu,  8 Aug 2019 16:14:48 +0300
> > > > > Tomer Maimon <tmaimon77@gmail.com> wrote:
> > > > >
> > > > >
> > > > > > +
> > > > > > +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> > > > > > +     .exec_op = npcm_fiu_exec_op,
> > > > >
> > > > > No npcm_supports_op()? That's suspicious, especially after looking
> at
> > > > > the npcm_fiu_exec_op() (and the functions called from there) where
> the
> > > > > requested ->buswidth seems to be completely ignored...
> > > > >
> > > > > Sorry but I do not fully understand it, do you mean a support for
> the
> > > > buswidth?
> > > > If yes it been done in the UMA functions as follow:
> > > >
> > > >                 uma_cfg |= ilog2(op->cmd.buswidth);
> > > >                 uma_cfg |= ilog2(op->addr.buswidth) <<
> > > >                         NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
> > > >                 uma_cfg |= ilog2(op->data.buswidth) <<
> > > >                         NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
> > > >                 uma_cfg |= op->addr.nbytes <<
> > > NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
> > > >                 regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR,
> > > op->addr.val);
> > > >
> > >
> > > Hm, the default supports_op() implementation might be just fine for
> > > your use case. But there's one thing you still need to check: the
> > > number of addr cycles (or address size as you call it in this driver).
> > > Looks like your IP is limited to 4 address cycles, if I'm right, you
> > > should reject any operation that have op->addr.nbytes > 4. I also
> > >
> > Indeed our IP limited to 4 address cycle (bytes) do we have NOR Flash
> with
> > more than 32bit address?
>
> spi-mem is not only about spi-nor, it can be used for any kind of
> memory (NOR, NAND, SRAM, ...) or even to communicate with an FGPA, so
> yes, you have to take care of that.
>
> > I will add this limitation thanks!
> >
> > > wonder if there's a limitation on the data size you can have on a
> > > single transfer. If there's one you should implement ->adjust_op() too.
> > >
> > there is a limitation in a single transfer but I handle it in the
> > npcm_fiu_manualwrite
> > function.
> > Do you suggest to use ->adjust_op() instead?
>
> Yes, should be exposed through ->adjust_op() => the caller needs to
> know when a new operation (one containing an opcode+address) is issued,
> because sometimes such splits are not supported by the memory.
>
>

--000000000000623893058fb16bf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">O.K.<div><br></div><div>Thanks a lot for the clarification=
s</div><div><br></div><div>I will add it in the next patch.</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 =
Aug 2019 at 18:51, Boris Brezillon &lt;<a href=3D"mailto:boris.brezillon@co=
llabora.com">boris.brezillon@collabora.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Fri, 9 Aug 2019 18:47:08 +0300=
<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; On Fri, 9 Aug 2019 at 18:26, Boris Brezillon &lt;<a href=3D"mailto:bor=
is.brezillon@collabora.com" target=3D"_blank">boris.brezillon@collabora.com=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Fri, 9 Aug 2019 18:26:23 +0300<br>
&gt; &gt; Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D=
"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; Hi Boris,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks a lot for your comment.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 8 Aug 2019 at 18:32, Boris Brezillon &lt;<br>
&gt; &gt; <a href=3D"mailto:boris.brezillon@collabora.com" target=3D"_blank=
">boris.brezillon@collabora.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; On Thu,=C2=A0 8 Aug 2019 16:14:48 +0300<br>
&gt; &gt; &gt; &gt; Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +static const struct spi_controller_mem_ops npcm_f=
iu_mem_ops =3D {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.exec_op =3D npcm_fiu_exec_op=
,=C2=A0 <br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; No npcm_supports_op()? That&#39;s suspicious, especiall=
y after looking at<br>
&gt; &gt; &gt; &gt; the npcm_fiu_exec_op() (and the functions called from t=
here) where the<br>
&gt; &gt; &gt; &gt; requested -&gt;buswidth seems to be completely ignored.=
..<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Sorry but I do not fully understand it, do you mean a s=
upport for the=C2=A0 <br>
&gt; &gt; &gt; buswidth?<br>
&gt; &gt; &gt; If yes it been done in the UMA functions as follow:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uma_cfg |=3D ilog2(op-&gt;cmd.buswidth);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uma_cfg |=3D ilog2(op-&gt;addr.buswidth) &lt;&lt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uma_cfg |=3D ilog2(op-&gt;data.buswidth) &lt;&lt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uma_cfg |=3D op-&gt;addr.nbytes &lt;&lt;=C2=A0 <br>
&gt; &gt; NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0regmap_write(fiu-&gt;regmap, NPCM_FIU_UMA_ADDR,=C2=A0 <br>
&gt; &gt; op-&gt;addr.val);=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Hm, the default supports_op() implementation might be just fine f=
or<br>
&gt; &gt; your use case. But there&#39;s one thing you still need to check:=
 the<br>
&gt; &gt; number of addr cycles (or address size as you call it in this dri=
ver).<br>
&gt; &gt; Looks like your IP is limited to 4 address cycles, if I&#39;m rig=
ht, you<br>
&gt; &gt; should reject any operation that have op-&gt;addr.nbytes &gt; 4. =
I also<br>
&gt; &gt;=C2=A0 <br>
&gt; Indeed our IP limited to 4 address cycle (bytes) do we have NOR Flash =
with<br>
&gt; more than 32bit address?<br>
<br>
spi-mem is not only about spi-nor, it can be used for any kind of<br>
memory (NOR, NAND, SRAM, ...) or even to communicate with an FGPA, so<br>
yes, you have to take care of that.<br>
<br>
&gt; I will add this limitation thanks!<br>
&gt; <br>
&gt; &gt; wonder if there&#39;s a limitation on the data size you can have =
on a<br>
&gt; &gt; single transfer. If there&#39;s one you should implement -&gt;adj=
ust_op() too.<br>
&gt; &gt;=C2=A0 <br>
&gt; there is a limitation in a single transfer but I handle it in the<br>
&gt; npcm_fiu_manualwrite<br>
&gt; function.<br>
&gt; Do you suggest to use -&gt;adjust_op() instead?<br>
<br>
Yes, should be exposed through -&gt;adjust_op() =3D&gt; the caller needs to=
<br>
know when a new operation (one containing an opcode+address) is issued,<br>
because sometimes such splits are not supported by the memory.<br>
<br>
</blockquote></div>

--000000000000623893058fb16bf2--
