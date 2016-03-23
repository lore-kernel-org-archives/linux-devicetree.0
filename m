From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 0/4] mtd: nand: add enum nand_ecc_algo
Date: Wed, 23 Mar 2016 11:18:59 +0100
Message-ID: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some time ago I started working on a new "nand-ecc-algo" property to al=
low
specifying ECC algorithm for hardware ECC mode as well.
Boris pointed out it's becoming a bit messy that way as we already have=
 value
NAND_ECC_SOFT_BCH.
I suggested deprecating "soft_bch" value from nand-ecc-mode property an=
d got
Boris agreed and no objections from others. So there is how I want to i=
mplement
this.
If you agree on this way & apply my patches, I'll start modifying NAND =
drivers
(similarly to the nandsim) and then will try to drop NAND_ECC_SOFT_BCH =
except
for handling backward compatibility.
Then finally we should be able to add "nand-ecc-algo" property support =
properly.

V2: Add of_get_nand_ecc_algo helper (in 2/4) instead of this slightly h=
acky code
    in nand_dt_init that would be replaced anyway.

Rafa=C5=82 Mi=C5=82ecki (4):
  mtd: nand: add new enum for storing ECC algorithm
  of: mtd: prepare helper reading NAND ECC algo from DT
  mtd: nand: set ECC algorithm in nand_dt_init
  mtd: nand: nandsim: set ECC algorithm explicitly

 drivers/mtd/nand/nand_base.c |  6 +++++-
 drivers/mtd/nand/nandsim.c   |  2 ++
 drivers/of/of_mtd.c          | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  7 +++++++
 include/linux/of_mtd.h       |  6 ++++++
 5 files changed, 56 insertions(+), 1 deletion(-)

--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
