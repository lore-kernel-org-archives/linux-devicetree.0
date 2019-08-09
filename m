Return-Path: <SRS0=iwVP=WF=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com> <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808173232.4d79d698@collabora.com> <CAP6Zq1iW0C0FDOoqmn5r_xk5HQFWw+GgLfeapvt-8mB50N2Vvg@mail.gmail.com>
 <20190809172557.346e7c41@collabora.com>
In-Reply-To: <20190809172557.346e7c41@collabora.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Aug 2019 18:47:08 +0300
Message-ID: <CAP6Zq1hc0kNHzCE6tcLZdv7NcNWEdn5nh=Wzd8pdbZTuj31Hbg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
Content-Type: multipart/alternative; boundary="000000000000bc86e8058fb0f8e0"
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, linux-spi@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000bc86e8058fb0f8e0
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019 at 18:26, Boris Brezillon <boris.brezillon@collabora.com>
wrote:

> On Fri, 9 Aug 2019 18:26:23 +0300
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > Hi Boris,
> >
> > Thanks a lot for your comment.
> >
> > On Thu, 8 Aug 2019 at 18:32, Boris Brezillon <
> boris.brezillon@collabora.com>
> > wrote:
> >
> > > On Thu,  8 Aug 2019 16:14:48 +0300
> > > Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > >
> > > > +
> > > > +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> > > > +     .exec_op = npcm_fiu_exec_op,
> > >
> > > No npcm_supports_op()? That's suspicious, especially after looking at
> > > the npcm_fiu_exec_op() (and the functions called from there) where the
> > > requested ->buswidth seems to be completely ignored...
> > >
> > > Sorry but I do not fully understand it, do you mean a support for the
> > buswidth?
> > If yes it been done in the UMA functions as follow:
> >
> >                 uma_cfg |= ilog2(op->cmd.buswidth);
> >                 uma_cfg |= ilog2(op->addr.buswidth) <<
> >                         NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
> >                 uma_cfg |= ilog2(op->data.buswidth) <<
> >                         NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
> >                 uma_cfg |= op->addr.nbytes <<
> NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
> >                 regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR,
> op->addr.val);
> >
>
> Hm, the default supports_op() implementation might be just fine for
> your use case. But there's one thing you still need to check: the
> number of addr cycles (or address size as you call it in this driver).
> Looks like your IP is limited to 4 address cycles, if I'm right, you
> should reject any operation that have op->addr.nbytes > 4. I also
>
Indeed our IP limited to 4 address cycle (bytes) do we have NOR Flash with
more than 32bit address?
I will add this limitation thanks!

> wonder if there's a limitation on the data size you can have on a
> single transfer. If there's one you should implement ->adjust_op() too.
>
there is a limitation in a single transfer but I handle it in the
npcm_fiu_manualwrite
function.
Do you suggest to use ->adjust_op() instead?

--000000000000bc86e8058fb0f8e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 Aug 2019 at 18:26, Boris Br=
ezillon &lt;<a href=3D"mailto:boris.brezillon@collabora.com">boris.brezillo=
n@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Fri, 9 Aug 2019 18:26:23 +0300<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi Boris,<br>
&gt; <br>
&gt; Thanks a lot for your comment.<br>
&gt; <br>
&gt; On Thu, 8 Aug 2019 at 18:32, Boris Brezillon &lt;<a href=3D"mailto:bor=
is.brezillon@collabora.com" target=3D"_blank">boris.brezillon@collabora.com=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu,=C2=A0 8 Aug 2019 16:14:48 +0300<br>
&gt; &gt; Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D=
"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct spi_controller_mem_ops npcm_fiu_mem_ops=
 =3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.exec_op =3D npcm_fiu_exec_op,=C2=A0 <b=
r>
&gt; &gt;<br>
&gt; &gt; No npcm_supports_op()? That&#39;s suspicious, especially after lo=
oking at<br>
&gt; &gt; the npcm_fiu_exec_op() (and the functions called from there) wher=
e the<br>
&gt; &gt; requested -&gt;buswidth seems to be completely ignored...<br>
&gt; &gt;<br>
&gt; &gt; Sorry but I do not fully understand it, do you mean a support for=
 the=C2=A0 <br>
&gt; buswidth?<br>
&gt; If yes it been done in the UMA functions as follow:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=
=3D ilog2(op-&gt;cmd.buswidth);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=
=3D ilog2(op-&gt;addr.buswidth) &lt;&lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=
=3D ilog2(op-&gt;data.buswidth) &lt;&lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=
=3D op-&gt;addr.nbytes &lt;&lt; NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_wr=
ite(fiu-&gt;regmap, NPCM_FIU_UMA_ADDR, op-&gt;addr.val);<br>
&gt;<br>
<br>
Hm, the default supports_op() implementation might be just fine for<br>
your use case. But there&#39;s one thing you still need to check: the<br>
number of addr cycles (or address size as you call it in this driver).<br>
Looks like your IP is limited to 4 address cycles, if I&#39;m right, you<br=
>
should reject any operation that have op-&gt;addr.nbytes &gt; 4. I also<br>=
</blockquote><div>Indeed our IP limited to 4 address cycle (bytes) do we ha=
ve NOR Flash with more than 32bit address?</div><div>I will add this limita=
tion thanks!=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
wonder if there&#39;s a limitation on the data size you can have on a<br>
single transfer. If there&#39;s one you should implement -&gt;adjust_op() t=
oo.<br></blockquote><div>there is a limitation in a single transfer but I h=
andle it in the=C2=A0<span style=3D"font-weight:bolder;color:rgb(0,0,0);fon=
t-family:&quot;Courier New&quot;;font-size:11pt">npcm_fiu_manualwrite </spa=
n><span style=3D"font-weight:bolder;color:rgb(0,0,0);font-size:11pt"><font =
face=3D"arial, sans-serif">function</font></span><span style=3D"font-weight=
:bolder;color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-size:11pt=
">.</span></div><div><font face=3D"arial, sans-serif"><font color=3D"#00000=
0" style=3D"">Do you suggest to use=C2=A0</font>-&gt;adjust_op() instead?</=
font></div><div><font face=3D"arial, sans-serif"><br></font></div><div><br>=
</div></div></div>

--000000000000bc86e8058fb0f8e0--
