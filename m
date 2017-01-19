From: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [PATCH v2 0/3] Add support for Broadcom iProc mailbox controller
Date: Wed, 18 Jan 2017 17:39:37 -0800
Message-ID: <1484789980-6812-1-git-send-email-jonathan.richardson@broadcom.com>
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
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jonathan Richardson <jonathan.richardson@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Russell King <linux@armlinux.org.uk>, Vikram Prakash <vikram.prakash@broadcom.com>, Rob Herring <robh+dt@kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch set contains mailbox support for Broadcom iProc based SoC's. The
mailbox controller handles all communication with a Cortex-M0 MCU processor that
provides support for power, clock, and reset management.

The patch set enables the mailbox controller for Cygnus and also interrupt
support for the Cygnus CRMU GPIO driver which requires use of the M0 processor.

Changes from v1:
- Interrupt handling has been removed and will be added to an interrupt
  controller driver and sent out in a separate patchset.
- Moved location of bcm_iproc_mailbox.h to include/linux/mailbox as suggested by
  Jassi.
- Removed reading of client timeout from driver and used canned timeout. This
  removes the need of including the client mailbox header.

Jonathan Richardson (3):
  dt-bindings: Document Broadcom iProc mailbox controller driver
  mailbox: Add iProc mailbox controller driver
  ARM: dts: Enable Broadcom iProc mailbox controller

 .../bindings/mailbox/brcm,iproc-mailbox.txt        |  14 ++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   6 +
 drivers/mailbox/Kconfig                            |  10 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/bcm-iproc-mailbox.c                | 199 +++++++++++++++++++++
 include/linux/mailbox/bcm_iproc_mailbox.h          |  32 ++++
 6 files changed, 263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt
 create mode 100644 drivers/mailbox/bcm-iproc-mailbox.c
 create mode 100644 include/linux/mailbox/bcm_iproc_mailbox.h

-- 
1.9.1
