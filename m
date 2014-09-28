Return-Path: <glikely@secretlab.ca>
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <20140925235322.GW1193@ld-irv-0074>
References: <1409767603-3290-1-git-send-email-computersforpeace@gmail.com>
	<20140908104238.C7B3DC40AB2@trevor.secretlab.ca>
	<20140925235322.GW1193@ld-irv-0074>
Date: Sun, 28 Sep 2014 09:55:32 +0100
Message-ID: <CACxGe6s0eQS3Cfq7BwHcDZwpJCgt-X8Yc-1-4KPuA6n6Y-n4rQ@mail.gmail.com>
Subject: Re: [PATCH] of: correct of_console_check()'s return value
From: Grant Likely <grant.likely@linaro.org>
Content-Type: multipart/alternative; boundary=047d7bacbe6a151d0505041c5089
To: Brian Norris <computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

--047d7bacbe6a151d0505041c5089
Content-Type: text/plain; charset=ISO-8859-1

It got merged into mainline on Thursday.

g.
On 26 Sep 2014 00:53, "Brian Norris" <computersforpeace@gmail.com> wrote:

> Hi Grant,
>
> On Mon, Sep 08, 2014 at 11:42:38AM +0100, Grant Likely wrote:
> > On Wed,  3 Sep 2014 11:06:43 -0700, Brian Norris <
> computersforpeace@gmail.com> wrote:
> > > The comments above of_console_check() say that it will return TRUE if
> it
> > > registers a preferred console, but add_preferred_console() uses a
> > > 0-equals-success convention, so ths leaves of_console_check() with an
> > > inconsistent policy for its return values.
> > >
> > > Fortunately, nobody was actually checking the return value of
> > > of_console_check(), so this isn't significant at the moment.
> > >
> > > But let's match the comments, so we're doing what we say.
> > >
> > > Fixes: 3482f2c52b77 ('of: Create of_console_check() for selecting a
> console specified in /chosen')
> > > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > > Cc: Grant Likely <grant.likely@linaro.org>
> >
> > Good catch. Applied, thanks.
>
> Applied to what? I don't see it in linux-next.
>
> Regards,
> Brian
>

--047d7bacbe6a151d0505041c5089
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">It got merged into mainline on Thursday.</p>
<p dir=3D"ltr">g.</p>
<div class=3D"gmail_quote">On 26 Sep 2014 00:53, &quot;Brian Norris&quot; &=
lt;<a href=3D"mailto:computersforpeace@gmail.com">computersforpeace@gmail.c=
om</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi=
 Grant,<br>
<br>
On Mon, Sep 08, 2014 at 11:42:38AM +0100, Grant Likely wrote:<br>
&gt; On Wed,=A0 3 Sep 2014 11:06:43 -0700, Brian Norris &lt;<a href=3D"mail=
to:computersforpeace@gmail.com">computersforpeace@gmail.com</a>&gt; wrote:<=
br>
&gt; &gt; The comments above of_console_check() say that it will return TRU=
E if it<br>
&gt; &gt; registers a preferred console, but add_preferred_console() uses a=
<br>
&gt; &gt; 0-equals-success convention, so ths leaves of_console_check() wit=
h an<br>
&gt; &gt; inconsistent policy for its return values.<br>
&gt; &gt;<br>
&gt; &gt; Fortunately, nobody was actually checking the return value of<br>
&gt; &gt; of_console_check(), so this isn&#39;t significant at the moment.<=
br>
&gt; &gt;<br>
&gt; &gt; But let&#39;s match the comments, so we&#39;re doing what we say.=
<br>
&gt; &gt;<br>
&gt; &gt; Fixes: 3482f2c52b77 (&#39;of: Create of_console_check() for selec=
ting a console specified in /chosen&#39;)<br>
&gt; &gt; Signed-off-by: Brian Norris &lt;<a href=3D"mailto:computersforpea=
ce@gmail.com">computersforpeace@gmail.com</a>&gt;<br>
&gt; &gt; Cc: Grant Likely &lt;<a href=3D"mailto:grant.likely@linaro.org">g=
rant.likely@linaro.org</a>&gt;<br>
&gt;<br>
&gt; Good catch. Applied, thanks.<br>
<br>
Applied to what? I don&#39;t see it in linux-next.<br>
<br>
Regards,<br>
Brian<br>
</blockquote></div>

--047d7bacbe6a151d0505041c5089--
