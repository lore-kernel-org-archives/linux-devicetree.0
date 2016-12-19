Return-Path: <SRS0=YP13=YC=gmail.com=volodymyr.bendiuga@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20161219150008.GE10048@lunn.ch>
References: <20161219141610.30934-1-romain.perier@free-electrons.com>
 <20161219141610.30934-2-romain.perier@free-electrons.com> <20161219143848.GA10048@lunn.ch>
 <292d4f15-c58b-3565-26ec-98a025b6adb3@free-electrons.com> <20161219150008.GE10048@lunn.ch>
From: Volodymyr Bendiuga <volodymyr.bendiuga@gmail.com>
Date: Mon, 19 Dec 2016 16:04:32 +0100
Message-ID: <CABHmqqDqhJa6N=Ayu-GFNyp4g90dXzTje6o8qfCEP2DacCFWdQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] net: dsa: mv88e6xxx: Allow mv88e6xxx_smi_init() to be
 used at address 0x1
Content-Type: multipart/alternative; boundary=001a113e677eb5c9680544043ca2
To: Andrew Lunn <andrew@lunn.ch>
Cc: Romain Perier <romain.perier@free-electrons.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>
List-ID: <devicetree@vger.kernel.org>

--001a113e677eb5c9680544043ca2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

No, it did not get accepted. Or at least I did not see
David accepting it. Let me know if I should resubmit it.

Regards,
Volodymyr

On Mon, Dec 19, 2016 at 4:00 PM, Andrew Lunn <andrew@lunn.ch> wrote:

> On Mon, Dec 19, 2016 at 03:56:34PM +0100, Romain Perier wrote:
> > Hi Andrew,
> >
> > Le 19/12/2016 =C3=A0 15:38, Andrew Lunn a =C3=A9crit :
> > >On Mon, Dec 19, 2016 at 03:16:06PM +0100, Romain Perier wrote:
> > >>Currently, the function mv88e6xxx_smi_init() returns -EINVAL if the b=
it
> > >>zero of sw_addr is 0x1. However, on some platforms, ethernet switches
> > >>are configured in Multi chip addressing mode and available at MDIO
> > >>address 0x1.
> > >
> > >Hi Romain
> > >
> > >What branch is this against? net-next?
> >
> > Until last friday it was based onto next-20161216, I rebased onto
> > the torvalds's tree this morning (so ~4.10-pre-rc1).
>
> This patchset is 80% networking. So please see:
>
> Documentation/networking/netdev-FAQ.txt
>
> > Oh, it's already fixed, good. I did not see this patch :)
> >
> > >
> > >It would be nicer to use Volodymyr, since it has been reviewed.
> >
> >
> > As the fix is already there, I will use it, sure.
>
> Im not sure what happened to it. It might of fallen through the
> cracks. Lets see what Volodymyr says. It might need resubmitting once
> netdev reopens.
>
>        Andrew
>

--001a113e677eb5c9680544043ca2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi Andrew,<br><br></div>No, it did not=
 get accepted. Or at least I did not see<br></div>David accepting it. Let m=
e know if I should resubmit it.<br><br></div>Regards,<br></div>Volodymyr<br=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, De=
c 19, 2016 at 4:00 PM, Andrew Lunn <span dir=3D"ltr">&lt;<a href=3D"mailto:=
andrew@lunn.ch" target=3D"_blank">andrew@lunn.ch</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Dec 19, 2016 at 03:5=
6:34PM +0100, Romain Perier wrote:<br>
&gt; Hi Andrew,<br>
&gt;<br>
&gt; Le 19/12/2016 =C3=A0 15:38, Andrew Lunn a =C3=A9crit :<br>
&gt; &gt;On Mon, Dec 19, 2016 at 03:16:06PM +0100, Romain Perier wrote:<br>
&gt; &gt;&gt;Currently, the function mv88e6xxx_smi_init() returns -EINVAL i=
f the bit<br>
&gt; &gt;&gt;zero of sw_addr is 0x1. However, on some platforms, ethernet s=
witches<br>
&gt; &gt;&gt;are configured in Multi chip addressing mode and available at =
MDIO<br>
&gt; &gt;&gt;address 0x1.<br>
&gt; &gt;<br>
&gt; &gt;Hi Romain<br>
&gt; &gt;<br>
&gt; &gt;What branch is this against? net-next?<br>
&gt;<br>
&gt; Until last friday it was based onto next-20161216, I rebased onto<br>
&gt; the torvalds&#39;s tree this morning (so ~4.10-pre-rc1).<br>
<br>
</span>This patchset is 80% networking. So please see:<br>
<br>
Documentation/networking/<wbr>netdev-FAQ.txt<br>
<span class=3D""><br>
&gt; Oh, it&#39;s already fixed, good. I did not see this patch :)<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;It would be nicer to use Volodymyr, since it has been reviewed.<br=
>
&gt;<br>
&gt;<br>
&gt; As the fix is already there, I will use it, sure.<br>
<br>
</span>Im not sure what happened to it. It might of fallen through the<br>
cracks. Lets see what Volodymyr says. It might need resubmitting once<br>
netdev reopens.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Andrew<br>
</font></span></blockquote></div><br></div>

--001a113e677eb5c9680544043ca2--
