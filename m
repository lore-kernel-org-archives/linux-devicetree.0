Return-Path: <sneeker.yeh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ1gpc3jVpz=5ME4+wCJDW5NKihvB4xYzwi0co=UuPtG9Ubmjg@mail.gmail.com>
References: <1418695828-605-1-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<1418695828-605-4-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<20141222153730.GA12815@saruman>
	<CAJ1gpc3jVpz=5ME4+wCJDW5NKihvB4xYzwi0co=UuPtG9Ubmjg@mail.gmail.com>
Date: Mon, 29 Dec 2014 16:07:50 +0800
Message-ID: <CAJ1gpc3-Wjtm54WOhO6RXjZft9BMngzyYC0-S-XnTacV-qKgMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: dwc3: add a quirk for device disconnection issue
 in Synopsis dwc3 core
From: Sneeker Yeh <sneeker.yeh@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c15bfee628e0050b565e1b
To: Felipe Balbi <balbi@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>, Hans de Goede <hdegoede@redhat.com>, Thomas Pugliese <thomas.pugliese@gmail.com>, David Mosberger <davidm@egauge.net>, Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, Andy Green <andy.green@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Sneeker Yeh <Sneeker.Yeh@tw.fujitsu.com>
List-ID: <devicetree@vger.kernel.org>

--001a11c15bfee628e0050b565e1b
Content-Type: text/plain; charset=UTF-8

Hi,

2014-12-29 14:41 GMT+08:00 Sneeker Yeh <sneeker.yeh@gmail.com>:

> Hi,
>
> 2014-12-22 23:37 GMT+08:00 Felipe Balbi <balbi@ti.com>:
>
>> On Tue, Dec 16, 2014 at 10:10:28AM +0800, Sneeker Yeh wrote:
>> > Synopsis DesignWare USB3 IP Core integrated with a config-free
>> > phy needs special handling during device disconnection to avoid
>> > the host controller dying.
>> >
>> > This quirk makes sure PORT_CSC is cleared after the disable slot
>> > command when usb device is disconnected from internal root hub,
>> > otherwise, Synopsis core would fall into a state that cannot use
>> > any endpoint command. Consequently, device disconnection procedure
>> > might not be finished because sometimes endpoint need to be stop
>> > by endpoint stop command issuing.
>> >
>> > Symptom usually happens when disconnected device is keyboard,
>> > mouse, and hub.
>>
>> you need to point us to the synopsys STARS ticket number. That's the
>> only way to reference this specific quirk. Add it to a comment
>> somewhere.
>>
>
> Thanks, we're still waiting for Synopsis STARS ticket number.
> I'll add it to comment later.
>
>
Sorry I didn't express myself clearly.

So far Fujitsu Semiconductor got Synopsys internal case id , that is "
Case: 8000679552".
However the contents belongs this id cannot be referred except Fujitsu
Semiconductor and Synopsys.
Synopsis decide the official errata (STAR information) will be disclosed
next February.

Would you suggest if this quirk can be accepted with this case ID, or can
only be accepted with STARS ticket number?

BR,
Sneeker



> Much Appreciate,
> Sneeker
>
>
>>
>> --
>> balbi
>>
>
>

--001a11c15bfee628e0050b565e1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2014-12-29 14:41 GMT+08:00 Sneeker Yeh <span dir=3D"ltr">&=
lt;<a href=3D"mailto:sneeker.yeh@gmail.com" target=3D"_blank">sneeker.yeh@g=
mail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">Hi,<br><div><div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote"><div><div class=3D"h5">2014-12-22 23:37 GMT+08:00 Felip=
e Balbi <span dir=3D"ltr">&lt;<a href=3D"mailto:balbi@ti.com" target=3D"_bl=
ank">balbi@ti.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span>On Tue, Dec 16, 2014 at 10:10:28AM +0800, Sneeker Yeh wro=
te:<br>
&gt; Synopsis DesignWare USB3 IP Core integrated with a config-free<br>
&gt; phy needs special handling during device disconnection to avoid<br>
&gt; the host controller dying.<br>
&gt;<br>
&gt; This quirk makes sure PORT_CSC is cleared after the disable slot<br>
&gt; command when usb device is disconnected from internal root hub,<br>
&gt; otherwise, Synopsis core would fall into a state that cannot use<br>
&gt; any endpoint command. Consequently, device disconnection procedure<br>
&gt; might not be finished because sometimes endpoint need to be stop<br>
&gt; by endpoint stop command issuing.<br>
&gt;<br>
&gt; Symptom usually happens when disconnected device is keyboard,<br>
&gt; mouse, and hub.<br>
<br>
</span>you need to point us to the synopsys STARS ticket number. That&#39;s=
 the<br>
only way to reference this specific quirk. Add it to a comment<br>
somewhere.<br></blockquote><div><br></div></div></div><div>Thanks, we&#39;r=
e still waiting for Synopsis STARS ticket number.<br></div><div>I&#39;ll ad=
d it to comment later.<br><br></div></div></div></div></div></div></blockqu=
ote><div><br></div><div>Sorry I didn&#39;t express myself clearly.<br><br>S=
o far Fujitsu Semiconductor got Synopsys internal case id , that is &quot; =
Case: 8000679552&quot;.
<br>However the contents belongs this id cannot be referred except Fujitsu =
Semiconductor and Synopsys.
<br>Synopsis decide the official errata (STAR information) will be disclose=
d next February.
<br></div><div><br>Would you suggest if this quirk can be accepted with thi=
s case ID, or can only be accepted with STARS ticket number?<br><br></div><=
div>BR,<br></div><div>Sneeker<br></div><div><br>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><div></div><div>Much Appreciate,<b=
r></div><div>Sneeker<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<span><font color=3D"#888888"><br><span class=3D""><font color=3D"#888888">
--<br>
balbi<br>
</font></span></font></span></blockquote></div><br></div></div></div></div>
</blockquote></div><br></div></div></div></div>

--001a11c15bfee628e0050b565e1b--
