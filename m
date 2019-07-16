Return-Path: <SRS0=Yc3P=VN=google.com=saravanak@kernel.org>
MIME-Version: 1.0
References: <20190702004811.136450-1-saravanak@google.com> <20190702004811.136450-3-saravanak@google.com>
 <CAL_JsqLdvDpKB=iV6x3eTr2F4zY0bxU-Wjb+JeMjj5rdnRc-OQ@mail.gmail.com>
 <CAGETcx_i9353aRFbJXNS78EvqwmU-2-xSBJ+ySZX1gjjHpz_cg@mail.gmail.com>
 <9e75b3dd-380b-c868-728f-46379e53bc11@gmail.com> <07812739-0e6b-6598-ac58-8e0ea74a3331@gmail.com>
 <CAGETcx8YCCGxgXnByenVUb+q8pHPPTjwAjK3L_+9mwoCe=9SbA@mail.gmail.com>
 <3e340ff1-e842-2521-4344-da62802d472f@gmail.com> <CAL_JsqLySLMLanBJvyWqFGhVzXrEaUP-3t9MDmpnAXhQA_7y=g@mail.gmail.com>
In-Reply-To: <CAL_JsqLySLMLanBJvyWqFGhVzXrEaUP-3t9MDmpnAXhQA_7y=g@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 16 Jul 2019 16:45:58 -0700
Message-ID: <CAGETcx9bsUcu14fke=_m8gv0DDoCMNfNQp0Q2yWehCqLOeSoyA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] of/platform: Add functional dependency link from
 DT bindings
Content-Type: multipart/alternative; boundary="0000000000009d9fb2058dd4fc84"
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

--0000000000009d9fb2058dd4fc84
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 16, 2019 at 3:57 PM Rob Herring <robh+dt@kernel.org> wrote:

> On Mon, Jul 15, 2019 at 7:05 PM Frank Rowand <frowand.list@gmail.com>
> wrote:
> >
> > On 7/15/19 11:40 AM, Saravana Kannan wrote:
> > > Replying again because the previous email accidentally included HTML.
> > >
> > > Thanks for taking the time to reconsider the wording Frank. Your
> > > intention was clear to me in the first email too.
> > >
> > > A kernel command line option can also completely disable this
> > > functionality easily and cleanly. Can we pick that as an option? I've
> > > an implementation of that in the v5 series I sent out last week.
> >
> > Yes, Rob suggested a command line option for debugging, and I am fine
> with
> > that.  But even with that, I would like a lot of testing so that we have
> a
> > chance of finding systems that have trouble with the changes and could
> > potentially be fixed before impacting a large number of users.
>
> Leaving it in -next for more than a cycle will not help. There's some
> number of users who test linux-next. Then there's more that test -rc
> kernels. Then there's more that test final releases and/or stable
> kernels. Probably, the more stable the h/w, the more it tends to be
> latter groups. (I don't get reports of breaking PowerMacs with the
> changes sitting in linux-next.)
>
> My main worry about this being off by default is it won't get tested.
> I'm not sure there's enough interest to drive folks to turn it on and
> test. Maybe it needs to be on until we see breakage.
>

Android will start using this. So there's definitely going to be a lot of
motivation for people to start using this and testing this.

I'm also thinking we should start rejecting late_initcall_sync() level
clean up code in device drivers in the future and start asking them to move
to sync_state(). If this feature isn't turned on, the behavior will default
to a late_initcall_sync() level execution. But when this is on, it'll
actually work nicely with modules. So that's another way to drive folks to
it and improve things over time.

Maybe we can have this on by default in linux-next and -rc. Fix any issues
that show up and can be fixed without breaking the goal of this series
(make things work with modules). And finally turn it off by default before
it gets pulled into mainline? That way, we get the maximum test coverage we
can get, but not accidentally break anything that wasn't tested?

Thanks,
Saravana

--0000000000009d9fb2058dd4fc84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 16, 2019 at 3:57 PM Rob H=
erring &lt;<a href=3D"mailto:robh%2Bdt@kernel.org">robh+dt@kernel.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon=
, Jul 15, 2019 at 7:05 PM Frank Rowand &lt;<a href=3D"mailto:frowand.list@g=
mail.com" target=3D"_blank">frowand.list@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 7/15/19 11:40 AM, Saravana Kannan wrote:<br>
&gt; &gt; Replying again because the previous email accidentally included H=
TML.<br>
&gt; &gt;<br>
&gt; &gt; Thanks for taking the time to reconsider the wording Frank. Your<=
br>
&gt; &gt; intention was clear to me in the first email too.<br>
&gt; &gt;<br>
&gt; &gt; A kernel command line option can also completely disable this<br>
&gt; &gt; functionality easily and cleanly. Can we pick that as an option? =
I&#39;ve<br>
&gt; &gt; an implementation of that in the v5 series I sent out last week.<=
br>
&gt;<br>
&gt; Yes, Rob suggested a command line option for debugging, and I am fine =
with<br>
&gt; that.=C2=A0 But even with that, I would like a lot of testing so that =
we have a<br>
&gt; chance of finding systems that have trouble with the changes and could=
<br>
&gt; potentially be fixed before impacting a large number of users.<br>
<br>
Leaving it in -next for more than a cycle will not help. There&#39;s some<b=
r>
number of users who test linux-next. Then there&#39;s more that test -rc<br=
>
kernels. Then there&#39;s more that test final releases and/or stable<br>
kernels. Probably, the more stable the h/w, the more it tends to be<br>
latter groups. (I don&#39;t get reports of breaking PowerMacs with the<br>
changes sitting in linux-next.)<br>
<br>
My main worry about this being off by default is it won&#39;t get tested.<b=
r>
I&#39;m not sure there&#39;s enough interest to drive folks to turn it on a=
nd<br>
test. Maybe it needs to be on until we see breakage.<br></blockquote><div><=
br></div><div>Android will start using this. So there&#39;s definitely goin=
g to be a lot of motivation for people to start using this and testing this=
.</div><div><br></div><div>I&#39;m also thinking we should start rejecting =
late_initcall_sync() level clean up code in device drivers in the future an=
d start asking them to move to sync_state(). If this feature isn&#39;t turn=
ed on, the behavior will default to a late_initcall_sync() level execution.=
 But when this is on, it&#39;ll actually work nicely with modules. So that&=
#39;s another way to drive folks to it and improve things over time.</div><=
div><br></div><div>Maybe we can have this on by default in linux-next and -=
rc. Fix any issues that show up and can be fixed without breaking the goal =
of this series (make things work with modules). And finally turn it off by =
default before it gets pulled into mainline? That way, we get the maximum t=
est coverage we can get, but not accidentally break anything that wasn&#39;=
t tested?</div><div><br></div><div>Thanks,<br></div><div>Saravana</div><div=
><br></div></div></div>

--0000000000009d9fb2058dd4fc84--
