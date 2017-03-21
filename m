From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/5] mtd: nand: add support for on-die ECC
Date: Tue, 21 Mar 2017 11:38:01 +0100
Message-ID: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds support for on-die ECC, i.e ECC performed by
the NAND chip itself, as opposed to having the ECC calculated by the
NAND controller or in software.

It is useful in situations where the NAND chip has an ECC requirement
that is not met by the ECC capabilities of the NAND controller.

Patch 1 adjusts the NAND generic DT binding to add "on-die" as an
nand-ecc-mode.

Patch 2 adds the core support for on-die ECC, which is really simple
and minimal: all the work is really done in the vendor-specific NAND
code.

Patch 3 and 4 adds the on-die ECC implementation for Micron NANDs.

Patch 5 allows the FSMC NAND driver to use on-die ECC.

This series was tested on a SPEAr600 platform, with a Micron
MT29F1G08ABADAWP NAND. The mtd_nandbiterrs.ko test is passing
successfully, which shows that the on-die ECC is correcting bitflips
as expected.

This series is based on the current nand-next branch, as it depends on
the rework from Boris of the vendor-specific NAND code.

Many thanks to Boris from providing lots of useful feedback and
discussion during the development of this patch series.

Best regards,

Thomas

Thomas Petazzoni (5):
  dt-bindings: mtd: document new "on-die" nand-ecc-mode
  mtd: nand: add core support for on-die ECC
  mtd: nand: export nand_{read,write}_page_raw()
  mtd: nand: add support for Micron on-die ECC
  mtd: nand: fsmc_nand: handle on-die ECC case

 Documentation/devicetree/bindings/mtd/nand.txt |   2 +-
 drivers/mtd/nand/fsmc_nand.c                   |   3 +
 drivers/mtd/nand/nand_base.c                   |  23 +++-
 drivers/mtd/nand/nand_micron.c                 | 147 +++++++++++++++++++++++++
 include/linux/mtd/nand.h                       |  11 ++
 5 files changed, 181 insertions(+), 5 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
