Return-Path: <SRS0=AFtA=WR=google.com=saravanak@kernel.org>
MIME-Version: 1.0
References: <20190724001100.133423-1-saravanak@google.com> <20190724001100.133423-2-saravanak@google.com>
 <32a8abd2-b6a4-67df-eee9-0f006310e81e@gmail.com> <CAGETcx8Q27+Jnz+rHtt33muMV6U+S3cmKh02Ok_Ds_ZzfBqhrg@mail.gmail.com>
 <522e8375-5070-f579-6509-3e44fe66768e@gmail.com> <CAGETcx-9Bera+nU-3=ZNpHqdqKxO0TmNuVUsCMQ-yDm1VXn5zA@mail.gmail.com>
 <a4c139c1-c9d1-3e5a-f47f-cd790b42da1f@gmail.com> <CAGETcx-J7+d3pcArMZvO5zQbUhAhRW+1=FUf7C1fV9-QhkckBw@mail.gmail.com>
 <6028b35b-a4ca-18de-84c6-4a22dbd987c9@gmail.com> <20190821015647.GA12237@kroah.com>
In-Reply-To: <20190821015647.GA12237@kroah.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 20 Aug 2019 19:01:03 -0700
Message-ID: <CAGETcx8eVfJ0mn08E6pTDytjVE+RFcj_gOt_enide4E6G1NAWw@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] driver core: Add support for linking devices
 during device addition
Content-Type: multipart/alternative; boundary="000000000000c3428d059096f2ad"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000c3428d059096f2ad
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 20, 2019, 6:56 PM Greg Kroah-Hartman <gregkh@linuxfoundation.org>
wrote:

> On Tue, Aug 20, 2019 at 06:06:55PM -0700, Frank Rowand wrote:
> > On 8/20/19 3:10 PM, Saravana Kannan wrote:
> > > On Mon, Aug 19, 2019 at 9:25 PM Frank Rowand <frowand.list@gmail.com>
> wrote:
> > >>
> > >> On 8/19/19 5:00 PM, Saravana Kannan wrote:
> > >>> On Sun, Aug 18, 2019 at 8:38 PM Frank Rowand <frowand.list@gmail.com>
> wrote:
> > >>>>
> > >>>> On 8/15/19 6:50 PM, Saravana Kannan wrote:
> > >>>>> On Wed, Aug 7, 2019 at 7:04 PM Frank Rowand <
> frowand.list@gmail.com> wrote:
> > >>>>>>
> > >>>>>>> Date: Tue, 23 Jul 2019 17:10:54 -0700
> > >>>>>>> Subject: [PATCH v7 1/7] driver core: Add support for linking
> devices during
> > >>>>>>>  device addition
> > >>>>>>> From: Saravana Kannan <saravanak@google.com>
>
> This is a "fun" thread :(
>
> You two should get together in person this week and talk.  I think you
> both will be at ELC, can we do this tomorrow or Thursday so we can hash
> it out in a way that doesn't end up talking past each other, like I feel
> is happening here right now?
>

That would be great. Wednesday would be better for me. I might not make it
to ELC on Thursday. Let us know Frank.

Thanks,
Saravana

--000000000000c3428d059096f2ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Aug 20, 2019, 6:56 PM Greg Kroah-Hartman &lt;<=
a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Aug 20, 2019 at=
 06:06:55PM -0700, Frank Rowand wrote:<br>
&gt; On 8/20/19 3:10 PM, Saravana Kannan wrote:<br>
&gt; &gt; On Mon, Aug 19, 2019 at 9:25 PM Frank Rowand &lt;<a href=3D"mailt=
o:frowand.list@gmail.com" target=3D"_blank" rel=3D"noreferrer">frowand.list=
@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 8/19/19 5:00 PM, Saravana Kannan wrote:<br>
&gt; &gt;&gt;&gt; On Sun, Aug 18, 2019 at 8:38 PM Frank Rowand &lt;<a href=
=3D"mailto:frowand.list@gmail.com" target=3D"_blank" rel=3D"noreferrer">fro=
wand.list@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On 8/15/19 6:50 PM, Saravana Kannan wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; On Wed, Aug 7, 2019 at 7:04 PM Frank Rowand &lt;<=
a href=3D"mailto:frowand.list@gmail.com" target=3D"_blank" rel=3D"noreferre=
r">frowand.list@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Date: Tue, 23 Jul 2019 17:10:54 -0700<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: [PATCH v7 1/7] driver core: Add =
support for linking devices during<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 device addition<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Saravana Kannan &lt;<a href=3D"mail=
to:saravanak@google.com" target=3D"_blank" rel=3D"noreferrer">saravanak@goo=
gle.com</a>&gt;<br>
<br>
This is a &quot;fun&quot; thread :(<br>
<br>
You two should get together in person this week and talk.=C2=A0 I think you=
<br>
both will be at ELC, can we do this tomorrow or Thursday so we can hash<br>
it out in a way that doesn&#39;t end up talking past each other, like I fee=
l<br>
is happening here right now?<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">That would be great. Wednesday would be better =
for me. I might not make it to ELC on Thursday. Let us know Frank.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">S=
aravana</div></div>

--000000000000c3428d059096f2ad--
