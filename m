From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v6 0/2] Broadcom FlexRM ring manager support
Date: Wed, 15 Mar 2017 12:09:59 +0530
Message-ID: <1489560001-22948-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Pramod KUMAR <pramod.kumar@broadcom.com>, Rob Rice <rob.rice@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

The Broadcom FlexRM ring manager provides producer-consumer style
ring interface for offload engines on Broadcom iProc SoCs. We can
have one or more instances of Broadcom FlexRM ring manager in a SoC.

This patchset adds a mailbox driver for Broadcom FlexRM ring manager
which can be used by offload engine drivers as mailbox clients.

The Broadcom FlexRM mailbox driver is feature complete for RAID and
Crypto offload engines. We will have incremental patches in-future
for ring-level statistics using debugfs and minor optimizations.

This patchset is based on Linux-4.11-rc2 and it is also available
at flexrm-v6 branch of https://github.com/Broadcom/arm64-linux.git

Changes since v5:
 - Rebased patches for Linux-4.11-rc2
 - Merged all source files into one source file and removed
   driver directory

Changes since v4:
 - Rebased patches for Linux-4.11-rc1

Changes since v3:
 - Fixed mailbox client example DT node in DT bindings document

Changes since v2:
 - Rebased patches for Linux-4.10-rc2

Changes since v1:
 - Use compatile string as brcm,iproc-flexrm-mbox
 - Rephrase commit message and text in DT bindings patch

Anup Patel (2):
  mailbox: Add driver for Broadcom FlexRM ring manager
  dt-bindings: Add DT bindings info for FlexRM ring manager

 .../bindings/mailbox/brcm,iproc-flexrm-mbox.txt    |   59 +
 drivers/mailbox/Kconfig                            |   11 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/bcm-flexrm-mailbox.c               | 1595 ++++++++++++++++++++
 include/linux/mailbox/brcm-message.h               |   14 +-
 5 files changed, 1677 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.txt
 create mode 100644 drivers/mailbox/bcm-flexrm-mailbox.c

-- 
2.7.4
