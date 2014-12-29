Return-Path: <sneeker.yeh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20141222153730.GA12815@saruman>
References: <1418695828-605-1-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<1418695828-605-4-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<20141222153730.GA12815@saruman>
Date: Mon, 29 Dec 2014 14:41:25 +0800
Message-ID: <CAJ1gpc3jVpz=5ME4+wCJDW5NKihvB4xYzwi0co=UuPtG9Ubmjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: dwc3: add a quirk for device disconnection issue
 in Synopsis dwc3 core
From: Sneeker Yeh <sneeker.yeh@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c116c0dc7b7c050b5529b4
To: Felipe Balbi <balbi@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>, Hans de Goede <hdegoede@redhat.com>, Thomas Pugliese <thomas.pugliese@gmail.com>, David Mosberger <davidm@egauge.net>, Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, Andy Green <andy.green@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Sneeker Yeh <Sneeker.Yeh@tw.fujitsu.com>
List-ID: <devicetree@vger.kernel.org>

--001a11c116c0dc7b7c050b5529b4
Content-Type: text/plain; charset=UTF-8

Hi,

2014-12-22 23:37 GMT+08:00 Felipe Balbi <balbi@ti.com>:

> On Tue, Dec 16, 2014 at 10:10:28AM +0800, Sneeker Yeh wrote:
> > Synopsis DesignWare USB3 IP Core integrated with a config-free
> > phy needs special handling during device disconnection to avoid
> > the host controller dying.
> >
> > This quirk makes sure PORT_CSC is cleared after the disable slot
> > command when usb device is disconnected from internal root hub,
> > otherwise, Synopsis core would fall into a state that cannot use
> > any endpoint command. Consequently, device disconnection procedure
> > might not be finished because sometimes endpoint need to be stop
> > by endpoint stop command issuing.
> >
> > Symptom usually happens when disconnected device is keyboard,
> > mouse, and hub.
>
> you need to point us to the synopsys STARS ticket number. That's the
> only way to reference this specific quirk. Add it to a comment
> somewhere.
>

Thanks, we're still waiting for Synopsis STARS ticket number.
I'll add it to comment later.

Much Appreciate,
Sneeker


>
> --
> balbi
>

--001a11c116c0dc7b7c050b5529b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2014-12-22 23:37 GMT+08:00 Felipe Balbi <span dir=3D"ltr">=
&lt;<a href=3D"mailto:balbi@ti.com" target=3D"_blank">balbi@ti.com</a>&gt;<=
/span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D=
"">On Tue, Dec 16, 2014 at 10:10:28AM +0800, Sneeker Yeh wrote:<br>
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
somewhere.<br></blockquote><div><br></div><div>Thanks, we&#39;re still wait=
ing for Synopsis STARS ticket number.<br></div><div>I&#39;ll add it to comm=
ent later.<br><br></div><div>Much Appreciate,<br></div><div>Sneeker<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D""><font color=3D"#888888"><br>
--<br>
balbi<br>
</font></span></blockquote></div><br></div></div></div></div>

--001a11c116c0dc7b7c050b5529b4--
