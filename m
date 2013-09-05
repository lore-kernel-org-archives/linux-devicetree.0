From: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 4 Sep 2013 21:43:53 -0400
Message-ID: <20130905014350.GA2261@gmail.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <522697E9.1050208@freescale.com>
 <20130904095523.GT3084@sirena.org.uk>
 <52270B8E.5080402@freescale.com>
 <20130904113322.GA5859@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130904113322.GA5859@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org, computersforpeace@gmail.com, b44548@freescale.com, dedekind1@gmail.com, linux-doc@vger.kernel.org, b18965@freescale.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de, lznuaa@gmail.com, shawn.guo@linaro.org, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 04, 2013 at 12:33:22PM +0100, Mark Brown wrote:
> On Wed, Sep 04, 2013 at 06:29:34PM +0800, Huang Shijie wrote:
> > =E4=BA=8E 2013=E5=B9=B409=E6=9C=8804=E6=97=A5 17:55, Mark Brown =E5=
=86=99=E9=81=93:
> > > On Wed, Sep 04, 2013 at 10:16:09AM +0800, Huang Shijie wrote:
>=20
> > >> Since this quadspi driver depends on the mtd code, could this dr=
iver
> > >> goes to the kernel by
> > >> the l2-mtd tree?
>=20
> > > Why would a SPI driver depend on MTD?
>=20
> > The patch 1-4 are for m25p80.c, and this quadspi controller drivers
> > depends on the
> > patch 1-4.
>=20
> In what way does the controller driver depend on those changes?
This driver needs the spi nor command to fill the LUT register, such as
OPCODE_WREN(0x06), so the patch 1 moves the spi nor command to a seprat=
e
header spi-nor.h, and this driver includes this new header.

thanks
Huang Shijie

