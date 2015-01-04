Return-Path: <sneeker.yeh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20141229160641.GD29379@saruman>
References: <1418695828-605-1-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<1418695828-605-4-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<20141222153730.GA12815@saruman>
	<CAJ1gpc3jVpz=5ME4+wCJDW5NKihvB4xYzwi0co=UuPtG9Ubmjg@mail.gmail.com>
	<CAJ1gpc3-Wjtm54WOhO6RXjZft9BMngzyYC0-S-XnTacV-qKgMg@mail.gmail.com>
	<20141229160641.GD29379@saruman>
Date: Sun, 4 Jan 2015 20:55:01 +0800
Message-ID: <CAJ1gpc0Uu4vS2iA_o_W5NaE_QBWDYFZJio7yKvhpaR5f=qWcGA@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: dwc3: add a quirk for device disconnection issue
 in Synopsis dwc3 core
From: Sneeker Yeh <sneeker.yeh@gmail.com>
Content-Type: multipart/alternative; boundary=001a113958c8fc0a11050bd314eb
To: Felipe Balbi <balbi@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>, Hans de Goede <hdegoede@redhat.com>, Thomas Pugliese <thomas.pugliese@gmail.com>, David Mosberger <davidm@egauge.net>, Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, Andy Green <andy.green@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Sneeker Yeh <Sneeker.Yeh@tw.fujitsu.com>
List-ID: <devicetree@vger.kernel.org>

--001a113958c8fc0a11050bd314eb
Content-Type: text/plain; charset=UTF-8

Hi Balbi,

thanks for your review,

2014-12-30 0:06 GMT+08:00 Felipe Balbi <balbi@ti.com>:

> Hi,
>
> On Mon, Dec 29, 2014 at 04:07:50PM +0800, Sneeker Yeh wrote:
> > Hi,
> >
> > 2014-12-29 14:41 GMT+08:00 Sneeker Yeh <sneeker.yeh@gmail.com>:
> >
> > > Hi,
> > >
> > > 2014-12-22 23:37 GMT+08:00 Felipe Balbi <balbi@ti.com>:
> > >
> > >> On Tue, Dec 16, 2014 at 10:10:28AM +0800, Sneeker Yeh wrote:
> > >> > Synopsis DesignWare USB3 IP Core integrated with a config-free
> > >> > phy needs special handling during device disconnection to avoid
> > >> > the host controller dying.
> > >> >
> > >> > This quirk makes sure PORT_CSC is cleared after the disable slot
> > >> > command when usb device is disconnected from internal root hub,
> > >> > otherwise, Synopsis core would fall into a state that cannot use
> > >> > any endpoint command. Consequently, device disconnection procedure
> > >> > might not be finished because sometimes endpoint need to be stop
> > >> > by endpoint stop command issuing.
> > >> >
> > >> > Symptom usually happens when disconnected device is keyboard,
> > >> > mouse, and hub.
> > >>
> > >> you need to point us to the synopsys STARS ticket number. That's the
> > >> only way to reference this specific quirk. Add it to a comment
> > >> somewhere.
> > >>
> > >
> > > Thanks, we're still waiting for Synopsis STARS ticket number.
> > > I'll add it to comment later.
> > >
> > >
> > Sorry I didn't express myself clearly.
> >
> > So far Fujitsu Semiconductor got Synopsys internal case id , that is "
> > Case: 8000679552".
> > However the contents belongs this id cannot be referred except Fujitsu
> > Semiconductor and Synopsys.
> > Synopsis decide the official errata (STAR information) will be disclosed
> > next February.
> >
> > Would you suggest if this quirk can be accepted with this case ID, or can
> > only be accepted with STARS ticket number?
>
> The thing is that without the STARS number I can't really verify which
> versions of the IP would be affected. Clearly, it's not only your setup
> and I think it's pretty unfair to have "is_compatible("fujitsu")" to
>

just found some way of quirk injection i miss,
does it looks more reasonable if i have to decide to use it via Kconfig? :
20f6fdd01c2c0de9cc1109083222edded24c5350
b2f463e1300016785d63475c56f5807e2be00934


> enable the quirk only for you. Isn't there a better way of enabling the
> quirk based off of revision detection couple with a look on GHWPARAMS*
> registers ?
>
> What's tricking me is this claim that only config-free PHYs would be
> affected, why ?
>

i'm still struggling now to try to get more information about this.
some security policy inside Fujitsu make me unable to access full
information of this errata today.

Someday after i get enough information,
i shall take your suggestion here that seems better to incur quirk
dynamically via GHWPARAMS,
and then send it here again.

Much appreciate,
Sneeker


> I still have many questions about this patch which are not answered by
> commit log nor can I poke around on Synopsys solvnet for answers :-s
>
> --
> balbi
>

