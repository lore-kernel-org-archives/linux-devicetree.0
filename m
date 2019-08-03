Return-Path: <SRS0=bRqm=V7=google.com=saravanak@kernel.org>
MIME-Version: 1.0
References: <20190703011020.151615-1-saravanak@google.com> <20190717103220.f7cys267hq23fbsb@vireshk-i7>
 <CAGETcx-tbjVzRKW8D-564zgNOhrA_z-NC1q5U70bhoUDBhp6VA@mail.gmail.com>
 <20190718053746.64drmonk72vwnt4s@vireshk-i7> <CAGETcx_-=b3An9YdxLUnZap=0iaeczvWTEnw65FMLU8BwA3HfQ@mail.gmail.com>
 <20190729092454.6lfqzmhkvrhpimsp@vireshk-i7> <CAGETcx_7fK20VZ6Zn07Z+Ran1_O7gSPohck_tg-aEr5oONQ5iA@mail.gmail.com>
 <20190730030157.aml7z6vfsiqgyief@vireshk-i7>
In-Reply-To: <20190730030157.aml7z6vfsiqgyief@vireshk-i7>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 2 Aug 2019 18:20:13 -0700
Message-ID: <CAGETcx9rbyg5pYdpR2EYwQoCfeLkxrem_w-Ee_vjGFM7gErW8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Introduce Bandwidth OPPs for interconnect paths
Content-Type: multipart/alternative; boundary="0000000000000849db058f2c49e4"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--0000000000000849db058f2c49e4
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 29, 2019 at 8:02 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> On 29-07-19, 13:12, Saravana Kannan wrote:
> > On Mon, Jul 29, 2019 at 2:24 AM Viresh Kumar <viresh.kumar@linaro.org>
> wrote:
> > >
> > > On 18-07-19, 21:12, Saravana Kannan wrote:
> > > > On Wed, Jul 17, 2019 at 10:37 PM Viresh Kumar <
> viresh.kumar@linaro.org> wrote:
> > > > > I would like
> > > > > to put this data in the GPU OPP table only. What about putting a
> > > > > range in the GPU OPP table for the Bandwidth if it can change so
> much
> > > > > for the same frequency.
> > > >
> > > > I don't think the range is going to work.
> > >
> > > Any specific reason for that ?
> >
> > The next sentence was literally explaining this :) Fine to debate
> > that, but ignoring that and asking this question is kinda funny.
>
> Okay, but ...
>
> > > > If a GPU is doing purely
> > > > computational work, it's not unreasonable for it to vote for the
> > > > lowest bandwidth for any GPU frequency.
>
> ... it wasn't clear to me even after reading this sentence again now
> :)
>
> I understand that you may have to vote for the lowest bandwidth but
> that doesn't explain why a range can't work (sorry if it was just me
> who doesn't understood it :)).
>

Well, doesn't work as in, it doesn't give any additional info. I can just
vote for 0 or UINT_MAX if I want to stay at the lowest or high bandwidth.
Have the actual values of the lowest or highest point doesn't help for
cases where you need to skip intermediate bandwidth levels when going from
low to high (as the need increases).


>
> > > I think that is fine, but if the GPU is able to find how much
> > > bandwidth it needs why can't it just pass that value without needing
> > > to have another OPP table for the path ?
> >
> > You were asking this question in the context of "can the GPU OPP just
> > list all the range of bandwidth it might use per GPU frequency". My point
> > is that the range would be useless because it would the entire
> > available bandwidth range (because purely compute work might not need
> > any bandwidth).
>
> If it is useless to have entire range here, then why bother providing
> one ? Why can't the GPU request what it needs in exact terms, based on
> its calculations ? And then based on these requests, let the
> interconnect find what's the best/stable values it really wants to
> program the path for (and for that the interconnect can use its own
> OPP table, which would be fine).
>

Let's say there actual path can support 1, 2, 3, 4, 5, 6, 7, 8, 9 and 10
GB/s.

Let's say 2, 3, and 4 need the same voltage level as 5 for this path. So,
for GPU's needs using 2, 3 and 4 GB/s might not be good because the power
savings from the frequency difference is not worth the performance and
power (if you run the interconnect slow, the GPU would run faster to
achieve the same performance) impact compared to running the interconnect
at 5 GB/s. Similarly it might skip 6 GB/s. So even if the GPU can somehow
calculate the exact bandwidth required (or say measure it), it'll need to
know to skip 2, 3 and 4 because they aren't power/perf efficient levels to
use.

But all these bandwidth levels might be useable for a smaller HW IP whose
power cost isn't high. So power savings running the interconnect at 3 GB/s
might be worth it -- because even if the small HW IP ran faster to achieve
the performance, the power increase in the HW IP won't be higher than the
power savings from running the interconnect slower.



> > Whereas, what the GPU's algorithm actually needs might be the list of
> > "useful" bandwidth levels to use.
>
> Hmm, I am not sure GPU's algorithm needs this table AFAIU based on all
> the conversations we had until now. It is very capable of finding how
> much bandwidth it needs,


Not really. If you have a monitor that can actually measure the bandwidth,
yes. Most often that's not the case. If you just have a monitor that can
give your the bus port busy% then it'll have to use this table to pick the
useful ones. As in, in the example above, if the bus is still too busy at 1
GB/s it would directly ask for 5 GB/s instead of going through 2, 3 and 4.


> you just want the GPU driver to finally align
> that with a stable bandwidth for the platform later on. And what I am
> asking is that it is not required for the end driver to look for
> stable values, it just requests what it wants and let the interconnect
> core/driver decide the stable values.
>

I think you've misunderstood my prior statements then.

The interconnect driver would then still have to aggregate the requests and
pick the final frequency for the interconnect. That's where it comes in --
executing/implementing the requests of all the clients.

Very much like the clock framework, most of the user drivers just ask
> for a clk value to be programmed and it is the clock driver which
> keeps a table of the stable values and then aligns the requested value
> to one of those.
>

This of this similar to the clock API and the OPP tables for CPUs. The
clock API could run the CPU at multiple different frequencies. But the CPU
driver uses the CPU OPP table to pick a certain set of frequencies that are
"useful". If your CPU clock is shared with another block, say L3 and
there's an L3 driver that's requesting a different frequency range (using
clk_set_rate_range(x, UINT_MAX)), that's where the clock driver aggregates
their request and set's the final clock frequency.

Similarly, the GPU driver wants to pick useful interconnect path bandwidth
levels using BW OPP tables. And the interconnect framework aggregates the
requests across multiple drivers requesting different bandwidths.

Does that make sense?

-Saravana

--0000000000000849db058f2c49e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 29, 2019 at 8:02 PM Vires=
h Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 29-07-19, 13:12, Saravana Kannan wrote:<br>
&gt; On Mon, Jul 29, 2019 at 2:24 AM Viresh Kumar &lt;<a href=3D"mailto:vir=
esh.kumar@linaro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt; wro=
te:<br>
&gt; &gt;<br>
&gt; &gt; On 18-07-19, 21:12, Saravana Kannan wrote:<br>
&gt; &gt; &gt; On Wed, Jul 17, 2019 at 10:37 PM Viresh Kumar &lt;<a href=3D=
"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@linaro.org<=
/a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; I would like<br>
&gt; &gt; &gt; &gt; to put this data in the GPU OPP table only. What about =
putting a<br>
&gt; &gt; &gt; &gt; range in the GPU OPP table for the Bandwidth if it can =
change so much<br>
&gt; &gt; &gt; &gt; for the same frequency.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t think the range is going to work.<br>
&gt; &gt;<br>
&gt; &gt; Any specific reason for that ?<br>
&gt; <br>
&gt; The next sentence was literally explaining this :) Fine to debate<br>
&gt; that, but ignoring that and asking this question is kinda funny.<br>
<br>
Okay, but ...<br>
<br>
&gt; &gt; &gt; If a GPU is doing purely<br>
&gt; &gt; &gt; computational work, it&#39;s not unreasonable for it to vote=
 for the<br>
