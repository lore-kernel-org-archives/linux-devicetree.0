From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 11 Sep 2013 18:54:55 +0800
Message-ID: <52304BFF.4060007@freescale.com>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com> <20130905020435.GA3970@gmail.com> <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com> <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com> <20130909151450.GI29403@sirena.org.uk> <522EC33B.9000009@freescale.com> <20130910180704.GB29403@sirena.org.uk> <522FD78A.6080900@freescale.com> <20130911104126.GN29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130911104126.GN29403@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA09=D4=C211=C8=D5 18:41, Mark Brown =D0=B4=B5=C0:
> So why does the SPI driver have references to the opcodes in it?
I admit that the Freescale's quadspi controller is very special
(it is designed too coupled with the SPI Nor FLASH),
it is driven by the LUT registers.

I just quote the comment from the patch 1:


-------------------------------------------------------------
(2) The definition of the LUT register shows below:

---------------------------------------------------
| INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
---------------------------------------------------

There are several types of INSTRx, such as:
CMD : the SPI NOR command.
ADDR : the address for the SPI NOR command.
DUMMY : the dummy cycles needed by the SPI NOR command.
=2E...
-------------------------------------------------------------------

The LUT registers needs to be filled with the SPI NOR command, such
=46ast-read/Quad-read.
So the Quadspi driver needs to know the spi commands, and that's why th=
e
SPI driver has
references to the spi command opcodes.

=20
thanks
Huang Shijie




