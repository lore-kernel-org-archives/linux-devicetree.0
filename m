Return-Path: <SRS0=j7ed=JF=96boards.org=yang.zhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_Dq1uY0wHRyREmCmQdSRSJbNheF1ZsrNhibKOZowvf+g@mail.gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <CAK8P3a2KqoX-squhGc8TBuJ==8xxELsuy-H+c1+C7Fu7Z4OjDA@mail.gmail.com>
 <CAKv+Gu-gAkfRsEUOc=iyxi6Twvg9cbvWNqNHRS2HzUDZg8xUhg@mail.gmail.com>
 <CAMuUZTG0q4f2T=+HjEijUCLb7KNXok9RJHOXOKNs2iap5p7m5Q@mail.gmail.com> <CAKv+Gu_Dq1uY0wHRyREmCmQdSRSJbNheF1ZsrNhibKOZowvf+g@mail.gmail.com>
From: Yang Zhang <yang.zhang@96boards.org>
Date: Tue, 19 Jun 2018 16:26:00 +0100
Message-ID: <CAMuUZTHOuzQm3y-yF6cad9y1UgsK+6R2w7vSzz7MkkYCdYd3hA@mail.gmail.com>
Subject: Re: [Dev] [PATCH 0/5] RFC: Mezzanine handling for 96boards
Content-Type: multipart/alternative; boundary="000000000000b6f9e5056f004c73"
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, DTML <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, dev <dev@lists.96boards.org>, Mark Brown <broonie@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@infradead.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000b6f9e5056f004c73
Content-Type: text/plain; charset="UTF-8"

Yes.

https://github.com/96boards/documentation/blob/master/mezzanine/files/mezzanine-design-guidelines.pdf

Under Configuration data section

On 19 June 2018 at 16:25, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:

> On 19 June 2018 at 17:14, Yang Zhang <yang.zhang@96boards.org> wrote:
> >
> >
> > On 18 June 2018 at 14:22, Ard Biesheuvel <ard.biesheuvel@linaro.org>
> wrote:
> >>
> >> On 18 June 2018 at 14:21, Arnd Bergmann <arnd@arndb.de> wrote:
> >> > On Mon, Jun 18, 2018 at 9:45 AM, Linus Walleij
> >> > <linus.walleij@linaro.org> wrote:
> >> >> This is a proposal for how to handle the non-discoverable
> >> >> 96boards plug-in expansion boards called "mezzanines" in the
> >> >> Linux kernel. It is a working RFC series meant for discussion
> >> >> at the moment.
> >> >>
> >> >> The RFC was done on the brand new Ultra96 board from Xilinx
> >> >> with a Secure96 mezzanine expansion board. The main part
> >> >> is in patch 4, the rest is enabling and examples.
> >> >>
> >> >> The code can be obtained from here:
> >> >>
> >> >> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/
> linux-integrator.git/log/?h=ultra96
> >> >>
> >> >> You can for example probably augment the DTS file for any
> >> >> upstream-supported 96board and get the Secure96 going with
> >> >> it with minor efforts.
> >> >
> >> > Hi Linus,
> >> >
> >> > Thanks for your work on solving this long-standing problem. I've just
> >> > read through your patches briefly and have a few thoughts:
> >> >
> >> > - I really like the idea of having C code deal with the mezzanine
> >> >   connector itself, acting as an intermediate to tie a number of
> >> >   boards to a number of add-on cards, this seems much simpler than
> >> >   trying to do everything with overlays or one of the other more
> >> >   generic mechanisms.
> >> >
> >> > - I don't like the idea of having the bus driver contain a list of
> >> > possible
> >> >   add-ons, this seems to go against our usual driver model. What
> >> >   I think we want instead is to make the connector itself a proper
> >> >   bus_type, to allow drivers to register against it as loadable
> modules,
> >> >   and devices (maybe limited to one device) being created as probed
> >> >   from DT or some other method as you describe.
> >> >
> >> > - You export symbols in the mezzanine_* namespace, which I think
> >> >    is a bit too generic and should perhaps contain something related
> >> >    to  96boards in its name to make it less ambiguous. I suspect we
> >> >    would add a number of further connectors for hats, capes, lures
> etc,
> >> >    which could all be described as mezzanines. One open question
> >> >    is how we structure the commonality between the various
> >> >    connectors, but we can defer that until we have more than one
> >> >    or two of them.
> >> >
> >>
> >> Hello all,
> >>
> >> We should also consider firmware use of the mezzanines. For instance,
> >> the Secure96 has a RNG which UEFI may want to use so the early boot
> >> code can access is for KASLR. It also has a TPM, which should not be
> >> reset/reinitialized/etc by the OS if we want to make meaningful use of
> >> it.
> >>
> >> Also, given that we can (and do) already describe topologies involving
> >> mezzanines by ignoring the connector altogether (which is not entirely
> >> unreasonable given the fact that we [as Linaro/96boards] dropped the
> >> ball on this one and did not mandate discoverability for mezzanines).
> >
> >
> > The design guideline has been reviewed by many inside/outside linaro
> through
> > the mezzanine@lists.96boards.org and 96b-spec-sig
> > <96b-spec-sig@96boards.org> published as recommended/strongly
> recommended
> > item from day one. 'dropping the ball' is a strong conclusion.
> >
>
> Apologies for using a term that you seem to take issue with. Are you
> saying the spec currently recommends it?
>

