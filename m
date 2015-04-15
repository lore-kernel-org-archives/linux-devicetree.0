Return-Path: <jcliang@google.com>
MIME-Version: 1.0
References: <1428986165-6250-1-git-send-email-jcliang@chromium.org> <20150415121515.8E1FAC40A0B@trevor.secretlab.ca>
In-Reply-To: <20150415121515.8E1FAC40A0B@trevor.secretlab.ca>
From: Ricky Liang <jcliang@chromium.org>
Date: Wed, 15 Apr 2015 12:37:07 +0000
Message-ID: <CAAJzSMdy0PdrtEUT+mU4X9DM9Rv51+tTH0eOG_RydQ95VcSMbA@mail.gmail.com>
Subject: Re: [PATCH] of/fdt: fix allocation size for device node path
Content-Type: multipart/alternative; boundary=90e6ba614f6ef4ad700513c29a4c
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--90e6ba614f6ef4ad700513c29a4c
Content-Type: text/plain; charset=UTF-8

Yes I agree. I'm not familiar with the kernel patch backport
process. Should I be the one doing the backport?

On Wed, Apr 15, 2015 at 8:15 PM Grant Likely <grant.likely@linaro.org>
wrote:

> On Tue, 14 Apr 2015 12:36:05 +0800
> , Ricky Liang <jcliang@chromium.org>
>  wrote:
> > The allocation size of device node path is off by one which drops the
> > '\0' terminator.
> >
> > Signed-off-by: Ricky Liang <jcliang@chromium.org>
>
> This looks like something that should be backported to stable. Do you
> agree?
>
> g.
>
> > ---
> >  drivers/of/fdt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 3a896c9..98a9e6e 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -172,7 +172,7 @@ static void * unflatten_dt_node(void *blob,
> >       if (!pathp)
> >               return mem;
> >
> > -     allocl = l++;
> > +     allocl = ++l;
> >
> >       /* version 0x10 has a more compact unit name here instead of the
> full
> >        * path. we accumulate the full path size using "fpsize", we'll
> rebuild
> > --
> > 2.1.2
> >
>
>

--90e6ba614f6ef4ad700513c29a4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes I agree. I&#39;m not familiar with the kernel patch ba=
ckport process.=C2=A0Should I be the one doing the backport?<br><br><div cl=
ass=3D"gmail_quote">On Wed, Apr 15, 2015 at 8:15 PM Grant Likely &lt;<a hre=
f=3D"mailto:grant.likely@linaro.org">grant.likely@linaro.org</a>&gt; wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Tue, 14 Apr 2015 12:36:05 +0800<br>
, Ricky Liang &lt;<a href=3D"mailto:jcliang@chromium.org" target=3D"_blank"=
>jcliang@chromium.org</a>&gt;<br>
=C2=A0wrote:<br>
&gt; The allocation size of device node path is off by one which drops the<=
br>
&gt; &#39;\0&#39; terminator.<br>
&gt;<br>
&gt; Signed-off-by: Ricky Liang &lt;<a href=3D"mailto:jcliang@chromium.org"=
 target=3D"_blank">jcliang@chromium.org</a>&gt;<br>
<br>
This looks like something that should be backported to stable. Do you agree=
?<br>
<br>
g.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/of/fdt.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c<br>
&gt; index 3a896c9..98a9e6e 100644<br>
&gt; --- a/drivers/of/fdt.c<br>
&gt; +++ b/drivers/of/fdt.c<br>
&gt; @@ -172,7 +172,7 @@ static void * unflatten_dt_node(void *blob,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pathp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return mem;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0allocl =3D l++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0allocl =3D ++l;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* version 0x10 has a more compact unit name=
 here instead of the full<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * path. we accumulate the full path size us=
ing &quot;fpsize&quot;, we&#39;ll rebuild<br>
&gt; --<br>
&gt; 2.1.2<br>
&gt;<br>
<br>
</blockquote></div></div>

--90e6ba614f6ef4ad700513c29a4c--
