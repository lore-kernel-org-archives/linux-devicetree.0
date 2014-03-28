From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Fri, 28 Mar 2014 10:00:23 +0100
Message-ID: <20140328090023.GB17250@pengutronix.de>
References: <1395399017-19005-1-git-send-email-LW@KARO-electronics.de>
 <20140324095902.GB11377@localhost>
 <20140326095156.3e5585b8@ipc1.ka-ro>
 <5332AEE7.2040402@freescale.com>
 <20140326125502.0e8d0657@ipc1.ka-ro>
 <20140327095956.GA29623@localhost>
 <20140327132109.06258526@ipc1.ka-ro>
 <5334D9F7.2030001@freescale.com>
 <20140328091646.1ce03f90@ipc1.ka-ro>
 <53353524.9020605@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53353524.9020605@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 28, 2014 at 04:39:00PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8828=E6=97=A5 16:16, Lothar Wa=C3=9Fm=
ann =E5=86=99=E9=81=93:
> >Still there is no need for the Linux NAND driver to be able to read =
or
> >write partitions in a format that the Boot ROM can understand. Thus =
it
> If you do not use the NAND boot, there really no need to do so.
>=20
> Since you need the NAND boot, we should enable the swapping for imx28=
=2E
> >is perfectly legal to allow disregarding the BB marks and solely rel=
y on
> >a flash based BBT.
> >
> The BB mark is in the page 0 of a NAND block. But the swapping can
> occur in _each_ page of
> a NAND block, _NOT_ only the page 0.
>=20
> I think you are confusing at these two things.

I think you are confusing two things. If Lothar:

- disables swapping of BB marks in the FCB the ROM won't swap bytes.
- writes data without swapping
- Uses a DBBT for telling the ROM code where bad blocks are
- uses a Flash BBT for mtd

Then everything should work just fine.

Sascha

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
