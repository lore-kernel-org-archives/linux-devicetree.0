Return-Path: <SRS0=QSQ/=OM=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20181203091456.454030-1-tmaimon77@gmail.com> <20181203102240.79a86a26@bbrezillon>
In-Reply-To: <20181203102240.79a86a26@bbrezillon>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 3 Dec 2018 16:09:19 +0200
Message-ID: <CAP6Zq1ib3p=UVC8ct_gvB801_XjTwknXMKPfFCq7=d1Jxv0Dfg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] SPI-NOR add NPCM FIU controller driver
Content-Type: multipart/alternative; boundary="000000000000d05df9057c1e9a57"
To: boris.brezillon@bootlin.com
Cc: David Woodhouse <dwmw2@infradead.org>, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-mtd@lists.infradead.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000d05df9057c1e9a57
Content-Type: text/plain; charset="UTF-8"

Hi Boris,



Thanks for getting back to me on this driver.


A few comments/input:


   1. We have been working on this driver for quite a long time to port it
   to the latest Linux conventions, polish the code, run tests and reach high
   quality.
   Our partners and customers are waiting to get this driver upstream so
   they can freely use it.
   Since this driver is already in final stages and is in very good shape
   we will appreciate if you can review this specific driver/interface and
   help us to upstream it.
   2.  As for the new interface, we are open for any discussion and for
   porting the driver as required.
   We are unsure what is this specific interface and weather it really fits
   a driver for a Flash Interface Controller module (rather than a SPI flash
   device).
   Is it possible to get a sample driver from another Flash Interface
   Controller module that was ported to this new interface ?
   Based on this we can evaluate the required effort and assign it
   accordingly.

Regards,

Tomer


On Mon, 3 Dec 2018 at 11:22, Boris Brezillon <boris.brezillon@bootlin.com>
wrote:

> On Mon,  3 Dec 2018 11:14:54 +0200
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > This patch set adds Flash Interface Unit(FIU) SPI-NOR
> > support for the Nuvoton NPCM Baseboard Management
> > Controller (BMC).
> >
> > The FIU supports single, dual or quad communication interface.
> >
> > the FIU controller can operate in following modes:
> > - User Mode Access(UMA): provides flash access by using an
> >   indirect address/data mechanism.
> > - direct rd/wr mode: maps the flash memory into the core
> >   address space.
> > - SPI-X mode: used for an expansion bus to an ASIC or CPLD.
> >
> > The NPCM750/730/715/710 supports up to three FIU devices:
> > - FIU0 supports two chip select.
> > - FIU3 supports four chip select.
> > - FIUX supports two chip select.
> >
> > The NPCM FIU driver tested on NPCM750 evaluation board.
> >
> > Tomer Maimon (2):
> >   dt-binding: mtd: add NPCM FIU controller
> >   mtd: spi-nor: add NPCM FIU controller driver
> >
> >  Documentation/devicetree/bindings/mtd/npcm-fiu.txt |  64 ++
> >  drivers/mtd/spi-nor/Kconfig                        |   8 +
> >  drivers/mtd/spi-nor/Makefile                       |   1 +
> >  drivers/mtd/spi-nor/npcm-fiu.c                     | 930
> +++++++++++++++++++++
>
> We are currently trying to move all SPI NOR controller drivers out of
> drivers/mtd/spi-nor. Can you try to implement the spi-mem interface [1]
> and place your driver in drivers/spi/.
>
> [1]
> https://elixir.bootlin.com/linux/v4.20-rc5/source/include/linux/spi/spi-mem.h#L185
>

--000000000000d05df9057c1e9a57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;fo=
nt-size:11pt;font-family:Calibri,sans-serif">Hi Boris,</p><p class=3D"MsoNo=
rmal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font-family:Calibri,s=
ans-serif">=C2=A0</p><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001p=
t;font-size:11pt;font-family:Calibri,sans-serif">Thanks for getting back to=
 me on this driver.</p><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.000=
