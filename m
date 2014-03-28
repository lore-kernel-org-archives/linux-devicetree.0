From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Fri, 28 Mar 2014 17:33:18 +0800
Message-ID: <533541DE.7020606@freescale.com>
References: <532BCFCC.4080205@freescale.com>	<1395399017-19005-1-git-send-email-LW@KARO-electronics.de>	<20140324095902.GB11377@localhost>	<20140326095156.3e5585b8@ipc1.ka-ro>	<5332AEE7.2040402@freescale.com>	<20140326125502.0e8d0657@ipc1.ka-ro>	<20140327095956.GA29623@localhost>	<20140327132109.06258526@ipc1.ka-ro>	<5334D9F7.2030001@freescale.com>	<20140328091646.1ce03f90@ipc1.ka-ro>	<53353524.9020605@freescale.com> <20140328100158.042a3d68@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140328100158.042a3d68@ipc1.ka-ro>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8828=E6=97=A5 17:01, Lothar Wa=C3=9Fman=
n =E5=86=99=E9=81=93:
> There is no need for the ROM code to access any other partition than
> the bootloader itself. Thus Linux can perfectly well be booted from
Assume the ROM only access the partition which contains the bootloader,=
 and
the ROM does the swapping for the pages(but we do not do the swapping t=
o=20
these pages),

what will happen?



thanks
Huang Shijie

