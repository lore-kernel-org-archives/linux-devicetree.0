Return-Path: <SRS0=YgUL=JG=gmail.com=toddpoynor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+8J=BgrFAA2bdA1UcmpeYdZWHybwtyy+gq94bZaK8bKg@mail.gmail.com>
References: <20180620023903.242758-1-toddpoynor@gmail.com> <CAL_Jsq+8J=BgrFAA2bdA1UcmpeYdZWHybwtyy+gq94bZaK8bKg@mail.gmail.com>
From: Todd Poynor <toddpoynor@gmail.com>
Date: Wed, 20 Jun 2018 13:41:06 -0700
Message-ID: <CAO3upoZh6KJszrGE=1G0ZQp8YR2Lkphkin5Cc9mVrUS5FTg5XA@mail.gmail.com>
Subject: Re: [PATCH] drivers: base: initcall_debug logs for driver probe times
Content-Type: multipart/alternative; boundary="00000000000073470a056f18d195"
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Todd Poynor <toddpoynor@google.com>
List-ID: <devicetree@vger.kernel.org>

--00000000000073470a056f18d195
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 20, 2018 at 7:28 AM, Rob Herring <robh+dt@kernel.org> wrote:

> On Tue, Jun 19, 2018 at 8:39 PM, Todd Poynor <toddpoynor@gmail.com> wrote:
> ...
> > +       calltime = ktime_get();
> > +       ret = really_probe(dev, drv);
> > +       rettime = ktime_get();
> > +       delta = ktime_sub(rettime, calltime);
> > +       duration = (unsigned long long) ktime_to_ns(delta) >> 10;
>
> Is avoiding a divide really worth optimizing here compared to the
> flood of messages typically on the serial port? Just use ktime_to_us.
>

I also meant to mention that serial console output is typically disabled in
a boot time analysis run since it drastically affects the timing, but
still, not trying to optimize this sequence to that degree.

Todd

--00000000000073470a056f18d195
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jun 20, 2018 at 7:28 AM, Rob Herring <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:robh+dt@kernel.org" target=3D"_blank">robh+dt@kernel.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div clas=
s=3D"h5">On Tue, Jun 19, 2018 at 8:39 PM, Todd Poynor &lt;<a href=3D"mailto=
:toddpoynor@gmail.com">toddpoynor@gmail.com</a>&gt; wrote:<span class=3D"">=
</span><br><span class=3D""></span></div></div><span class=3D"">...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0calltime =3D ktime_get();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D really_probe(dev, drv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rettime =3D ktime_get();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0delta =3D ktime_sub(rettime, calltime);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0duration =3D (unsigned long long) ktime_to=
_ns(delta) &gt;&gt; 10;<br>
<br>
</span>Is avoiding a divide really worth optimizing here compared to the<br=
>
flood of messages typically on the serial port? Just use ktime_to_us.<br></=
blockquote><div><br></div><div>I also meant to mention that serial console =
output is typically disabled in a boot time analysis run since it drastical=
ly affects the timing, but still, not trying to optimize this sequence to t=
hat degree.<br></div><div>=C2=A0</div></div><div class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">Todd<br></div>
</div></div>

--00000000000073470a056f18d195--
