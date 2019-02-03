From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 4/9] mtd: rawnand: jz4780: Add support for the JZ4740
Date: Sun, 3 Feb 2019 15:08:27 +0100
Message-ID: <20190203150827.401ac31d@bbrezillon>
References: <20190202231926.2444-1-paul@crapouillou.net>
        <20190202231926.2444-5-paul@crapouillou.net>
        <20190203083151.4fc29c5b@bbrezillon>
        <1549202213.1950.1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549202213.1950.1@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 03 Feb 2019 10:56:53 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Le dim. 3 f=C3=A9vr. 2019 =C3=A0 4:31, Boris Brezillon <bbrezillon@kernel=
.org>=20
> a =C3=A9crit :
> > On Sat,  2 Feb 2019 20:19:21 -0300
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >  =20
> >>  Add support for probing the jz4780-nand driver on the JZ4740 SoC=20
> >> from
> >>  Ingenic.
> >>=20
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  ---
> >>=20
> >>  Changes:
> >>=20
> >>  v2: - Add support for the JZ4740 and not the JZ4725B: they behave=20
> >> the
> >>        same, and JZ4740 is fully upstream while JZ4725B is not. The
> >>        JZ4725B devicetree will then simply use the=20
> >> "ingenic,jz4740-nand"
> >>        compatible string.
> >>      - Fix the number of bytes for the ECC when the ECC strength is=20
> >> 4.
> >>        This is needed for the JZ4740, which uses Reed-Solomon=20
> >> instead of
> >>        BCH.
> >>=20
> >>   drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 48=20
> >> +++++++++++++++++----- =20
> >=20
> > If we're going to make the driver compatible with jz4740 and jz4725b
> > maybe we should rename the source files jz47xx_{nand,bch}.{c,h}. =20
>=20
> I don't know about that. Adding support for new hardware isn't a good=20
> reason to
> rename the driver, or so I've been told around here, as you then make=20
> it harder
> to review the git history of the driver.

You already move files to a sub-directory so that doesn't make a huge
difference, history will be hard to follow because of this move anyway.