&gt; &gt; &gt; lowest bandwidth for any GPU frequency.<br>
<br>
... it wasn&#39;t clear to me even after reading this sentence again now<br=
>
:)<br>
<br>
I understand that you may have to vote for the lowest bandwidth but<br>
that doesn&#39;t explain why a range can&#39;t work (sorry if it was just m=
e<br>
who doesn&#39;t understood it :)).<br></blockquote><div><br></div><div>Well=
, doesn&#39;t work as in, it doesn&#39;t give any additional info. I can ju=
st vote for 0 or UINT_MAX if I want to stay at the lowest or high bandwidth=
. Have the actual values of the lowest or highest point doesn&#39;t help fo=
r cases where you need to skip intermediate bandwidth levels when going fro=
m low to high (as the need increases).</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; I think that is fine, but if the GPU is able to find how much<br>
&gt; &gt; bandwidth it needs why can&#39;t it just pass that value without =
needing<br>
&gt; &gt; to have another OPP table for the path ?<br>
&gt; <br>
&gt; You were asking this question in the context of &quot;can the GPU OPP =
just<br>
&gt; list all the range of bandwidth it might use per GPU frequency&quot;. =
My point<br>
&gt; is that the range would be useless because it would the entire<br>
&gt; available bandwidth range (because purely compute work might not need<=
br>
&gt; any bandwidth).<br>
<br>
If it is useless to have entire range here, then why bother providing<br>
one ? Why can&#39;t the GPU request what it needs in exact terms, based on<=
br>
its calculations ? And then based on these requests, let the<br>
interconnect find what&#39;s the best/stable values it really wants to<br>
program the path for (and for that the interconnect can use its own<br>
OPP table, which would be fine).<br></blockquote><div><br></div><div>Let&#3=
9;s say there actual=C2=A0path can support 1, 2, 3, 4, 5, 6, 7, 8, 9 and 10=
 GB/s.</div><div><br></div><div>Let&#39;s say 2, 3, and 4 need the same vol=
