Return-Path: <SRS0=c2de=TZ=google.com=saravanak@kernel.org>
MIME-Version: 1.0
References: <20190524010117.225219-1-saravanak@google.com> <06b479e2-e8a0-b3e8-567c-7fa0f1c5bdf6@gmail.com>
 <CAGETcx-21GEoBKhpzcsrDt3sEo-vUpwqnr3To7VbSPd8aW86Nw@mail.gmail.com> <6d3995c1-e1e7-35ff-d091-501822c97ecd@gmail.com>
In-Reply-To: <6d3995c1-e1e7-35ff-d091-501822c97ecd@gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 24 May 2019 18:47:39 -0700
Message-ID: <CAGETcx84ue-v51w--D2X_d7Grf-iGyrt7WVGgykp8hwCrZnVCw@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe ordering
Content-Type: multipart/alternative; boundary="000000000000c4b8880589ac802a"
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000c4b8880589ac802a
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019, 5:22 PM Frank Rowand <frowand.list@gmail.com> wrote:

> On 5/24/19 2:53 PM, Saravana Kannan wrote:
> > On Fri, May 24, 2019 at 10:49 AM Frank Rowand <frowand.list@gmail.com>
> wrote:
> >>
> >> On 5/23/19 6:01 PM, Saravana Kannan wrote:
>
> < snip >
>
> >> Another flaw with this method is that existing device trees
> >> will be broken after the kernel is modified, because existing
> >> device trees do not have the depends-on property.  This breaks
> >> the devicetree compatibility rules.
> >
> > This is 100% not true with the current implementation. I actually
> > tested this. This is fully backwards compatible. That's another reason
> > for adding depends-on and going by just what it says. The existing
> > bindings were never meant to describe only mandatory dependencies. So
> > using them as such is what would break backwards compatibility.
>
> Are you saying that an existing, already compiled, devicetree (an FDT)
> can be used to boot a new kernel that has implemented this patch set?
>
> The new kernel will boot with the existing FDT that does not have
> any depends-on properties?
>

Yes, that's what I'm saying. The behavior won't change in any way compared
to a kernel without this patch.

-Saravana

>

--000000000000c4b8880589ac802a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, May 24, 2019, 5:22 PM Frank Rowand &l=
t;<a href=3D"mailto:frowand.list@gmail.com">frowand.list@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On 5/24/19 2:53 PM, Saravana=
 Kannan wrote:<br>
&gt; On Fri, May 24, 2019 at 10:49 AM Frank Rowand &lt;<a href=3D"mailto:fr=
owand.list@gmail.com" target=3D"_blank" rel=3D"noreferrer">frowand.list@gma=
il.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 5/23/19 6:01 PM, Saravana Kannan wrote:<br>
<br>
&lt; snip &gt;<br>
<br>
&gt;&gt; Another flaw with this method is that existing device trees<br>
&gt;&gt; will be broken after the kernel is modified, because existing<br>
&gt;&gt; device trees do not have the depends-on property.=C2=A0 This break=
s<br>
&gt;&gt; the devicetree compatibility rules.<br>
&gt; <br>
&gt; This is 100% not true with the current implementation. I actually<br>
&gt; tested this. This is fully backwards compatible. That&#39;s another re=
ason<br>
&gt; for adding depends-on and going by just what it says. The existing<br>
&gt; bindings were never meant to describe only mandatory dependencies. So<=
br>
&gt; using them as such is what would break backwards compatibility.<br>
<br>
Are you saying that an existing, already compiled, devicetree (an FDT)<br>
can be used to boot a new kernel that has implemented this patch set?<br>
<br>
The new kernel will boot with the existing FDT that does not have<br>
any depends-on properties?<br></blockquote></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Yes, that&#39;s what I&#39;m saying. The behavior won&#=
39;t change in any way compared to a kernel without this patch.=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">-Saravana</div><div class=3D"=
gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div>

--000000000000c4b8880589ac802a--
