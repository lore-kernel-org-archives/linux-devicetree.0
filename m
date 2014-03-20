From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Thu, 20 Mar 2014 18:56:16 +0800
Message-ID: <532AC950.6070108@freescale.com>
References: <1395235406-13449-1-git-send-email-y>	<532AB1A2.9010702@freescale.com>	<20140320102153.7106f915@ipc1.ka-ro>	<532AB94D.1050406@freescale.com> <20140320110914.731db7cf@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140320110914.731db7cf@ipc1.ka-ro>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Cc: y@KARO-electronics.de, Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, b47714@freescale.com
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8820=E6=97=A5 18:09, Lothar Wa=C3=9Fman=
n =E5=86=99=E9=81=93:
> This can be disabled by parameter in the FCB (at least according to
> the i.MX6 reference Manual):
from imx28's reference manual, there is not such bit in the FCB to=20
disable the
swapping. But you are disabling the swapping in the imx28's DTS file,=20
isn't it?

I think it is dangerous.



> |DISBBM 172 4 If 0 ROM will swap BadBlockMarkerByte with
> |             metadata[0] after reading a page using BCH40.
> |             If the value set is 1 then ROM will not do
> |             swapping
>
>
I will consult with our ROM colleague about this DISBBM bit.

I am not sure if the ROM still do the swapping for the uboot when we se=
t=20
DISBBM bit.

thanks
Huang Shijie
