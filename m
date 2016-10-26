Return-Path: <rajatja@google.com>
MIME-Version: 1.0
In-Reply-To: <20161026210805.GA14423@localhost>
References: <1477070156-109965-1-git-send-email-rajatja@google.com>
 <1477084869-15612-1-git-send-email-rajatja@google.com> <20161026201735.GA10192@localhost>
 <20161026204648.GD3989@dtor-ws> <CACK8Z6H1ACBo7nDxaXR3Vn9cPdyRqxxzdgYz7vNmojiSvjbW5A@mail.gmail.com>
 <20161026205634.GA13170@localhost> <20161026210648.GE3989@dtor-ws> <20161026210805.GA14423@localhost>
From: Rajat Jain <rajatja@google.com>
Date: Wed, 26 Oct 2016 14:12:26 -0700
Message-ID: <CACK8Z6GgZ25xb7Vy9O=T-fGgSVnMdJ2MiQ8ooWSs37M=8Ni9SA@mail.gmail.com>
Subject: Re: [PATCH v6] mwifiex: parse device tree node for PCIe
Content-Type: multipart/alternative; boundary=94eb2c0885a46cdb2a053fcb17c9
To: Brian Norris <briannorris@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, Xinming Hu <huxm@marvell.com>, Amitkumar Karwar <akarwar@marvell.com>, Brian Norris <briannorris@google.com>, Kalle Valo <kvalo@codeaurora.org>, Rob Herring <robh@kernel.org>, Rajat Jain <rajatxjain@gmail.com>
List-ID: <devicetree@vger.kernel.org>

--94eb2c0885a46cdb2a053fcb17c9
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 26, 2016 at 2:08 PM, Brian Norris <briannorris@chromium.org>
wrote:

> On Wed, Oct 26, 2016 at 02:06:48PM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 26, 2016 at 01:56:34PM -0700, Brian Norris wrote:
> > > On Wed, Oct 26, 2016 at 01:51:48PM -0700, Rajat Jain wrote:
> > > >    On Wed, Oct 26, 2016 at 1:46 PM, Dmitry Torokhov
> > > >    <dmitry.torokhov@gmail.com> wrote:
> > > >      On Wed, Oct 26, 2016 at 01:17:36PM -0700, Brian Norris wrote:
> > > >      Sorry, I just saw this... Why do we need devicetree data for
> > > >      discoverable bus (PCI)? How does the driver work on systems
> that do not
> > > >      use DT? Why do we need them to behave differently?
> > > >
> > > >    There are a couple of out-of-band GPIO pins from Marvell chip
> that can
> > > >    serve as wake-up pins (wake up the CPU when asserted). The
> Marvell chip
> > > >    has to be told which GPIO pin is to be used as the wake-up pin.
> The pin to
> > > >    be used is system / platform dependent. (On some systems it could
> be
> > > >    GPIO13, on others it could be GPIO14 etc depending on how the
> marvell chip
> > > >    is wired up to the CPU).
> >
> > So wakeup pin is not wired to PCIe WAKE?
>
> Not in our case.
>
> > > There's also calibration data. See "marvell,caldata*" and
> > > "marvell,wakeup-pin" properties. Currently only for SDIO, in
> > > Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt, but
> > > we're adding support for PCIe.
> >
> > How would it all work if I moved the PCIe module from one device to
> > another?
>
> These boards are soldered down, at least in the case I care about.
>

Correct. Since the out of band wake-up pin is not standard on the PCIe
connector - this feature is for soldered chips only.


>
> Brian
>

--94eb2c0885a46cdb2a053fcb17c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Oct 26, 2016 at 2:08 PM, Brian Norris <span dir=3D"ltr">&lt;<a =
href=3D"mailto:briannorris@chromium.org" target=3D"_blank">briannorris@chro=
mium.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Wed, Oct 26, 2016 at 02:06:48PM -0700, Dmitry Torokhov wrote:<b=
r>
&gt; On Wed, Oct 26, 2016 at 01:56:34PM -0700, Brian Norris wrote:<br>
&gt; &gt; On Wed, Oct 26, 2016 at 01:51:48PM -0700, Rajat Jain wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 On Wed, Oct 26, 2016 at 1:46 PM, Dmitry Torokho=
v<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 &lt;<a href=3D"mailto:dmitry.torokhov@gmail.com=
">dmitry.torokhov@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 On Wed, Oct 26, 2016 at 01:17:36PM -0700=
, Brian Norris wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 Sorry, I just saw this... Why do we need=
 devicetree data for<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 discoverable bus (PCI)? How does the dri=
ver work on systems that do not<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 use DT? Why do we need them to behave di=
fferently?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 There are a couple of out-of-band GPIO pins fro=
m Marvell chip that can<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 serve as wake-up pins (wake up the CPU when ass=
erted). The Marvell chip<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 has to be told which GPIO pin is to be used as =
the wake-up pin. The pin to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 be used is system / platform dependent. (On som=
e systems it could be<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 GPIO13, on others it could be GPIO14 etc depend=
ing on how the marvell chip<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 is wired up to the CPU).<br>
&gt;<br>
&gt; So wakeup pin is not wired to PCIe WAKE?<br>
<br>
</span>Not in our case.<br>
<span class=3D""><br>
&gt; &gt; There&#39;s also calibration data. See &quot;marvell,caldata*&quo=
t; and<br>
&gt; &gt; &quot;marvell,wakeup-pin&quot; properties. Currently only for SDI=
O, in<br>
&gt; &gt; Documentation/devicetree/<wbr>bindings/net/wireless/marvell-<wbr>=
sd8xxx.txt, but<br>
&gt; &gt; we&#39;re adding support for PCIe.<br>
&gt;<br>
&gt; How would it all work if I moved the PCIe module from one device to<br=
>
&gt; another?<br>
<br>
</span>These boards are soldered down, at least in the case I care about.<b=
r></blockquote><div><br></div><div>Correct. Since the out of band wake-up p=
in is not standard on the PCIe connector - this feature is for soldered chi=
ps only.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Brian<br>
</font></span></blockquote></div><br></div></div>

--94eb2c0885a46cdb2a053fcb17c9--