--000000000000b6f9e5056f004c73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes.<div><br></div><div><a href=3D"https://github.com/96bo=
ards/documentation/blob/master/mezzanine/files/mezzanine-design-guidelines.=
pdf">https://github.com/96boards/documentation/blob/master/mezzanine/files/=
mezzanine-design-guidelines.pdf</a><br><div><br></div><div>Under Configurat=
ion data section</div></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 19 June 2018 at 16:25, Ard Biesheuvel <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:ard.biesheuvel@linaro.org" target=3D"_blank">ard.bie=
sheuvel@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div class=3D"HOEnZb"><div class=3D"h5">On 19 June 2018 at 17:14, Yang Zhan=
g &lt;<a href=3D"mailto:yang.zhang@96boards.org">yang.zhang@96boards.org</a=
>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 18 June 2018 at 14:22, Ard Biesheuvel &lt;<a href=3D"mailto:ard.bie=
sheuvel@linaro.org">ard.biesheuvel@linaro.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 18 June 2018 at 14:21, Arnd Bergmann &lt;<a href=3D"mailto:arnd=
@arndb.de">arnd@arndb.de</a>&gt; wrote:<br>
&gt;&gt; &gt; On Mon, Jun 18, 2018 at 9:45 AM, Linus Walleij<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:linus.walleij@linaro.org">linus.walleij=
@linaro.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; This is a proposal for how to handle the non-discoverable=
<br>
&gt;&gt; &gt;&gt; 96boards plug-in expansion boards called &quot;mezzanines=
&quot; in the<br>
&gt;&gt; &gt;&gt; Linux kernel. It is a working RFC series meant for discus=
sion<br>
&gt;&gt; &gt;&gt; at the moment.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The RFC was done on the brand new Ultra96 board from Xili=
nx<br>
&gt;&gt; &gt;&gt; with a Secure96 mezzanine expansion board. The main part<=
br>
&gt;&gt; &gt;&gt; is in patch 4, the rest is enabling and examples.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The code can be obtained from here:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/gi=
t/linusw/linux-integrator.git/log/?h=3Dultra96" rel=3D"noreferrer" target=
=3D"_blank">https://git.kernel.org/pub/<wbr>scm/linux/kernel/git/linusw/<wb=
r>linux-integrator.git/log/?h=3D<wbr>ultra96</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; You can for example probably augment the DTS file for any=
<br>
&gt;&gt; &gt;&gt; upstream-supported 96board and get the Secure96 going wit=
h<br>
&gt;&gt; &gt;&gt; it with minor efforts.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Linus,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks for your work on solving this long-standing problem. I=
&#39;ve just<br>
&gt;&gt; &gt; read through your patches briefly and have a few thoughts:<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - I really like the idea of having C code deal with the mezza=
nine<br>
&gt;&gt; &gt;=C2=A0 =C2=A0connector itself, acting as an intermediate to ti=
e a number of<br>
&gt;&gt; &gt;=C2=A0 =C2=A0boards to a number of add-on cards, this seems mu=
ch simpler than<br>
&gt;&gt; &gt;=C2=A0 =C2=A0trying to do everything with overlays or one of t=
he other more<br>
&gt;&gt; &gt;=C2=A0 =C2=A0generic mechanisms.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - I don&#39;t like the idea of having the bus driver contain =
a list of<br>
&gt;&gt; &gt; possible<br>
&gt;&gt; &gt;=C2=A0 =C2=A0add-ons, this seems to go against our usual drive=
r model. What<br>
&gt;&gt; &gt;=C2=A0 =C2=A0I think we want instead is to make the connector =
itself a proper<br>
&gt;&gt; &gt;=C2=A0 =C2=A0bus_type, to allow drivers to register against it=
 as loadable modules,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0and devices (maybe limited to one device) being c=
reated as probed<br>
&gt;&gt; &gt;=C2=A0 =C2=A0from DT or some other method as you describe.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - You export symbols in the mezzanine_* namespace, which I th=
ink<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 is a bit too generic and should perhaps contain =
something related<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 to=C2=A0 96boards in its name to make it less am=
biguous. I suspect we<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 would add a number of further connectors for hat=
s, capes, lures etc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 which could all be described as mezzanines. One =
open question<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 is how we structure the commonality between the =
various<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 connectors, but we can defer that until we have =
more than one<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 or two of them.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Hello all,<br>
&gt;&gt;<br>
&gt;&gt; We should also consider firmware use of the mezzanines. For instan=
ce,<br>
&gt;&gt; the Secure96 has a RNG which UEFI may want to use so the early boo=
t<br>
&gt;&gt; code can access is for KASLR. It also has a TPM, which should not =
be<br>
&gt;&gt; reset/reinitialized/etc by the OS if we want to make meaningful us=
e of<br>
&gt;&gt; it.<br>
&gt;&gt;<br>
&gt;&gt; Also, given that we can (and do) already describe topologies invol=
ving<br>
&gt;&gt; mezzanines by ignoring the connector altogether (which is not enti=
rely<br>
&gt;&gt; unreasonable given the fact that we [as Linaro/96boards] dropped t=
he<br>
&gt;&gt; ball on this one and did not mandate discoverability for mezzanine=
s).<br>
&gt;<br>
&gt;<br>
&gt; The design guideline has been reviewed by many inside/outside linaro t=
hrough<br>
&gt; the <a href=3D"mailto:mezzanine@lists.96boards.org">mezzanine@lists.96=
boards.org</a> and 96b-spec-sig<br>
&gt; &lt;<a href=3D"mailto:96b-spec-sig@96boards.org">96b-spec-sig@96boards=
.org</a>&gt; published as recommended/strongly recommended<br>
&gt; item from day one. &#39;dropping the ball&#39; is a strong conclusion.=
<br>
&gt;<br>
<br>
</div></div>Apologies for using a term that you seem to take issue with. Ar=
e you<br>
saying the spec currently recommends it?<br>
</blockquote></div><br></div>

--000000000000b6f9e5056f004c73--
