From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 0/3] NAND support for Broadcom NS2 SoC
Date: Fri, 30 Oct 2015 12:29:18 +0530
Message-ID: <1446188361-15146-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux MTD <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We enable NAND support for Broadcom NS2 SoC by reusing existing
BRCMNAND driver.

This patchset applies on-top of "arm64: Simple additions to
NS2 DT" v1 patchset and is available in ns2_nand_v5 branch of
https://github.com/Broadcom/arm64-linux.git.

The patchset is tested on NS2 SVK.

Changes since v4:
 - Fix accidental typo in patch2 regarding use of CFG_BUS_WIDTH

Changes since v3:
 - Include Brian's patch for magic number cleanup related to
   CFG and CFG_EXT registers
 - Base patch1 of v3 patchset upon Brian's cleanup patch

Changes since v2:
 - Dropped patch1 and patch2 because these are already merged
   by MTD maintainer.
 - Avoid using absolute node paths in ns2-svk.dts.

Changes since v1:
 - Dropped patch3 and patch4 because we don't need to reset
   BRCMNAND controller for NS2.
 - Added patch to force 8bit mode before doing nand_scan_ident()
   in brcmnand_init_cs().

Anup Patel (2):
  mtd: brcmnand: Force 8bit mode before doing nand_scan_ident()
  arm64: dts: Add BRCM IPROC NAND DT node for NS2

Brian Norris (1):
  mtd: brcmnand: factor out CFG and CFG_EXT bitfields

 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 30 +++++++++++++-------
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 14 ++++++++++
 drivers/mtd/nand/brcmnand/brcmnand.c     | 48 +++++++++++++++++++++++++++-----
 3 files changed, 75 insertions(+), 17 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