1pt;font-size:11pt;font-family:Calibri,sans-serif"><br></p><p class=3D"MsoN=
ormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font-family:Calibri,=
sans-serif">A few comments/input:</p><p class=3D"MsoNormal" style=3D"margin=
:0cm 0cm 0.0001pt"></p><ol style=3D""><li style=3D""><font face=3D"Calibri,=
 sans-serif"><span style=3D"font-size:14.6667px">We have been working on th=
is driver for quite a long time to port it to the latest Linux conventions,=
 polish the code, run tests and reach high quality.<br>Our partners and cus=
tomers are waiting to get this driver upstream so they can freely use it.<b=
r>Since this driver is already in final stages and is in very good shape we=
 will appreciate if you can review this specific driver/interface and help =
us to upstream it.=C2=A0</span></font></li><li style=3D""><font face=3D"Cal=
ibri, sans-serif"><span style=3D"font-size:14.6667px">=C2=A0As for the new =
interface, we are open for any discussion and for porting the driver as req=
uired.<br>We are unsure what is this specific interface and weather it real=
ly fits a driver for a Flash Interface Controller module (rather than a SPI=
 flash device).<br>Is it possible to get a sample driver from another Flash=
 Interface Controller module that was ported to this new interface ?<br>Bas=
ed on this we can evaluate the required effort and assign it accordingly.=
=C2=A0</span></font></li></ol><div><font face=3D"Calibri, sans-serif"><span=
 style=3D"font-size:14.6667px">Regards,</span></font></div><div><font face=
=3D"Calibri, sans-serif"><span style=3D"font-size:14.6667px"><br></span></f=
ont></div><div><font face=3D"Calibri, sans-serif"><span style=3D"font-size:=
14.6667px">Tomer</span></font></div><p></p></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Mon, 3 Dec 2018 at 11:22, Boris Brezillon &lt;<a h=
ref=3D"mailto:boris.brezillon@bootlin.com">boris.brezillon@bootlin.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon,=C2=A0 3 Dec 2018=
 11:14:54 +0200<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This patch set adds Flash Interface Unit(FIU) SPI-NOR<br>
&gt; support for the Nuvoton NPCM Baseboard Management <br>
&gt; Controller (BMC).<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; The FIU supports single, dual or quad communication interface.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; the FIU controller can operate in following modes:<br>
&gt; - User Mode Access(UMA): provides flash access by using an<br>
&gt;=C2=A0 =C2=A0indirect address/data mechanism.<br>
&gt; - direct rd/wr mode: maps the flash memory into the core<br>
&gt;=C2=A0 =C2=A0address space.<br>
&gt; - SPI-X mode: used for an expansion bus to an ASIC or CPLD.<br>
&gt; <br>
&gt; The NPCM750/730/715/710 supports up to three FIU devices:<br>
&gt; - FIU0 supports two chip select.<br>
&gt; - FIU3 supports four chip select.<br>
&gt; - FIUX supports two chip select.<br>
&gt; <br>
&gt; The NPCM FIU driver tested on NPCM750 evaluation board.<br>
&gt; <br>
&gt; Tomer Maimon (2):<br>
&gt;=C2=A0 =C2=A0dt-binding: mtd: add NPCM FIU controller<br>
&gt;=C2=A0 =C2=A0mtd: spi-nor: add NPCM FIU controller driver<br>
&gt; <br>
&gt;=C2=A0 Documentation/devicetree/bindings/mtd/npcm-fiu.txt |=C2=A0 64 ++=
<br>
&gt;=C2=A0 drivers/mtd/spi-nor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 drivers/mtd/spi-nor/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/mtd/spi-nor/npcm-fiu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 930 +++++++++++++++++++++<br>
<br>
We are currently trying to move all SPI NOR controller drivers out of<br>
drivers/mtd/spi-nor. Can you try to implement the spi-mem interface [1]<br>
and place your driver in drivers/spi/. <br>
<br>
[1]<a href=3D"https://elixir.bootlin.com/linux/v4.20-rc5/source/include/lin=
ux/spi/spi-mem.h#L185" rel=3D"noreferrer" target=3D"_blank">https://elixir.=
bootlin.com/linux/v4.20-rc5/source/include/linux/spi/spi-mem.h#L185</a><br>
</blockquote></div>

--000000000000d05df9057c1e9a57--
