Return-Path: <SRS0=j7ed=JF=96boards.org=yang.zhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu-gAkfRsEUOc=iyxi6Twvg9cbvWNqNHRS2HzUDZg8xUhg@mail.gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <CAK8P3a2KqoX-squhGc8TBuJ==8xxELsuy-H+c1+C7Fu7Z4OjDA@mail.gmail.com> <CAKv+Gu-gAkfRsEUOc=iyxi6Twvg9cbvWNqNHRS2HzUDZg8xUhg@mail.gmail.com>
From: Yang Zhang <yang.zhang@96boards.org>
Date: Tue, 19 Jun 2018 16:14:33 +0100
Message-ID: <CAMuUZTG0q4f2T=+HjEijUCLb7KNXok9RJHOXOKNs2iap5p7m5Q@mail.gmail.com>
Subject: Re: [Dev] [PATCH 0/5] RFC: Mezzanine handling for 96boards
Content-Type: multipart/alternative; boundary="000000000000c37c25056f0023fc"
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, DTML <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, dev <dev@lists.96boards.org>, Mark Brown <broonie@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@infradead.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000c37c25056f0023fc
Content-Type: text/plain; charset="UTF-8"

On 18 June 2018 at 14:22, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:

> On 18 June 2018 at 14:21, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Jun 18, 2018 at 9:45 AM, Linus Walleij <linus.walleij@linaro.org>
> wrote:
> >> This is a proposal for how to handle the non-discoverable
> >> 96boards plug-in expansion boards called "mezzanines" in the
> >> Linux kernel. It is a working RFC series meant for discussion
> >> at the moment.
> >>
> >> The RFC was done on the brand new Ultra96 board from Xilinx
> >> with a Secure96 mezzanine expansion board. The main part
> >> is in patch 4, the rest is enabling and examples.
> >>
> >> The code can be obtained from here:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux
> -integrator.git/log/?h=ultra96
> >>
> >> You can for example probably augment the DTS file for any
> >> upstream-supported 96board and get the Secure96 going with
> >> it with minor efforts.
> >
> > Hi Linus,
> >
> > Thanks for your work on solving this long-standing problem. I've just
> > read through your patches briefly and have a few thoughts:
> >
> > - I really like the idea of having C code deal with the mezzanine
> >   connector itself, acting as an intermediate to tie a number of
> >   boards to a number of add-on cards, this seems much simpler than
> >   trying to do everything with overlays or one of the other more
> >   generic mechanisms.
> >
> > - I don't like the idea of having the bus driver contain a list of
> possible
> >   add-ons, this seems to go against our usual driver model. What
> >   I think we want instead is to make the connector itself a proper
> >   bus_type, to allow drivers to register against it as loadable modules,
> >   and devices (maybe limited to one device) being created as probed
> >   from DT or some other method as you describe.
> >
> > - You export symbols in the mezzanine_* namespace, which I think
> >    is a bit too generic and should perhaps contain something related
> >    to  96boards in its name to make it less ambiguous. I suspect we
> >    would add a number of further connectors for hats, capes, lures etc,
> >    which could all be described as mezzanines. One open question
> >    is how we structure the commonality between the various
> >    connectors, but we can defer that until we have more than one
> >    or two of them.
> >
>
> Hello all,
>
> We should also consider firmware use of the mezzanines. For instance,
> the Secure96 has a RNG which UEFI may want to use so the early boot
> code can access is for KASLR. It also has a TPM, which should not be
> reset/reinitialized/etc by the OS if we want to make meaningful use of
> it.
>
> Also, given that we can (and do) already describe topologies involving
> mezzanines by ignoring the connector altogether (which is not entirely
> unreasonable given the fact that we [as Linaro/96boards] dropped the
> ball on this one and did not mandate discoverability for mezzanines).
>

The design guideline has been reviewed by many inside/outside linaro
through the mezzanine@lists.96boards.org and 96b-spec-sig <
96b-spec-sig@96boards.org> published as recommended/strongly recommended
item from day one. 'dropping the ball' is a strong conclusion.

https://www.96boards.org/documentation/mezzanine/


> So ideally, DTs can be expressed such that older kernels can still use
> those peripherals.
> _______________________________________________
> Dev mailing list
> Dev@lists.96boards.org
> https://lists.96boards.org/mailman/listinfo/dev
>

--000000000000c37c25056f0023fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 18 June 2018 at 14:22, Ard Biesheuvel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ard.biesheuvel@linaro.org" target=3D"_blank">ard.biesheuvel@lina=
ro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div class=3D"gmail-m_-2397921145533267050gmail-HOEnZb"><div class=
=3D"gmail-m_-2397921145533267050gmail-h5">On 18 June 2018 at 14:21, Arnd Be=
rgmann &lt;<a href=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arndb.de=
</a>&gt; wrote:<br>
&gt; On Mon, Jun 18, 2018 at 9:45 AM, Linus Walleij &lt;<a href=3D"mailto:l=
inus.walleij@linaro.org" target=3D"_blank">linus.walleij@linaro.org</a>&gt;=
 wrote:<br>
&gt;&gt; This is a proposal for how to handle the non-discoverable<br>
&gt;&gt; 96boards plug-in expansion boards called &quot;mezzanines&quot; in=
 the<br>
