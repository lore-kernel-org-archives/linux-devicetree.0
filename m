Return-Path: <gshark.jeong@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140704163119.GB7106@leverpostej>
References: <1404367277-12003-1-git-send-email-gshark.jeong@gmail.com>
	<1404367277-12003-3-git-send-email-gshark.jeong@gmail.com>
	<20140703090447.GC29837@leverpostej>
	<CAPqQCJUYqgireOiqK9DLpSAkw_4DdmKD+G7bXxVxf=bb0nTj6Q@mail.gmail.com>
	<20140704163119.GB7106@leverpostej>
Date: Mon, 7 Jul 2014 10:19:34 +0900
Message-ID: <CAPqQCJVsNiOpRkkpprRPpeJUVwrz51MdF77JtD+_4JmvqLGMzQ@mail.gmail.com>
Subject: Re: [RFC v4 2/2] backlight: device tree: add new tps611xx backlight binding
From: Daniel Jeong <gshark.jeong@gmail.com>
Content-Type: multipart/alternative; boundary=089e012949869a2c1004fd90447f
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Bryan Wu <cooloney@gmail.com>, Lee Jones <lee.jones@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel Jeong <daniel.jeong@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--089e012949869a2c1004fd90447f
Content-Type: text/plain; charset=UTF-8

Hi.

2014-07-05 1:31 GMT+09:00 Mark Rutland <mark.rutland@arm.com>:

> >     > +- rfa-enable: enable request for acknowledge.
> >     > +  If RFA is enabled, the data byte includes the RFA bit and
> device will
> >     wait
> >     > +  and check acknowledge from device.
> >
> >     You didn't answer my question as to why this should be in the DT.
> >
> >
> > According to the RFA enable, the easy scale pin works differently.
> > This value should be set before the first data transfer.
>
> Sure, things works differently if this is set. That I understood.
>
> What I haven't heard is a rationale as to why this configuration option
> shuold be in the DT.
>
> Can I enable this on all implementations, or not?
>
> When would I enable this and when would I not?
>
> The property reads like a switch to turn a feature on, rather than the
> description of the presence of a feature.
>
> Mark.
>
If you want to check whether tps611xx receive data, enable RFA and
disable it if you don't want to check. If you enable RFA tps611xx returns
ACK signal and driver should check it.
Driver can change this value if we create a file using the function,
device_create_file but usually, we set the protocol at initial time and
don't change the protocol at run time. It's the thing very like
hsync-active or vsync-active properties of display-timing
bindings.

I think it is better to describe RFA as an optional property.

Daniel.

--089e012949869a2c1004fd90447f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra">Hi.<br></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">2014-07-05 1:31 GMT+09:00 Mark =
Rutland <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.rutland@arm.com" targe=
t=3D"_blank">mark.rutland@arm.com</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"">&gt; =C2=
=A0 =C2=A0 &gt; +- rfa-enable: enable request for acknowledge.<br>
&gt; =C2=A0 =C2=A0 &gt; + =C2=A0If RFA is enabled, the data byte includes t=
he RFA bit and device will<br>
&gt; =C2=A0 =C2=A0 wait<br>
&gt; =C2=A0 =C2=A0 &gt; + =C2=A0and check acknowledge from device.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 You didn&#39;t answer my question as to why this should =
be in the DT.<br>
&gt;<br>
&gt;<br>
&gt; According to the RFA enable, the easy scale pin works differently.<br>
&gt; This value should be set before the first data transfer.<br>
<br>
</div>Sure, things works differently if this is set. That I understood.<br>
<br>
What I haven&#39;t heard is a rationale as to why this configuration option=
<br>
shuold be in the DT.<br>
<br>
Can I enable this on all implementations, or not?<br>
<br>
When would I enable this and when would I not?<br>
<br>
The property reads like a switch to turn a feature on, rather than the<br>
description of the presence of a feature.<br>
<span class=3D""><font color=3D"#888888"><br>
Mark.<br>
</font></span></blockquote></div>If you want to check whether tps611xx rece=
ive data, enable RFA and<br>disable it if you don&#39;t want to check. If y=
ou enable RFA tps611xx returns <br>ACK signal and driver should check it.<b=
r>
</div><div class=3D"gmail_extra">Driver can change this value if we create =
a file using the function,<br></div><div class=3D"gmail_extra">device_creat=
e_file but usually, we set the protocol at initial time and <br>don&#39;t c=
hange the protocol at run time. It&#39;s the thing very like<code> <br>
hsync-active or</code><code> vsync-active</code><code> properties</code><co=
de> of</code><code> display-timing <br>bindings.<br><br></code></div><div c=
lass=3D"gmail_extra">I think it is better to describe RFA as an optional<co=
de> property.</code></div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Daniel.<br>=
</div></div>

--089e012949869a2c1004fd90447f--
