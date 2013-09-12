From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 17:18:23 +0800
Message-ID: <523186DF.4070203@freescale.com>
References: <20130905020435.GA3970@gmail.com> <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com> <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com> <20130909151450.GI29403@sirena.org.uk> <522EC33B.9000009@freescale.com> <20130910180704.GB29403@sirena.org.uk> <522FD78A.6080900@freescale.com> <20130911104126.GN29403@sirena.org.uk> <52304BFF.4060007@freescale.com> <20130911113002.GP29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130911113002.GP29403@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA09=D4=C211=C8=D5 19:30, Mark Brown =D0=B4=B5=C0:
> Indeed - what I was wondering was if those opcodes could be requested
> from the flash driver rather than coded in there.  The driver needs t=
o
> write the commands to the device but it's not clear to me if it reall=
y
> needs to know the specific commands.
yes. The driver uses the commands to find the _right_ LUT index, and
uses the LUT index to
trigger the controller.

=46or example, LUT0-LUT3 is used for the READ_STATUS, the driver will
match the
0 index for the NOR's read status operation (0x05), and then the driver
write 0 to the QSPI_IPCR
register to trigger the operation.

thanks
Huang Shijie