--001a113958c8fc0a11050bd314eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Balbi,<br><br></div>thanks for your review,<br><di=
v><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2014-12-30=
 0:06 GMT+08:00 Felipe Balbi <span dir=3D"ltr">&lt;<a href=3D"mailto:balbi@=
ti.com" target=3D"_blank">balbi@ti.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<div><div class=3D"h5"><br>
On Mon, Dec 29, 2014 at 04:07:50PM +0800, Sneeker Yeh wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; 2014-12-29 14:41 GMT+08:00 Sneeker Yeh &lt;<a href=3D"mailto:sneeker.y=
eh@gmail.com">sneeker.yeh@gmail.com</a>&gt;:<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; 2014-12-22 23:37 GMT+08:00 Felipe Balbi &lt;<a href=3D"mailto:bal=
bi@ti.com">balbi@ti.com</a>&gt;:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Tue, Dec 16, 2014 at 10:10:28AM +0800, Sneeker Yeh wrote:<=
br>
&gt; &gt;&gt; &gt; Synopsis DesignWare USB3 IP Core integrated with a confi=
g-free<br>
&gt; &gt;&gt; &gt; phy needs special handling during device disconnection t=
o avoid<br>
&gt; &gt;&gt; &gt; the host controller dying.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; This quirk makes sure PORT_CSC is cleared after the disa=
ble slot<br>
&gt; &gt;&gt; &gt; command when usb device is disconnected from internal ro=
ot hub,<br>
&gt; &gt;&gt; &gt; otherwise, Synopsis core would fall into a state that ca=
nnot use<br>
&gt; &gt;&gt; &gt; any endpoint command. Consequently, device disconnection=
 procedure<br>
&gt; &gt;&gt; &gt; might not be finished because sometimes endpoint need to=
 be stop<br>
&gt; &gt;&gt; &gt; by endpoint stop command issuing.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Symptom usually happens when disconnected device is keyb=
oard,<br>
&gt; &gt;&gt; &gt; mouse, and hub.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; you need to point us to the synopsys STARS ticket number. Tha=
t&#39;s the<br>
&gt; &gt;&gt; only way to reference this specific quirk. Add it to a commen=
t<br>
&gt; &gt;&gt; somewhere.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks, we&#39;re still waiting for Synopsis STARS ticket number.=
<br>
&gt; &gt; I&#39;ll add it to comment later.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Sorry I didn&#39;t express myself clearly.<br>
&gt;<br>
&gt; So far Fujitsu Semiconductor got Synopsys internal case id , that is &=
quot;<br>
&gt; Case: 8000679552&quot;.<br>
&gt; However the contents belongs this id cannot be referred except Fujitsu=
<br>
&gt; Semiconductor and Synopsys.<br>
&gt; Synopsis decide the official errata (STAR information) will be disclos=
ed<br>
&gt; next February.<br>
&gt;<br>
&gt; Would you suggest if this quirk can be accepted with this case ID, or =
can<br>
&gt; only be accepted with STARS ticket number?<br>
<br>
</div></div>The thing is that without the STARS number I can&#39;t really v=
erify which<br>
versions of the IP would be affected. Clearly, it&#39;s not only your setup=
<br>
and I think it&#39;s pretty unfair to have &quot;is_compatible(&quot;fujits=
u&quot;)&quot; to<br></blockquote><div><br>just found some way of quirk inj=
ection i miss,<br>does it looks more reasonable if i have to decide to use =
it via Kconfig? :<br>20f6fdd01c2c0de9cc1109083222edded24c5350<br>b2f463e130=
0016785d63475c56f5807e2be00934<br>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
enable the quirk only for you. Isn&#39;t there a better way of enabling the=
<br>
quirk based off of revision detection couple with a look on GHWPARAMS*<br>
registers ?<br>
<br>
What&#39;s tricking me is this claim that only config-free PHYs would be<br=
>
affected, why ?<br></blockquote><div><br></div><div>i&#39;m still strugglin=
g now to try to get more information about this.<br></div><div>some securit=
y policy inside Fujitsu make me unable to access full information of this e=
rrata today.<br><br></div><div>Someday after i get enough information,<br>i=
 shall take your suggestion here that seems better to incur quirk dynamical=
ly via GHWPARAMS,<br></div><div>and then send it here again.<br></div><div>=
=C2=A0<br></div><div>Much appreciate,<br></div><div>Sneeker<br></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I still have many questions about this patch which are not answered by<br>
commit log nor can I poke around on Synopsys solvnet for answers :-s<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
balbi<br>
</font></span></blockquote></div><br></div></div></div></div>

--001a113958c8fc0a11050bd314eb--
