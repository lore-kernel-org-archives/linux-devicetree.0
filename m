Return-Path: <SRS0=+6Kn=UM=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190610133245.306812-1-tmaimon77@gmail.com> <20190610133245.306812-3-tmaimon77@gmail.com>
 <CAK8P3a0s1fdt2yHVjOXffeKPKkwUyJ7DKCZHHMKjx+3j300ZAQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0s1fdt2yHVjOXffeKPKkwUyJ7DKCZHHMKjx+3j300ZAQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 13 Jun 2019 12:26:42 +0300
Message-ID: <CAP6Zq1jZEUzbB-ZidF2SD24k8iC_uBkXZ9WbtPpOYNCRjRTz3g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
Content-Type: multipart/alternative; boundary="000000000000100856058b3104ab"
To: Arnd Bergmann <arnd@arndb.de>, Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: Olof Johansson <olof@lixom.net>, gregkh <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Avi Fishman <avifishman70@gmail.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

--000000000000100856058b3104ab
Content-Type: text/plain; charset="UTF-8"

Adding Patrick and Joel to this discussion,

Thanks for your prompt reply!

On Tue, 11 Jun 2019 at 16:12, Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Jun 10, 2019 at 4:19 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Add Nuvoton BMC NPCM BIOS post code (BPC) driver.
> >
> > The NPCM BPC monitoring two I/O address written by
> > the host on the Low Pin Count (LPC) bus, the capure
> > data stored in 128-word FIFO.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> We've run into this situation before, but don't have a good solution yet:
>
> The driver seems useful and well implemented, but I keep having a bad
> feeling about adding a chardev driver into drivers/soc for something that
> is clearly specific to a particular implementation on the hardware side
> but generic on the user interface. The same user interface might be
> used on an Aspeed BMC or any other one, so please coordinate at
> least between Novoton and Aspeed developers on creating a common
> user interface, and review each other's patches.
>

Probably the only vendors that will use the snoop will be Nuvoton and
Aspeed.
is it worth to create new snoop common user interface for it,
if we will develop a new snoop user interface who will be the maintainer?


> Maybe we can introduce a drivers/bmc/ (or even drivers/openbmc)
>
that collects all those user interfaces with a thin abstraction layer
> and one or two hardware specific back-ends?
>

Sounds good, Maybe we can move the KCS BMC from driver/char/ipmi to the
drivers/bmc/?


>         Arnd
>

appreciate your opinions, Joel, Andrew and Patrick?

Thanks,

Tomer

--000000000000100856058b3104ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Adding Patrick and Joel to this discussion,</div><div=
><br></div><div>Thanks for your prompt reply!</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 Jun 2019 at 16:12, =
Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de">arnd@arndb.de</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jun=
 10, 2019 at 4:19 PM Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com=
" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add Nuvoton BMC NPCM BIOS post code (BPC) driver.<br>
&gt;<br>
&gt; The NPCM BPC monitoring two I/O address written by<br>
&gt; the host on the Low Pin Count (LPC) bus, the capure<br>
&gt; data stored in 128-word FIFO.<br>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
<br>
We&#39;ve run into this situation before, but don&#39;t have a good solutio=
n yet:<br>
<br>
The driver seems useful and well implemented, but I keep having a bad<br>
feeling about adding a chardev driver into drivers/soc for something that<b=
r>
is clearly specific to a particular implementation on the hardware side<br>
but generic on the user interface. The same user interface might be<br>
used on an Aspeed BMC or any other one, so please coordinate at<br>
least between Novoton and Aspeed developers on creating a common<br>
user interface, and review each other&#39;s patches.<br></blockquote><div>=
=C2=A0</div><div>Probably the only vendors that will use the snoop will be =
Nuvoton and Aspeed.</div><div>is it worth to create new snoop common user i=
nterface for it,=C2=A0</div><div>if we will develop a new snoop user interf=
ace who will be the maintainer?</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Maybe we can introduce a drivers/bmc/ (or even drivers/openbmc)<br></blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">that collects all th=
ose user interfaces with a thin abstraction layer<br>
and one or two hardware specific back-ends?<br></blockquote><div>=C2=A0</di=
v><div>Sounds good, Maybe we can move the KCS BMC from driver/char/ipmi to =
the drivers/bmc/?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br></blockquote><div><br></div>appreciate =
your opinions, Joel, Andrew and Patrick?</div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">Thanks,</div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Tomer<br class=3D"gmail-Apple-intercha=
nge-newline"><div>=C2=A0</div></div></div>

--000000000000100856058b3104ab--
