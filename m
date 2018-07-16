Return-Path: <SRS0=5CrG=KA=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180716113357.GA30937@kroah.com>
References: <20180704091427.409971-1-tmaimon77@gmail.com> <20180704091427.409971-3-tmaimon77@gmail.com>
 <20180716113357.GA30937@kroah.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 16 Jul 2018 15:31:50 +0300
Message-ID: <CAP6Zq1hUr_3X-B1wPZpk5o88hibusJ2w04VUeR8Tw+OqftQuZg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] misc: npcm7xx: add NPCM7xx LPC BPC driver
Content-Type: multipart/alternative; boundary="0000000000008ee45705711d033c"
To: Greg KH <gregkh@linuxfoundation.org>, benjaminfair@google.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, arnd@arnd.de, Avi Fishman <avifishman70@gmail.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux HWMON List <linux-hwmon@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-ID: <devicetree@vger.kernel.org>

--0000000000008ee45705711d033c
Content-Type: text/plain; charset="UTF-8"

[+Benjamin Fair]

Hi Greg,

This hardware is working in the same manner that Aspeed lpc snooping driver
(/drivers/misc/aspeed-lpc-snoop.c)

On 16 July 2018 at 14:33, Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Jul 04, 2018 at 12:14:27PM +0300, Tomer Maimon wrote:
> > Add Nuvoton BMC NPCM7xx BIOS post code (BPC) driver.
> >
> > The NPCM7xx BPC monitoring two I/O address written by
> > the host on the Low Pin Count (LPC) bus, the capure
> > data stored in 128-word FIFO.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> It would be great to get someone else who knows that this hardware is
> supposed to be doing to ack or sign-off on this patch, as I don't know
> if this really is providing the correct api for it or not.
>

Joel could you sign-off this patch please.

Right now it's just reading data from the hardware, what good is that?
> Who uses this?  What userspace tools connect up to it?
>

BMC is logging a configurable I/O port (for example 0x80 port which is BIOS
post code) and remote management can get.

about tools, the OpenBMC is using it.
https://github.com/openbmc/phosphor-host-postd


> thanks,
>
> greg k-h
>

thanks,

Tomer

--0000000000008ee45705711d033c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">[+Benjamin Fair]=C2=A0<div><br></div><div>Hi Greg,</div><d=
iv><br></div><div>This hardware is working in the same manner that Aspeed l=
pc snooping driver (/drivers/misc/aspeed-lpc-snoop.c)</div><div><br></div><=
div class=3D"gmail_extra"><div class=3D"gmail_quote">On 16 July 2018 at 14:=
33, Greg KH <span dir=3D"ltr">&lt;<a href=3D"mailto:gregkh@linuxfoundation.=
org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On=
 Wed, Jul 04, 2018 at 12:14:27PM +0300, Tomer Maimon wrote:<br>
&gt; Add Nuvoton BMC NPCM7xx BIOS post code (BPC) driver.<br>
&gt; <br>
&gt; The NPCM7xx BPC monitoring two I/O address written by<br>
&gt; the host on the Low Pin Count (LPC) bus, the capure<br>
&gt; data stored in 128-word FIFO.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt;<br>
<br>
</span>It would be great to get someone else who knows that this hardware i=
s<br>
supposed to be doing to ack or sign-off on this patch, as I don&#39;t know<=
br>
if this really is providing the correct api for it or not.=C2=A0<br></block=
quote><div>=C2=A0</div><div>Joel could you sign-off this patch please.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Right now it&#39;s just reading data from the hardware, what good is that?<=
br>
Who uses this?=C2=A0 What userspace tools connect up to it?<br></blockquote=
><div><br></div><div>BMC is logging a configurable I/O port (for example 0x=
80 port which is BIOS post code) and remote management can get.=C2=A0</div>=
<div><br></div><div>about tools, the OpenBMC is using it.</div><div><a href=
=3D"https://github.com/openbmc/phosphor-host-postd">https://github.com/open=
bmc/phosphor-host-postd</a><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
thanks,<br>
<br>
greg k-h<br></blockquote><div><br></div><div>thanks,</div><div><br></div><d=
iv>Tomer=C2=A0</div></div><br></div></div>

--0000000000008ee45705711d033c--
