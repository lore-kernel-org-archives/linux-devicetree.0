Return-Path: <guodong.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5552254.5pm4SI4ary@phil>
References: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org>
	<1459322696-29919-3-git-send-email-guodong.xu@linaro.org>
	<5552254.5pm4SI4ary@phil>
Date: Sat, 2 Apr 2016 21:39:11 +0800
Message-ID: <CAFGCpxzUBUvMLWHUmd1WYDM7Do0J=QvaNbVQYMi_cQEhbV9-1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: dw_mmc: add resets support to dw_mmc
From: Guodong Xu <guodong.xu@linaro.org>
Content-Type: multipart/alternative; boundary=047d7b3a93a0e88d15052f809e31
To: Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Jaehoon Chung <jh80.chung@samsung.com>, robh+dt@kernel.org, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--047d7b3a93a0e88d15052f809e31
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 April 2016 at 02:42, Heiko Stuebner <heiko@sntech.de> wrote:

> Am Mittwoch, 30. M=C3=A4rz 2016, 15:24:56 schrieb Guodong Xu:
>
> [...]
>
> > @@ -2949,7 +2956,9 @@ int dw_mci_probe(struct dw_mci *host)
> >
> >       if (!host->pdata) {
> >               host->pdata =3D dw_mci_parse_dt(host);
> > -             if (IS_ERR(host->pdata)) {
> > +             if (PTR_ERR(host->pdata) =3D=3D -EPROBE_DEFER) {
> > +                     return -EPROBE_DEFER;
> > +             } else if (IS_ERR(host->pdata)) {
>
> how is this related to adding the reset handling?
>

I added this into dw_mci_parse_dt(host), and that's the first time it may
return -EPROBE_DEFER

  /* find reset controller when exist */
  pdata->rstc =3D devm_reset_control_get_optional(dev, NULL);

So, I added processing to this error in this patch.


> Making the driver handle probe deferral better should be a separate patch=
.
>


>
> >                       dev_err(host->dev, "platform data not
> available\n");
> >                       return -EINVAL;
> >               }
> > @@ -3012,6 +3021,9 @@ int dw_mci_probe(struct dw_mci *host)
> >               }
> >       }
> >
> > +     if (!IS_ERR(host->pdata->rstc))
> > +             reset_control_deassert(host->pdata->rstc);
> > +
>
> Wouldn't reset_control_reset be better? The way it is now it would expect
> the reset to be asserted somewhere else before dw_mmc probes?
>

It relates to how the SoC's reset logic is like. One bit set can clear all
dw_mmc host controller registers. It doesn't need do assert then deassert.

That's what I saw in hi6220 (it integrates three dw_mmc host controller),
drivers/reset/hisilicon/hi6220_reset.c
, which I wrote this patch for.


>
>
> >       setup_timer(&host->cmd11_timer,
> >                   dw_mci_cmd11_timer, (unsigned long)host);
> >
>
> [...]
>
> > diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_mmc.h
> > index 7b41c6d..b95cd84 100644
> > --- a/include/linux/mmc/dw_mmc.h
> > +++ b/include/linux/mmc/dw_mmc.h
> > @@ -14,9 +14,10 @@
> >  #ifndef LINUX_MMC_DW_MMC_H
> >  #define LINUX_MMC_DW_MMC_H
> >
> > -#include <linux/scatterlist.h>
> > -#include <linux/mmc/core.h>
> >  #include <linux/dmaengine.h>
> > +#include <linux/mmc/core.h>
> > +#include <linux/reset.h>
> > +#include <linux/scatterlist.h>
>
> unrelated changed regarding the reordering of includes.
>
>
Making them in the order of alphabetic. If you dislike, I will not add.

-Guodong


> Heiko
>

--047d7b3a93a0e88d15052f809e31
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 2 April 2016 at 02:42, Heiko Stuebner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:heiko@sntech.de" target=3D"_blank">heiko@sntech.de</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">Am Mittwoch, 30. M=C3=A4rz 2016, 15:24:56 schr=
ieb Guodong Xu:<br>
<br>
[...]<br>
<span class=3D""><br>
&gt; @@ -2949,7 +2956,9 @@ int dw_mci_probe(struct dw_mci *host)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!host-&gt;pdata) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;pdata =
=3D dw_mci_parse_dt(host);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(host-&gt;p=
data)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PTR_ERR(host-&gt;=
pdata) =3D=3D -EPROBE_DEFER) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EPROBE_DEFER;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (IS_ERR(hos=
t-&gt;pdata)) {<br>
<br>
</span>how is this related to adding the reset handling?<br></blockquote><d=
iv><br></div><div>I added this into dw_mci_parse_dt(host), and that&#39;s t=
he first time it may return -EPROBE_DEFER=C2=A0</div><div><br></div><div><d=
iv>=C2=A0 /* find reset controller when exist */</div><div>=C2=A0 pdata-&gt=
;rstc =3D devm_reset_control_get_optional(dev, NULL);=C2=A0</div></div><div=
><br></div><div>So, I added processing to this error in this patch.</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><br>
Making the driver handle probe deferral better should be a separate patch.<=
br></blockquote><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex">
<span class=3D""><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dev_err(host-&gt;dev, &quot;platform data not available\n&quot=
;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -3012,6 +3021,9 @@ int dw_mci_probe(struct dw_mci *host)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!IS_ERR(host-&gt;pdata-&gt;rstc))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset_control_deasser=
t(host-&gt;pdata-&gt;rstc);<br>
&gt; +<br>
<br>
</span>Wouldn&#39;t reset_control_reset be better? The way it is now it wou=
ld expect<br>
the reset to be asserted somewhere else before dw_mmc probes?<br></blockquo=
te><div><br></div><div>It relates to how the SoC&#39;s reset logic is like.=
 One bit set can clear all dw_mmc host controller registers. It doesn&#39;t=
 need do assert then deassert.</div><div><br></div><div>That&#39;s what I s=
aw in hi6220 (it integrates three dw_mmc host controller), drivers/reset/hi=
silicon/hi6220_reset.c</div><div>, which I wrote this patch for.</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex">
<span class=3D""><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0setup_timer(&amp;host-&gt;cmd11_timer,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dw=
_mci_cmd11_timer, (unsigned long)host);<br>
&gt;<br>
<br>
</span>[...]<br>
<span class=3D""><br>
&gt; diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_mmc.h<b=
r>
&gt; index 7b41c6d..b95cd84 100644<br>
&gt; --- a/include/linux/mmc/dw_mmc.h<br>
&gt; +++ b/include/linux/mmc/dw_mmc.h<br>
&gt; @@ -14,9 +14,10 @@<br>
&gt;=C2=A0 #ifndef LINUX_MMC_DW_MMC_H<br>
&gt;=C2=A0 #define LINUX_MMC_DW_MMC_H<br>
&gt;<br>
&gt; -#include &lt;linux/scatterlist.h&gt;<br>
&gt; -#include &lt;linux/mmc/core.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/dmaengine.h&gt;<br>
&gt; +#include &lt;linux/mmc/core.h&gt;<br>
&gt; +#include &lt;linux/reset.h&gt;<br>
&gt; +#include &lt;linux/scatterlist.h&gt;<br>
<br>
</span>unrelated changed regarding the reordering of includes.<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><di=
v><br></div><div>Making them in the order of alphabetic. If you dislike, I =
will not add.</div><div>=C2=A0</div><div>-Guodong</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddin=
g-left:1ex"><span class=3D""><font color=3D"#888888">
<br>
Heiko<br>
</font></span></blockquote></div><br></div></div>

--047d7b3a93a0e88d15052f809e31--
