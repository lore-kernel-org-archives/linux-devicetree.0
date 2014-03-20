From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Thu, 20 Mar 2014 17:15:14 +0800
Message-ID: <532AB1A2.9010702@freescale.com>
References: <1395235406-13449-1-git-send-email-y>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1395235406-13449-1-git-send-email-y>
Sender: linux-doc-owner@vger.kernel.org
To: y@karo-electronics.de
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@karo-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8819=E6=97=A5 21:23, y@karo-electronics=
=2Ede =E5=86=99=E9=81=93:
> configurable via DT. This is required for the Ka-Ro electronics
> platforms.
>
If you disable the swapping, you will disable the NAND boot in actually=
=2E

do you need the nand boot?

could you please tell me more detail background?

thanks
Huang Shijie

