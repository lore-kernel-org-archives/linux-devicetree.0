From: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 5 Sep 2013 22:36:44 -0400
Message-ID: <20130906023605.GA2292@gmail.com>
References: <20130905014350.GA2261@gmail.com>
 <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C885@DBDE04.ent.ti.com>
 <5228369A.9000904@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C907@DBDE04.ent.ti.com>
 <52284F32.2020302@freescale.com>
 <20130905135032.GB3084@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130905135032.GB3084@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Huang Shijie <b32955@freescale.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2013 at 02:50:32PM +0100, Mark Brown wrote:
> On Thu, Sep 05, 2013 at 05:30:26PM +0800, Huang Shijie wrote:
> > =E4=BA=8E 2013=E5=B9=B409=E6=9C=8805=E6=97=A5 17:11, Gupta, Pekon =E5=
=86=99=E9=81=93:
>=20
> > >Anyway, if you really want to continue with this is, then please r=
e-name
> > >include/linux/mtd/spi-nor.h to
> > >include/linux/mtd/spi-fsl-quadspi.h
> > >because something specific for your driver should not conflict wit=
h
> > >generic spi-nor framework added later.
>=20
> > i think there is no specific thing for this driver. The S25FL128S i=
s
> > a common flash,
> > other person may uses it too. Could you show me what is specific?
>=20
> > so, i prefer to spi-nor.h.
>=20
> Looking at the current header there just seem to be defines in there,=
 no
> abstraction for the chips.  Perhaps that is what is missing?
we do not need any abstraction for this chip, we only need the SPI NOR=20
commands, such as Quad read / DDR quad read.


thanks
Huang Shijie





