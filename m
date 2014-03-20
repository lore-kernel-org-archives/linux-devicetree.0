From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Thu, 20 Mar 2014 17:47:57 +0800
Message-ID: <532AB94D.1050406@freescale.com>
References: <1395235406-13449-1-git-send-email-y>	<532AB1A2.9010702@freescale.com> <20140320102153.7106f915@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140320102153.7106f915@ipc1.ka-ro>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Cc: y@KARO-electronics.de, Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, b47714@freescale.com
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8820=E6=97=A5 17:21, Lothar Wa=C3=9Fman=
n =E5=86=99=E9=81=93:
> Hi,
>
> Huang Shijie wrote:
>> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8819=E6=97=A5 21:23, y@karo-electron=
ics.de =E5=86=99=E9=81=93:
>>> configurable via DT. This is required for the Ka-Ro electronics
>>> platforms.
>>>
>> If you disable the swapping, you will disable the NAND boot in actua=
lly.
>>
> No. All our modules do boot from NAND and none of them does the
> swapping.
>
>
It seems the NAND boot runs well by luck.

The ROM will do the swapping when it reads the BBT table written by the=
=20
kobs-ng (or something else?).

If the BBT table is small, not bigger then a page, the NAND boot may=20
runs well when you disable the swapping;
But it the BBT table is bigger, the ROM will get a corrupted BBT table.



thanks
Huang Shijie
