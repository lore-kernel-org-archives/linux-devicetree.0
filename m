Return-Path: <SRS0=YgUL=JG=gmail.com=toddpoynor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+8J=BgrFAA2bdA1UcmpeYdZWHybwtyy+gq94bZaK8bKg@mail.gmail.com>
References: <20180620023903.242758-1-toddpoynor@gmail.com> <CAL_Jsq+8J=BgrFAA2bdA1UcmpeYdZWHybwtyy+gq94bZaK8bKg@mail.gmail.com>
From: Todd Poynor <toddpoynor@gmail.com>
Date: Wed, 20 Jun 2018 12:58:18 -0700
Message-ID: <CAO3upoYOmUZwnWtYhxz4gaWYf7Mw+aBWhVW_Oz6zKE3O4BWZ5w@mail.gmail.com>
Subject: Re: [PATCH] drivers: base: initcall_debug logs for driver probe times
Content-Type: multipart/alternative; boundary="0000000000005b35da056f1838a3"
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Todd Poynor <toddpoynor@google.com>
List-ID: <devicetree@vger.kernel.org>

--0000000000005b35da056f1838a3
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 20, 2018 at 7:28 AM, Rob Herring <robh+dt@kernel.org> wrote:

> On Tue, Jun 19, 2018 at 8:39 PM, Todd Poynor <toddpoynor@gmail.com> wrote:
> ...
> > +static int really_probe_debug(struct device *dev, struct device_driver
> *drv)
> > +{
> > +       ktime_t calltime, delta, rettime;
> > +       unsigned long long duration;
>
> Probably should be s64.
>
> > +       int ret;
> > +
> > +       calltime = ktime_get();
> > +       ret = really_probe(dev, drv);
> > +       rettime = ktime_get();
> > +       delta = ktime_sub(rettime, calltime);
> > +       duration = (unsigned long long) ktime_to_ns(delta) >> 10;
>
> Is avoiding a divide really worth optimizing here compared to the
> flood of messages typically on the serial port? Just use ktime_to_us.
> Perhaps just get rid of duration and do the conversion in the printk
> arg.
>

Sure, the above is based on the existing code in init/main.c, I can send a
small update to that code separately.

> +       printk(KERN_DEBUG "probe of %s returned after %lld usecs\n",
> > +              dev_name(dev), duration);
>
> Including the return code here too would be good.
>

Will do.

While we're at it, I see newer runtime PM, etc. code now prints via
pr_info() level when initcall_debug is enabled, but I'll leave this at
debug level unless anybody feels both this and the existing code should
switch to info level.

And since the above is printed after initcall levels are complete, I'll
drop the code I added previously to ensure deferred probe calls, module
probes, etc. are no longer printed after that point.


> ...
>

Thanks -- Todd

--0000000000005b35da056f1838a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jun 20, 2018 at 7:28 AM, Rob Herring <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:robh+dt@kernel.org" target=3D"_blank">robh+dt@kernel.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On Tue, Jun 19, 2018 at 8:39 PM, =
Todd Poynor &lt;<a href=3D"mailto:toddpoynor@gmail.com">toddpoynor@gmail.co=
m</a>&gt; wrote:<br>...<br>
&gt; +static int really_probe_debug(struct device *dev, struct device_drive=
r *drv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ktime_t calltime, delta, rettime;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long long duration;<br>
<br>
</div></div>Probably should be s64.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
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
flood of messages typically on the serial port? Just use ktime_to_us.<br>
Perhaps just get rid of duration and do the conversion in the printk<br>
arg.<br></blockquote><div><br></div><div>Sure, the above is based on the ex=
isting code in init/main.c, I can send a small update to that code separate=
ly.<br><span class=3D"gmail-"></span><br><span class=3D"gmail-"></span></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_DEBUG &quot;probe of %s return=
ed after %lld usecs\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name(dev), durat=
ion);<br>
<br>
</span>Including the return code here too would be good.<br></blockquote><d=
iv><br></div><div>Will do.<br><br></div><div>While we&#39;re at it, I see n=
ewer runtime PM, etc. code now prints via pr_info() level when initcall_deb=
ug is enabled, but I&#39;ll leave this at debug level unless anybody feels =
both this and the existing code should switch to info level.<br><br></div><=
div>And since the above is printed after initcall levels are complete, I&#3=
9;ll drop the code I added previously to ensure deferred probe calls, modul=
e probes, etc. are no longer printed after that point.<br>=C2=A0<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">...<br></div></div></bl=
ockquote><div>=C2=A0</div></div><div class=3D"gmail_signature">Thanks -- To=
dd<br></div>
</div></div>

--0000000000005b35da056f1838a3--
