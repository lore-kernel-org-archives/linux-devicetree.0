From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V2 0/4] mtd: nand: add enum nand_ecc_algo
Date: Wed, 30 Mar 2016 15:27:10 +0200
Message-ID: <20160330152710.0b33d28d@bbrezillon>
References: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458728343-1234-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rafal,

On Wed, 23 Mar 2016 11:18:59 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Some time ago I started working on a new "nand-ecc-algo" property to =
allow
> specifying ECC algorithm for hardware ECC mode as well.
> Boris pointed out it's becoming a bit messy that way as we already ha=
ve value
> NAND_ECC_SOFT_BCH.
> I suggested deprecating "soft_bch" value from nand-ecc-mode property =
and got
> Boris agreed and no objections from others. So there is how I want to=
 implement
> this.
> If you agree on this way & apply my patches, I'll start modifying NAN=
D drivers
> (similarly to the nandsim) and then will try to drop NAND_ECC_SOFT_BC=
H except
> for handling backward compatibility.
> Then finally we should be able to add "nand-ecc-algo" property suppor=
t properly.

Can you configure git-send-email to not encode your messages in base64?

Thanks,

Boris

>=20
> V2: Add of_get_nand_ecc_algo helper (in 2/4) instead of this slightly=
 hacky code
>     in nand_dt_init that would be replaced anyway.
>=20
> Rafa=C5=82 Mi=C5=82ecki (4):
>   mtd: nand: add new enum for storing ECC algorithm
>   of: mtd: prepare helper reading NAND ECC algo from DT
>   mtd: nand: set ECC algorithm in nand_dt_init
>   mtd: nand: nandsim: set ECC algorithm explicitly
>=20
>  drivers/mtd/nand/nand_base.c |  6 +++++-
>  drivers/mtd/nand/nandsim.c   |  2 ++
>  drivers/of/of_mtd.c          | 36 ++++++++++++++++++++++++++++++++++=
++
>  include/linux/mtd/nand.h     |  7 +++++++
>  include/linux/of_mtd.h       |  6 ++++++
>  5 files changed, 56 insertions(+), 1 deletion(-)
>=20



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
