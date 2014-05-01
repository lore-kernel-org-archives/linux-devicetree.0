From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] mtd: nand: add randomizer support
Date: Thu, 1 May 2014 20:37:43 +0200
Message-ID: <20140501183743.GA17618@kwain>
References: <1398906592-24677-1-git-send-email-b.brezillon.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398906592-24677-1-git-send-email-b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

On Thu, May 01, 2014 at 03:09:49AM +0200, Boris BREZILLON wrote:
> Hello,
>=20
> This series is a proposal to add support for randomizers (either soft=
ware
> or hardware) to NAND flash controller drivers.

Thanks for providing this! I'll need these features soon and I'm happy
to see them coming into the nand controller framework.


Antoine

> The last patch is the sunxi HW randomizer implementation and is just =
given
> as an example (it won't apply on the MTD tree, because it depends on =
other
> stuff not yet posted on the MTD ML, but if you want a full overview o=
f the
> NAND Flash controller driver you can take a look at this series [2]).
>=20
> I can also provide a software implementation based on LFSR (Left Feed=
back
> Shift Register) algorithm, thought I haven't tested it yet, hence why=
 it's
> not part of this series. Let me know if you're interested in this
> implementation.
>=20
> This series depends on the "per-partition ECC" series [1], because I =
need
> the randomizer seed to be different depending on the partition (for t=
he
> same reason I needed ECC config to be different for each partition: t=
he
> bootrom config might not fit the NAND chip requirements).
>=20
> I'd like to have feedback from both MTD maintainers and driver
> developers who might need to implement (or use) a randomizer in their
> system, so feel free to comment on this series.
>=20
> Best Regards,
>=20
> Boris
>=20
> [1] https://lkml.org/lkml/2014/2/12/627
> [2] https://groups.google.com/forum/#!msg/linux-sunxi/s3lBb01I0Js/z2N=
oCFJ83g4J=20
>=20
>=20
> Boris BREZILLON (3):
>   mtd: nand: introduce a randomizer layer in the NAND framework
>   of: mtd: add NAND randomizer mode retrieval
>   mtd: nand: add sunxi randomizer support
>=20
>  drivers/mtd/nand/nand_base.c  | 278 ++++++++++++++++++-----
>  drivers/mtd/nand/sunxi_nand.c | 507 ++++++++++++++++++++++++++++++++=
+++++++++-
>  drivers/of/of_mtd.c           |  35 +++
>  include/linux/mtd/nand.h      |  98 ++++++++
>  include/linux/of_mtd.h        |   6 +
>  5 files changed, 858 insertions(+), 66 deletions(-)
>=20
> --=20
> 1.8.3.2
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