&gt;&gt; Linux kernel. It is a working RFC series meant for discussion<br>
&gt;&gt; at the moment.<br>
&gt;&gt;<br>
&gt;&gt; The RFC was done on the brand new Ultra96 board from Xilinx<br>
&gt;&gt; with a Secure96 mezzanine expansion board. The main part<br>
&gt;&gt; is in patch 4, the rest is enabling and examples.<br>
&gt;&gt;<br>
&gt;&gt; The code can be obtained from here:<br>
&gt;&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/linusw/=
linux-integrator.git/log/?h=3Dultra96" rel=3D"noreferrer" target=3D"_blank"=
>https://git.kernel.org/pub/scm<wbr>/linux/kernel/git/linusw/linux<wbr>-int=
egrator.git/log/?h=3Dultra96</a><br>
&gt;&gt;<br>
&gt;&gt; You can for example probably augment the DTS file for any<br>
&gt;&gt; upstream-supported 96board and get the Secure96 going with<br>
&gt;&gt; it with minor efforts.<br>
&gt;<br>
&gt; Hi Linus,<br>
&gt;<br>
&gt; Thanks for your work on solving this long-standing problem. I&#39;ve j=
ust<br>
&gt; read through your patches briefly and have a few thoughts:<br>
&gt;<br>
&gt; - I really like the idea of having C code deal with the mezzanine<br>
&gt;=C2=A0 =C2=A0connector itself, acting as an intermediate to tie a numbe=
r of<br>
&gt;=C2=A0 =C2=A0boards to a number of add-on cards, this seems much simple=
r than<br>
&gt;=C2=A0 =C2=A0trying to do everything with overlays or one of the other =
more<br>
&gt;=C2=A0 =C2=A0generic mechanisms.<br>
&gt;<br>
&gt; - I don&#39;t like the idea of having the bus driver contain a list of=
 possible<br>
&gt;=C2=A0 =C2=A0add-ons, this seems to go against our usual driver model. =
What<br>
&gt;=C2=A0 =C2=A0I think we want instead is to make the connector itself a =
proper<br>
&gt;=C2=A0 =C2=A0bus_type, to allow drivers to register against it as loada=
ble modules,<br>
&gt;=C2=A0 =C2=A0and devices (maybe limited to one device) being created as=
 probed<br>
&gt;=C2=A0 =C2=A0from DT or some other method as you describe.<br>
&gt;<br>
&gt; - You export symbols in the mezzanine_* namespace, which I think<br>
&gt;=C2=A0 =C2=A0 is a bit too generic and should perhaps contain something=
 related<br>
&gt;=C2=A0 =C2=A0 to=C2=A0 96boards in its name to make it less ambiguous. =
I suspect we<br>
&gt;=C2=A0 =C2=A0 would add a number of further connectors for hats, capes,=
 lures etc,<br>
&gt;=C2=A0 =C2=A0 which could all be described as mezzanines. One open ques=
tion<br>
&gt;=C2=A0 =C2=A0 is how we structure the commonality between the various<b=
r>
&gt;=C2=A0 =C2=A0 connectors, but we can defer that until we have more than=
 one<br>
&gt;=C2=A0 =C2=A0 or two of them.<br>
&gt;<br>
<br>
</div></div>Hello all,<br>
<br>
We should also consider firmware use of the mezzanines. For instance,<br>
the Secure96 has a RNG which UEFI may want to use so the early boot<br>
code can access is for KASLR. It also has a TPM, which should not be<br>
reset/reinitialized/etc by the OS if we want to make meaningful use of<br>
it.<br>
<br>
Also, given that we can (and do) already describe topologies involving<br>
mezzanines by ignoring the connector altogether (which is not entirely<br>
unreasonable given the fact that we [as Linaro/96boards] dropped the<br>
ball on this one and did not mandate discoverability for mezzanines).<br></=
blockquote><div><br></div><div>The design guideline has been reviewed by ma=
ny inside/outside linaro through the=C2=A0<span style=3D"color:rgb(0,0,0);f=
ont-size:12.8px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline"><a href=3D"ma=
ilto:mezzanine@lists.96boards.org">mezzanine@lists.96boards.org</a> and=C2=
=A096b-spec-sig &lt;<a href=3D"mailto:96b-spec-sig@96boards.org">96b-spec-s=
ig@96boards.org</a>&gt; published as recommended/strongly recommended item =
from day one. &#39;dropping the ball&#39; is a strong conclusion.</span></d=
iv><div><br></div><div><a href=3D"https://www.96boards.org/documentation/me=
zzanine/" target=3D"_blank">https://www.96boards.org/<wbr>documentation/mez=
zanine/</a><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
So ideally, DTs can be expressed such that older kernels can still use<br>
those peripherals.<br>
<div class=3D"gmail-m_-2397921145533267050gmail-HOEnZb"><div class=3D"gmail=
-m_-2397921145533267050gmail-h5">______________________________<wbr>_______=
__________<br>
Dev mailing list<br>
<a href=3D"mailto:Dev@lists.96boards.org" target=3D"_blank">Dev@lists.96boa=
rds.org</a><br>
<a href=3D"https://lists.96boards.org/mailman/listinfo/dev" rel=3D"noreferr=
er" target=3D"_blank">https://lists.96boards.org/mai<wbr>lman/listinfo/dev<=
/a><br>
</div></div></blockquote></div><br></div></div>

--000000000000c37c25056f0023fc--
