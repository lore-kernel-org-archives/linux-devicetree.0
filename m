From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] Add Core Divider clock support for Armada 370/XP
Date: Wed, 25 Sep 2013 18:37:31 -0300
Message-ID: <20130925213730.GA19371@localhost>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380144502-24109-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

(Ccing forgotten mvebu maintainers)

On Wed, Sep 25, 2013 at 06:28:17PM -0300, Ezequiel Garcia wrote:
> This patchset adds support for a set of clocks available in Armada 37=
0/XP
> known as "Core Divider" clocks.
>=20
> These are a set of gatable clocks, derived from a fixed PLL at
> a configurable ratio. Although this patchset adds support for the mor=
e
> general case, we only support one of the clocks, namely the NAND ECC =
clock.
>=20
> With this infrastructure in place, the addition of the rest of the cl=
ocks
> would be fairly easy.
>=20
> In addition, the NAND clock is added as a fixed-ratio from the NAND E=
CC clock,
> to model accurately the SoC clock tree.
>=20
> A pictorical representation of the clock tree would be:
>=20
>     PLL
>     |
>     |
>     ---------------------
>     |			|
>     |			|
>     NAND ECC clock	...
>     |
>     |
>     NAND clock
>=20
> This patchset is based on v3.12-rc2. Any opinions are highly apprecia=
ted.
>=20
> Thanks!
>=20
> Ezequiel Garcia (5):
>   clk: mvebu: Add core-divider clock
>   ARM: mvebu: Add Core Divider clock device-tree binding
>   ARM: mvebu: Add a 2 GHz fixed-clock Armada 370/XP
>   ARM: mvebu: Add the core-divider clock to Armada 370/XP
>   ARM: mvebu: Add NAND clock to Armada 370/XP
>=20
>  .../bindings/clock/mvebu-corediv-clock.txt         |  19 ++
>  arch/arm/boot/dts/armada-370-xp.dtsi               |  25 +++
>  drivers/clk/mvebu/Kconfig                          |   5 +
>  drivers/clk/mvebu/Makefile                         |   1 +
>  drivers/clk/mvebu/clk-corediv.c                    | 209 +++++++++++=
++++++++++
>  5 files changed, 259 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mvebu-cor=
ediv-clock.txt
>  create mode 100644 drivers/clk/mvebu/clk-corediv.c
>=20
> --=20
> 1.8.1.5
>=20

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
