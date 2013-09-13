From: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 22:58:30 -0400
Message-ID: <20130913025827.GA3051@gmail.com>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
 <52318953.6090405@freescale.com>
 <1378979431.2627.402.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1378979431.2627.402.camel@shinybook.infradead.org>
Sender: linux-doc-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: Huang Shijie <b32955@freescale.com>, Mark Brown <broonie@kernel.org>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2013 at 10:50:31AM +0100, David Woodhouse wrote:
> On Thu, 2013-09-12 at 17:28 +0800, Huang Shijie wrote:
> > =E4=BA=8E 2013=E5=B9=B409=E6=9C=8811=E6=97=A5 22:05, David Woodhous=
e =E5=86=99=E9=81=93:
> > > What*actually*  happens, on the wire(s), when the flash driver as=
ks the
> > > SPI controller to perform a transaction?
> > The LUT registers tell the controller how many wires are needed for=
 a=20
> > transaction.
> > For example, the read status only use a single line, while the quad=
 read=20
> > uses 4 lines.
>=20
> Is this not something that could theoretically be provided by the cal=
ler
> when it *makes* the transaction?
>=20
> Conceptually speaking, could it not be an additional argument to
> spi_write_then_read() ?=20
>=20
> After all, it's the *device* driver (m25p80.c etc.) which will know w=
hat
> the transaction actually *is*, and how many lines the device will wan=
t
> to use for each transaction?
yes. we can set the lines information in the spi_write_then_read().

But for the quadspi driver, it does not need this information.

When the drivers knows that it is a Quad-read transaction, it will uses
the relative LUT sequence which uses the 4 lines.

thanks
Huang Shijie


