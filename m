Return-Path: <jorik@kippendief.biz>
MIME-Version: 1.0
In-Reply-To: <CAGb2v66c8uFHUtVtHOZCfxDEEgG7CzZgBRKWMUQS7NTizF6jyQ@mail.gmail.com>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
 <1472671858-29220-4-git-send-email-jorik@kippendief.biz> <CAGb2v66c8uFHUtVtHOZCfxDEEgG7CzZgBRKWMUQS7NTizF6jyQ@mail.gmail.com>
From: Jorik Jonker <jorik@kippendief.biz>
Date: Thu, 1 Sep 2016 08:31:08 +0200
Message-ID: <CAKqGPHwBqWn05SQqEPUQiwxi=WyBJ2LFto2Ucbh8w=Eqe49eTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dts: sun8i-h3: add i2c0/i2c1 SoC peripherals
Content-Type: multipart/alternative; boundary=001a11411d66f7a796053b6c5be0
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11411d66f7a796053b6c5be0
Content-Type: text/plain; charset=UTF-8

Hi,

A bit tricky to reply to two mails in one, as I think my reply relates to
both, but here it goes.

On 1 September 2016 at 04:42, Chen-Yu Tsai <wens@csie.org> wrote:

> On Thu, Sep 1, 2016 at 3:30 AM,  <jorik@kippendief.biz> wrote:
> > From: Jorik Jonker <jorik@kippendief.biz>
> >
> > This enables the i2c0/i2c1 peripherals of the SoC. There is actually a
> third
> > controller, but I do not have a board on hands on which i2c2 is exposed
> in such
> > a way that I can verify that it works.
>
> If they are listed in the manual, and the interrupts, clocks, resets, pins
> all exist, that is good enough for me.
>

That sounds sensible, I will do that in v3.

> These pinmuxes are the only ones possible for each peripheral.
> Please drop the _a suffix and the @0 address for both of them.

Agreed. But: I think the same goes for UARTs 0-3, of which 0-1 have a
pinmux following the _a / @0 syntax in current kernel. There are not really
options here, except leaving out RTS/CTS on uarts1-3, which one could do in
a board-specific pinmux.

Moreover, I could put all the pinmux-peripheral associations for H3 in the
DTSI, removing them from the DTS files (including already existing), as the
associations themselves are not really board specific, right?

Best,
Jorik

--001a11411d66f7a796053b6c5be0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
>Hi,</div><div><br></div><div>A bit tricky to reply to two mails in one, as=
 I think my reply relates to both, but here it goes.</div><div><br></div></=
div><div class=3D"gmail_quote">On 1 September 2016 at 04:42, Chen-Yu Tsai <=
span dir=3D"ltr">&lt;<a href=3D"mailto:wens@csie.org" target=3D"_blank">wen=
s@csie.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-">On Thu, Sep 1, 2016 at 3:30 AM,=C2=A0 &lt=
;<a href=3D"mailto:jorik@kippendief.biz">jorik@kippendief.biz</a>&gt; wrote=
:<br>
&gt; From: Jorik Jonker &lt;<a href=3D"mailto:jorik@kippendief.biz">jorik@k=
ippendief.biz</a>&gt;<br>
&gt;<br>
&gt; This enables the i2c0/i2c1 peripherals of the SoC. There is actually a=
 third<br>
&gt; controller, but I do not have a board on hands on which i2c2 is expose=
d in such<br>
&gt; a way that I can verify that it works.<br>
<br>
</span>If they are listed in the manual, and the interrupts, clocks, resets=
, pins<br>
all exist, that is good enough for me.<br></blockquote><div><br></div><div>=
That sounds sensible, I will do that in v3.=C2=A0<br></div><div><br></div><=
div>&gt; These pinmuxes are the only ones possible for each peripheral.<br>=
</div><div>&gt; Please drop the _a suffix and the @0 address for both of th=
em.<br></div><div><br></div><div>Agreed. But: I think the same goes for UAR=
Ts 0-3, of which 0-1 have a pinmux following the _a / @0 syntax in current =
kernel. There are not really options here, except leaving out RTS/CTS on ua=
rts1-3, which one could do in a board-specific pinmux.</div><div><br></div>=
<div>Moreover, I could put all the pinmux-peripheral associations for H3 in=
 the DTSI, removing them from the DTS files (including already existing), a=
s the associations themselves are not really board specific, right?</div><d=
iv><br></div><div>Best,</div><div>Jorik</div></div></div></div>

--001a11411d66f7a796053b6c5be0--
