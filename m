From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/4] Allow to specify an ECC scheme through DT
Date: Fri, 21 Mar 2014 08:34:46 -0300
Message-ID: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we have agreed on the ECC devicetree binding, here's a patchset
that makes pxa3xx-nand driver use it.

This work is required on platforms where the flash device reports a required
ECC strength, but that are capable of handling a stronger one. Simon Guinot
reported a situation where the vendor provided a bootloader configured with
a stronger than required ECC scheme. Without this patches, such a situation
would require a hack to make the driver use a specific ECC scheme.

(Simon: it would be great if you can confirm this allows you to remove any hacks).

The first two patches clean the pxa_ecc_init(), preparing for the real
work to be done.

The third patch makes use of the ECC strength and ECC step size parameters.
To ensure full backward compatibility, the patch *tries* to use DT-specified
ECC parameters, falling back to using the ONFI-specified settings if the
former are missing.

Also, we use the ONFI 'datasheet' ECC strength requirement, to ensure the
DT-specified ECC strength is strong enough to meet the requirement.

Finally, the last patch updates the documentation binding, with the supported
ECC parameters.

Tested on Marvell's Armada 370 RD and also Compulab's CM-X300 (PXA3xx SoC),
which is a non-DT platform. Based on today's l2-mtd.git.

Changes from v1:

  * Fixed typo in ECC strength normalization calculus.

Ezequiel Garcia (4):
  mtd: nand: pxa3xx: Normalize ECC strength for ECC scheme selection
  mtd: nand: pxa3xx: Clean pxa_ecc_init() error handling
  mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding
  mtd: nand: pxa3xx: Add supported ECC strength and step size to the DT
    binding

 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |  8 +++
 drivers/mtd/nand/pxa3xx_nand.c                     | 78 +++++++++++++---------
 include/linux/platform_data/mtd-nand-pxa3xx.h      |  3 +
 3 files changed, 59 insertions(+), 30 deletions(-)

-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
