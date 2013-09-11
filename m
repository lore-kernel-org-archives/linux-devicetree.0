From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 11 Sep 2013 10:38:02 +0800
Message-ID: <522FD78A.6080900@freescale.com>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com> <20130905020435.GA3970@gmail.com> <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com> <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com> <20130909151450.GI29403@sirena.org.uk> <522EC33B.9000009@freescale.com> <20130910180704.GB29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130910180704.GB29403@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA09=D4=C211=C8=D5 02:07, Mark Brown =D0=B4=B5=C0:
> The code to work out what opcodes to send to the device should be spl=
it
> out of the device driver so that other drivers talking to these chips
this code should be in the MTD code, not in the drivers.
I have spilted this code, please see patch 3 & patch 4.


> don't need to reimplement the logic and new chips with new opcodes do=
n't
> need to be added to multiple drivers.
Since there is no standard for SPI-NOR commands, we _should_ add new
code for
new chips with new opcodes. For example, if a new chip supports the
quad-read with
a new command 0xef, we can submit a small patch for m25p80 to fix it.

We have to do it in such way, no shortcut.


thanks
Huang Shijie




