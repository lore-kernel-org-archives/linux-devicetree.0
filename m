From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 0/3] mtd: nand: add randomizer support
Date: Thu,  1 May 2014 03:09:49 +0200
Message-ID: <1398906592-24677-1-git-send-email-b.brezillon.dev@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series is a proposal to add support for randomizers (either software
or hardware) to NAND flash controller drivers.

The last patch is the sunxi HW randomizer implementation and is just given
as an example (it won't apply on the MTD tree, because it depends on other
stuff not yet posted on the MTD ML, but if you want a full overview of the
NAND Flash controller driver you can take a look at this series [2]).

I can also provide a software implementation based on LFSR (Left Feedback
Shift Register) algorithm, thought I haven't tested it yet, hence why it's
not part of this series. Let me know if you're interested in this
implementation.

This series depends on the "per-partition ECC" series [1], because I need
the randomizer seed to be different depending on the partition (for the
same reason I needed ECC config to be different for each partition: the
bootrom config might not fit the NAND chip requirements).

I'd like to have feedback from both MTD maintainers and driver
developers who might need to implement (or use) a randomizer in their
system, so feel free to comment on this series.

Best Regards,

Boris

[1] https://lkml.org/lkml/2014/2/12/627
[2] https://groups.google.com/forum/#!msg/linux-sunxi/s3lBb01I0Js/z2NoCFJ83g4J 


Boris BREZILLON (3):
  mtd: nand: introduce a randomizer layer in the NAND framework
  of: mtd: add NAND randomizer mode retrieval
  mtd: nand: add sunxi randomizer support

 drivers/mtd/nand/nand_base.c  | 278 ++++++++++++++++++-----
 drivers/mtd/nand/sunxi_nand.c | 507 +++++++++++++++++++++++++++++++++++++++++-
 drivers/of/of_mtd.c           |  35 +++
 include/linux/mtd/nand.h      |  98 ++++++++
 include/linux/of_mtd.h        |   6 +
 5 files changed, 858 insertions(+), 66 deletions(-)

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
