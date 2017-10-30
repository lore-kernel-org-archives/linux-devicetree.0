Return-Path: <SRS0=ync2=B5=secretlab.ca=glikely@kernel.org>
MIME-Version: 1.0
References: <CACxGe6tfRByeJrp43Taj166K4Ni0KjmZkC=Xc1pz2=ga6fvDZQ@mail.gmail.com>
 <CAL_Jsq+rZ6nNJnxNq6mrGEeb6RLmyAhG4V+K8uqG_irDR_BCsA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+rZ6nNJnxNq6mrGEeb6RLmyAhG4V+K8uqG_irDR_BCsA@mail.gmail.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Mon, 30 Oct 2017 22:08:35 +0000
Message-ID: <CACxGe6sH_Zd0L77N+23dmPq8NLduGMhYQnxGoLNbHzamdS9d1w@mail.gmail.com>
Subject: Re: Notes & Slides from Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Content-Type: multipart/alternative; boundary="94eb2c0caea0d37c1d055ccae1e0"
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Gibson <david@gibson.dropbear.id.au>, Frank Rowand <frowand.list@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Kanta Vekaria <kanta.vekaria@linaro.org>, Kumar Gala <kumar.gala@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <rob.herring@linaro.org>, Sean Hudson <darknighte@darknighte.com>, "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ksummit-discuss@lists.linuxfoundation.org" <ksummit-discuss@lists.linuxfoundation.org>
List-ID: <devicetree@vger.kernel.org>

--94eb2c0caea0d37c1d055ccae1e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Oct 2017 at 17:49, Rob Herring <robh@kernel.org> wrote:

> On Mon, Oct 30, 2017 at 11:01 AM, Grant Likely
> <grant.likely@secretlab.ca> wrote:
> > Thank you to everyone who attended the Devicetree Workshop as part of
> > the 2017 Kernel Summit in Prague last week. I heard lots of good
> > feedback, and I'm already thinking about how to organize next year's
> > gathering.
> >
> > Slides and notes have been uploaded to elinux.org. A summary of the
> > topics and next steps still needs to be written. You can find the
> > notes and slides here:
> >
> >
> https://elinux.org/Device_tree_future#Kernel_Summit_2017.2C_Devicetree_Wo=
rkshop
>
> Grant, your slides are from 2016 LPC. Is that the right deck? (It's
> also ODP, not PDF as labeled in the wiki.)


Your looking at the 2016 section from last year. The 2017 stuff is below
that. I noticed the odp/pdf problem as well on last year=E2=80=99s slides, =
but
didn=E2=80=99t get around to fixing it.


>
> From the notes, I don't get a sense if there's some direction on JSON
> Schema vs. eBPF. Any comments on that.


Pantelis and I are going to merge our plans and present a new proposal. It
will be mostly json schema with DT specific extensions. eBPF would be
encoded in that.

g.


>
> Rob
>

--94eb2c0caea0d37c1d055ccae1e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, 30 Oct 2017 a=
t 17:49, Rob Herring &lt;<a href=3D"mailto:robh@kernel.org">robh@kernel.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Oct 30, 201=
7 at 11:01 AM, Grant Likely<br>
&lt;<a href=3D"mailto:grant.likely@secretlab.ca" target=3D"_blank">grant.li=
kely@secretlab.ca</a>&gt; wrote:<br>
&gt; Thank you to everyone who attended the Devicetree Workshop as part of<=
br>
&gt; the 2017 Kernel Summit in Prague last week. I heard lots of good<br>
&gt; feedback, and I&#39;m already thinking about how to organize next year=
&#39;s<br>
&gt; gathering.<br>
&gt;<br>
&gt; Slides and notes have been uploaded to <a href=3D"http://elinux.org" r=
el=3D"noreferrer" target=3D"_blank">elinux.org</a>. A summary of the<br>
&gt; topics and next steps still needs to be written. You can find the<br>
&gt; notes and slides here:<br>
&gt;<br>
&gt; <a href=3D"https://elinux.org/Device_tree_future#Kernel_Summit_2017.2C=
_Devicetree_Workshop" rel=3D"noreferrer" target=3D"_blank">https://elinux.o=
rg/Device_tree_future#Kernel_Summit_2017.2C_Devicetree_Workshop</a><br>
<br>
Grant, your slides are from 2016 LPC. Is that the right deck? (It&#39;s<br>
also ODP, not PDF as labeled in the wiki.)</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Your looking at the 2016 section from last year. =
The 2017 stuff is below that. I noticed the odp/pdf problem as well on last=
 year=E2=80=99s slides, but didn=E2=80=99t get around to fixing it.</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
>From the notes, I don&#39;t get a sense if there&#39;s some direction on JS=
ON<br>
Schema vs. eBPF. Any comments on that.</blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto">Pantelis and I are going to merge our plans and prese=
nt a new proposal. It will be mostly json schema with DT specific extension=
s. eBPF would be encoded in that.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">g.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
<br>
Rob<br>
</blockquote></div></div>

--94eb2c0caea0d37c1d055ccae1e0--
