Return-Path: <matthias.bgg@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407852737-17265-1-git-send-email-matthias.bgg@gmail.com>
References: <1407852737-17265-1-git-send-email-matthias.bgg@gmail.com>
Date: Tue, 2 Sep 2014 12:00:42 +0200
Message-ID: <CABuKBeLA4UWo5hsDbQn1mjP7vDWxU80c-SWZu2equN=NDJGRVA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] tty: serial: Add mediatek UART driver
From: Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/alternative; boundary=089e0149421044744105021231dc
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, jslaby@suse.cz, Grant Likely <grant.likely@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Cox <alan@linux.intel.com>, Varka Bhadram <varkabhadram@gmail.com>, Tobias Klauser <tklauser@distanz.ch>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Yingjoe Chen <yingjoe.chen@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, linux-serial@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--089e0149421044744105021231dc
Content-Type: text/plain; charset=UTF-8

2014-08-12 16:12 GMT+02:00 Matthias Brugger <matthias.bgg@gmail.com>:

> This patch set adds support for the UART found in Mediatek SoCs.
> The chip is a changed version of a 8250 controller.
> Especially it introduces a new register called highspeed. The value
> in this register has to be set depending on the baudrate. The value
> in the register influences the way the divisor has to be calculated.
>
> The patch series is build against v3.16-rc1 and tested on mt6589. Should
> work as well on mt6577 and mt6582.
>
> Thanks,
> Matthias
>

Ping: Does anyone has any comments on this series?


>
> Changes for v4:
> - delete owner in platform driver instance
> - pass plattform_device to mtk8250_probe_of
> - reorganise probe function to error out early
> - Fix DTS documentation
>
> Changes for v3:
> - use dev_warn instead of pr_warn
> - use 8250_core function to update termios
>
> Changes for v2:
> - drop 8250_core capability extension for the chip
> - encapsulate set_termios in the driver method
>
> ---
>
> Matthias Brugger (2):
>   tty: serial: 8250: Add Mediatek UART driver
>   DTS: serial: Add bindings documention for the Mediatek UARTs
>
>  .../devicetree/bindings/serial/mtk-uart.txt        |   20 ++
>  drivers/tty/serial/8250/8250_mtk.c                 |  294
> ++++++++++++++++++++
>  drivers/tty/serial/8250/Kconfig                    |    7 +
>  drivers/tty/serial/8250/Makefile                   |    1 +
>  4 files changed, 322 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/mtk-uart.txt
>  create mode 100644 drivers/tty/serial/8250/8250_mtk.c
>
> --
> 1.7.9.5
>
>


-- 
motzblog.wordpress.com

--089e0149421044744105021231dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2014-08-12 16:12 GMT+02:00 Matthias Brugger <span dir=3D"ltr">&lt;<=
a href=3D"mailto:matthias.bgg@gmail.com" target=3D"_blank">matthias.bgg@gma=
il.com</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This patch set adds support for the UART fou=
nd in Mediatek SoCs.<br>
The chip is a changed version of a 8250 controller.<br>
Especially it introduces a new register called highspeed. The value<br>
in this register has to be set depending on the baudrate. The value<br>
in the register influences the way the divisor has to be calculated.<br>
<br>
The patch series is build against v3.16-rc1 and tested on mt6589. Should<br=
>
work as well on mt6577 and mt6582.<br>
<br>
Thanks,<br>
Matthias<br></blockquote><div><br></div><div>Ping: Does anyone has any comm=
ents on this series?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
Changes for v4:<br>
- delete owner in platform driver instance<br>
- pass plattform_device to mtk8250_probe_of<br>
- reorganise probe function to error out early<br>
- Fix DTS documentation<br>
<br>
Changes for v3:<br>
- use dev_warn instead of pr_warn<br>
- use 8250_core function to update termios<br>
<br>
Changes for v2:<br>
- drop 8250_core capability extension for the chip<br>
- encapsulate set_termios in the driver method<br>
<br>
---<br>
<br>
Matthias Brugger (2):<br>
=C2=A0 tty: serial: 8250: Add Mediatek UART driver<br>
=C2=A0 DTS: serial: Add bindings documention for the Mediatek UARTs<br>
<br>
=C2=A0.../devicetree/bindings/serial/mtk-uart.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A020 ++<br>
=C2=A0drivers/tty/serial/8250/8250_mtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 294 ++++++++++++++++++++<br>
=C2=A0drivers/tty/serial/8250/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7 +<br>
=C2=A0drivers/tty/serial/8250/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A04 files changed, 322 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/serial/mtk-uart.=
txt<br>
=C2=A0create mode 100644 drivers/tty/serial/8250/8250_mtk.c<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><a href=
=3D"http://motzblog.wordpress.com" target=3D"_blank">motzblog.wordpress.com=
</a>
</div></div>

--089e0149421044744105021231dc--
