From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] Add Core Divider clock support for Armada 370/XP
Date: Thu, 26 Sep 2013 13:00:11 -0300
Message-ID: <20130926160010.GD4583@localhost>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130925213730.GA19371@localhost>
 <5243E46B.2000406@free-electrons.com>
 <20130926152651.GC4583@localhost>
 <20130926174755.15a65f92@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130926174755.15a65f92@skate>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2013 at 05:47:55PM +0200, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
>=20
> On Thu, 26 Sep 2013 12:26:52 -0300, Ezequiel Garcia wrote:
>=20
> > 3. We hack the NAND driver to consume the NAND ECC, but use the rat=
e
> > as the half of it, and forget about the halved-rate NAND clock.
> > This seems certainly hacky.
>=20
> Is this really hacky? Since we can't change the rate of one without
> changing the other, or gating the one without the other, we can also
> see those two clocks as being an internal business of the NAND hardwa=
re
> block. So instead of seeing things as:
>=20
>                         -------------
>  NAND ECC clk    ---->  |           |=20
>      ||                 |  NAND HW  |
>      ||                 |   block   |
>      \/                 |           |
>  NAND clk        ---->  |           |
>                         -------------
>=20
> You can see things as follows:
>=20
>                         -------------
>                         |           |=20
>                         |  NAND HW  |
>  NAND clk        ---->  |   block   |
>                         |           |
>                         |           |
>                         -------------
>=20
> and the ECC clock is actually some internal business of the NAND hw
> block, and therefore handled internally by the NAND driver, as your
> option (3) suggests.
>=20
> Since the amount of details that we have about the exact hardware
> architecture are pretty scarce, I believe this is probably the easies=
t
> solution.
>=20

Hm... could be. Considering the lack of hardware details (as you
point out) maybe this is indeed the best option.

And it has the cool advantage of simplfying the clock tree, which
is unnecessarily complex with the NAND ECC clock -> NAND clock layout.

On the other side, Emilio has just pointed out (in private) that there'=
s
a flag "CLK_SET_RATE_PARENT" that is meant for these cases.

Anyway, I feel inclined to your suggestion and just forget about the NA=
ND
ECC clock for good, which is only confusing.

Thanks,
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