tage level as 5 for this path. So, for GPU&#39;s needs using 2, 3 and 4 GB/=
s might not be good because the power savings from the frequency difference=
 is not worth the performance and power (if you run the interconnect slow, =
the GPU would run faster to achieve the same performance) impact compared t=
o running the interconnect at 5 GB/s. Similarly it might skip 6 GB/s. So ev=
en if the GPU can somehow calculate the exact bandwidth required (or say me=
asure it), it&#39;ll need to know to skip 2, 3 and 4 because they aren&#39;=
t power/perf efficient levels to use.</div><div><br></div><div>But all thes=
e bandwidth levels might be useable for a smaller HW IP whose power cost is=
n&#39;t high. So power savings running the interconnect at 3 GB/s might be =
worth it -- because even if the small HW IP ran faster to achieve the perfo=
rmance, the power increase in the HW IP won&#39;t be higher than the power =
savings from running the interconnect slower.</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Whereas, what the GPU&#39;s algorithm actually needs might be the list=
 of<br>
&gt; &quot;useful&quot; bandwidth levels to use.<br>
<br>
Hmm, I am not sure GPU&#39;s algorithm needs this table AFAIU based on all<=
br>
the conversations we had until now. It is very capable of finding how<br>
much bandwidth it needs,</blockquote><div><br></div><div>Not really. If you=
 have a monitor that can actually measure the bandwidth, yes. Most often th=
at&#39;s not the case. If you just have a monitor that can give your the bu=
s port busy% then it&#39;ll have to use this table to pick the useful ones.=
 As in, in the example above, if the bus is still too busy at 1 GB/s it wou=
ld directly ask for 5 GB/s instead of going through 2, 3 and 4.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> you just wan=
t the GPU driver to finally align<br>
that with a stable bandwidth for the platform later on. And what I am<br>
asking is that it is not required for the end driver to look for<br>
stable values, it just requests what it wants and let the interconnect<br>
core/driver decide the stable values.<br></blockquote><div><br></div><div>I=
 think you&#39;ve misunderstood my prior statements then.</div><div><br></d=
iv><div>The interconnect driver would then still have to aggregate the requ=
ests and pick the final frequency for the interconnect. That&#39;s where it=
 comes in -- executing/implementing the requests of all the clients.</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Very much like the clock framework, most of the user drivers just ask<br>
for a clk value to be programmed and it is the clock driver which<br>
keeps a table of the stable values and then aligns the requested value<br>
to one of those.<br></blockquote><div><br></div><div>This of this similar t=
o the clock API and the OPP tables for CPUs. The clock API could run the CP=
U at multiple different frequencies. But the CPU driver uses the CPU OPP ta=
ble to pick a certain set of frequencies that are &quot;useful&quot;. If yo=
ur CPU clock is shared with another block, say L3 and there&#39;s an L3 dri=
ver that&#39;s requesting a different frequency range (using clk_set_rate_r=
ange(x, UINT_MAX)), that&#39;s where the clock driver aggregates their requ=
est and set&#39;s the final clock frequency.<br></div><div><br></div><div>S=
imilarly, the GPU driver wants to pick useful interconnect path bandwidth l=
evels using BW OPP tables. And the interconnect framework aggregates the re=
quests across multiple drivers requesting different bandwidths.</div><div><=
br></div><div>Does that make sense?=C2=A0</div><div><br></div><div>-Saravan=
a</div></div></div>

--0000000000000849db058f2c49e4--
