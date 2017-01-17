Return-Path: <SRS0=Jz1C=Y7=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1484577528.8415.147.camel@pengutronix.de>
References: <1484564194-18530-1-git-send-email-baoyou.xie@linaro.org>
 <1484564194-18530-2-git-send-email-baoyou.xie@linaro.org> <1484577528.8415.147.camel@pengutronix.de>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Tue, 17 Jan 2017 08:49:15 +0800
Message-ID: <CA+DQWkzVUPcUgDV1NLVb7zD-Vmj5kttaLuib3m=JfxRV6MC5=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MAINTAINERS: add zx2967 reset controller driver to
 ARM ZTE architecture
Content-Type: multipart/alternative; boundary=001a11445d946a403e05463fabf4
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jun Nie <jun.nie@linaro.org>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a11445d946a403e05463fabf4
Content-Type: text/plain; charset=UTF-8

On 16 January 2017 at 22:38, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Mon, 2017-01-16 at 18:56 +0800, Baoyou Xie wrote:
> > Add the zx2967 reset controller driver as maintained by ARM ZTE
> > architecture maintainers, as they're parts of the core IP.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2793808..08f8155 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1980,10 +1980,12 @@ L:    linux-arm-kernel@lists.infradead.org
> (moderated for non-subscribers)
> >  S:   Maintained
> >  F:   arch/arm/mach-zx/
> >  F:   drivers/clk/zte/
> > +F:   drivers/reset/reset-zx2967.c
> >  F:   drivers/soc/zte/
> >  F:   drivers/thermal/zx*
> >  F:   Documentation/devicetree/bindings/arm/zte.txt
> >  F:   Documentation/devicetree/bindings/clock/zx296702-clk.txt
> > +F:   Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
> >  F:   Documentation/devicetree/bindings/soc/zte/
> >  F:   Documentation/devicetree/bindings/thermal/zx*
> >  F:   include/dt-bindings/soc/zx*.h
>
> This patch doesn't apply on top of reset/next. I can rebase it, but it
> will cause a trivial merge conflict with the soc/thermal additions.
>
> I will send v3 patch, it base on linux/next branch and conflict without
the soc/thermal additions


> regards
> Philipp
>
>

--001a11445d946a403e05463fabf4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 16 January 2017 at 22:38, Philipp Zabel <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:p.zabel@pengutronix.de" target=3D"_blank">p.zabel@pengutronix.d=
e</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><span class=3D"gmail-">On Mon, 2017-01-16 at 18:56 +0800, Baoyou Xie wrot=
e:<br>
&gt; Add the zx2967 reset controller driver as maintained by ARM ZTE<br>
&gt; architecture maintainers, as they&#39;re parts of the core IP.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 2793808..08f8155 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -1980,10 +1980,12 @@ L:=C2=A0 =C2=A0 <a href=3D"mailto:linux-arm-ke=
rnel@lists.infradead.org">linux-arm-kernel@lists.<wbr>infradead.org</a> (mo=
derated for non-subscribers)<br>
&gt;=C2=A0 S:=C2=A0 =C2=A0Maintained<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0arch/arm/mach-zx/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/clk/zte/<br>
&gt; +F:=C2=A0 =C2=A0drivers/reset/reset-zx2967.c<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/soc/zte/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/thermal/zx*<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/arm/zte.tx=
t<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/clock/zx29=
6702-clk.<wbr>txt<br>
&gt; +F:=C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/reset/zte,zx296=
7-<wbr>reset.txt<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/soc/zte/<b=
r>
&gt;=C2=A0 F:=C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/thermal/zx=
*<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0include/dt-bindings/soc/zx*.h<br>
<br>
</span>This patch doesn&#39;t apply on top of reset/next. I can rebase it, =
but it<br>
will cause a trivial merge conflict with the soc/thermal additions.<br>
<br></blockquote><div>I will send v3 patch, it base on linux/next branch an=
d conflict without the soc/thermal additions</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
regards<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">Philipp<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11445d946a403e05463fabf4--
