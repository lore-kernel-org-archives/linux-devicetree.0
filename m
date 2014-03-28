From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Fri, 28 Mar 2014 17:26:47 +0800
Message-ID: <53354057.6030004@freescale.com>
References: <1395399017-19005-1-git-send-email-LW@KARO-electronics.de> <20140324095902.GB11377@localhost> <20140326095156.3e5585b8@ipc1.ka-ro> <5332AEE7.2040402@freescale.com> <20140326125502.0e8d0657@ipc1.ka-ro> <20140327095956.GA29623@localhost> <20140327132109.06258526@ipc1.ka-ro> <5334D9F7.2030001@freescale.com> <20140328091646.1ce03f90@ipc1.ka-ro> <53353524.9020605@freescale.com> <20140328090023.GB17250@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140328090023.GB17250@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8828=E6=97=A5 17:00, Sascha Hauer =E5=86=
=99=E9=81=93:
> - disables swapping of BB marks in the FCB the ROM won't swap bytes.
We can not disable the swapping in the FCB in the imx28.
The DISBBM bit in the FCB does _NOT_ exit in the imx28's FCB.


thanks
Huang Shijie

