From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v5 0/2] Broadcom FlexRM ring manager support
Date: Mon,  6 Mar 2017 15:10:38 +0530
Message-ID: <1488793240-25484-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Anup Patel <anup.patel@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Pramod KUMAR <pramod.kumar@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Rob Rice <rob.rice@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Broadcom FlexRM ring manager provides producer-consumer style
ring interface for offload engines on Broadcom iProc SoCs. We can
have one or more instances of Broadcom FlexRM ring manager in a SoC.

This patchset adds a mailbox driver for Broadcom FlexRM ring manager
which can be used by offload engine drivers as mailbox clients.

The Broadcom FlexRM mailbox driver is feature complete for RAID and
Crypto offload engines. We will have incremental patches in-future
for ring-level statistics using debugfs and minor optimizations.

This patchset is based on Linux-4.11-rc1 and it is also available
at flexrm-v5 branch of https://github.com/Broadcom/arm64-linux.git

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

 .../bindings/mailbox/brcm,iproc-flexrm-mbox.txt    |  59 ++
 drivers/mailbox/Kconfig                            |  11 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/mailbox-flexrm/Makefile            |   6 +
 drivers/mailbox/mailbox-flexrm/flexrm-desc.c       | 764 +++++++++++++++++++
 drivers/mailbox/mailbox-flexrm/flexrm-desc.h       |  47 ++
 drivers/mailbox/mailbox-flexrm/flexrm-main.c       | 829 +++++++++++++++++++++
 include/linux/mailbox/brcm-message.h               |  14 +-
 8 files changed, 1728 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.txt
 create mode 100644 drivers/mailbox/mailbox-flexrm/Makefile
 create mode 100644 drivers/mailbox/mailbox-flexrm/flexrm-desc.c
 create mode 100644 drivers/mailbox/mailbox-flexrm/flexrm-desc.h
 create mode 100644 drivers/mailbox/mailbox-flexrm/flexrm-main.c

-- 
2.7.4
