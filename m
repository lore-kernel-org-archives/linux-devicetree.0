Return-Path: <SRS0=YgUL=JG=gmail.com=toddpoynor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <43fca3e7-4ba5-661f-0871-fedd9ff67673@gmail.com>
References: <20180619014608.92061-1-toddpoynor@gmail.com> <43fca3e7-4ba5-661f-0871-fedd9ff67673@gmail.com>
From: Todd Poynor <toddpoynor@gmail.com>
Date: Tue, 19 Jun 2018 19:32:05 -0700
Message-ID: <CAO3upoZLk2zDdLJr1hieY-rqmG1Y4see3RSYi5mOsbNBaugyKA@mail.gmail.com>
Subject: Re: [PATCH] of/platform: add initcall_debug logs for device creates
Content-Type: multipart/alternative; boundary="000000000000c852b8056f099a81"
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Android Kernel Team <kernel-team@android.com>, Todd Poynor <toddpoynor@google.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000c852b8056f099a81
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 8:11 AM, Frank Rowand <frowand.list@gmail.com>
wrote:

> Hi Todd,
>

Hey Frank, long time!


> > +     pr_debug("of platform device create %s took %lld usecs\n",
> > +              node->full_name, duration);
>
> The device node full_name field no longer contains the full path of
> the node name.  To deal with this, use %pOF on node instead of
> %s on node->full_name  (core-api/printk-formats.rst).
>

OK, the touched up patch just uses dev_name() in common code, can do
something nicer for OF nodes if possible.

>
>
> > +}
> > +
> >  /**
> >   * of_platform_device_create_pdata - Alloc, initialize and register an
> of_device
> >   * @np: pointer to node to create device for
> > @@ -176,6 +190,8 @@ static struct platform_device
> *of_platform_device_create_pdata(
> >                                       struct device *parent)
> >  {
> >       struct platform_device *dev;
> > +     ktime_t starttime = 0;
>
> I assume the initialization to zero is to silence a compiler warning.  Is
> my
> assumption correct?
>

Right, "may be used uninitialized".  This goes away in the new code as well.

Thanks -- Todd

--000000000000c852b8056f099a81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 19, 2018 at 8:11 AM, Frank Rowand <span dir=3D"ltr">&lt;<a href=3D"=
mailto:frowand.list@gmail.com" target=3D"_blank">frowand.list@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Todd,<br></blockquo=
te><div><br></div><div>Hey Frank, long time!<br>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
<span class=3D"">
&gt; +=C2=A0 =C2=A0 =C2=A0pr_debug(&quot;of platform device create %s took =
%lld usecs\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node-&gt;full_name, =
duration);<br>
<br>
</span>The device node full_name field no longer contains the full path of<=
br>
the node name.=C2=A0 To deal with this, use %pOF on node instead of<br>
%s on node-&gt;full_name=C2=A0 (core-api/printk-formats.rst).<br></blockquo=
te><div><br></div><div>OK, the touched up patch just uses dev_name() in com=
mon code, can do something nicer for OF nodes if possible. <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<span class=3D""><br>
<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* of_platform_device_create_<wbr>pdata - Alloc, initialize=
 and register an of_device<br>
&gt;=C2=A0 =C2=A0* @np: pointer to node to create device for<br>
&gt; @@ -176,6 +190,8 @@ static struct platform_device *of_platform_device_=
create_<wbr>pdata(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 device *parent)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ktime_t starttime =3D 0;<br>
<br>
</span>I assume the initialization to zero is to silence a compiler warning=
.=C2=A0 Is my<br>
assumption correct?<br></blockquote><div><br></div><div>Right, &quot;may be=
 used uninitialized&quot;.=C2=A0 This goes away in the new code as well.<br=
><br></div><div>Thanks -- Todd<br></div></div><div class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature"><br></div>
</div></div>

--000000000000c852b8056f099a81--
