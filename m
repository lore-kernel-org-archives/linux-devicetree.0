From: Rob Rice <rob.rice@broadcom.com>
Subject: [PATCH RESEND 0/3] Add Broadcom PDC mailbox driver
Date: Tue, 14 Jun 2016 10:02:42 -0400
Message-ID: <1465912965-35500-1-git-send-email-rob.rice@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Anup Patel <anup.patel@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, rob.rice@broadcom.com, Rob Rice <rrice@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Rob Rice <rrice@broadcom.com>

The Broadcom PDC mailbox driver is a ring manager for the Broadcom
Secure Processing Unit (SPU) kernel driver and other mailbox clients.
The PDC driver registers with the Linux mailbox framework a mailbox
controller, once for each PDC instance. Ring 0 for each PDC is registered as
a mailbox channel. The PDC driver uses interrupts to determine when ring
transfers to and from an offload engine are complete. The PDC driver uses
threaded IRQs so that response messages are handled outside of interrupt
context.

For RESEND, added Rob Herring's Ack of bindings doc and rebased
to Linux 4.7-rc3.

Rob Rice (3):
  dt-bindings: add bindings documentation for PDC driver.
  mailbox: Add Broadcom PDC mailbox driver
  arm64: dts: Add Broadcom Northstar2 device tree entries for PDC
    driver.

 .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       |   23 +
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |   36 +
 drivers/mailbox/Kconfig                            |    9 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/mailbox-pdc/Makefile               |    8 +
 drivers/mailbox/mailbox-pdc/pdc.c                  | 1181 ++++++++++++++++++++
 drivers/mailbox/mailbox-pdc/pdc.h                  |  303 +++++
 drivers/mailbox/mailbox-pdc/pdc_debug.c            |  101 ++
 drivers/mailbox/mailbox-pdc/pdc_debug.h            |   24 +
 include/linux/mailbox/brcm-message.h               |   56 +
 10 files changed, 1743 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
 create mode 100644 drivers/mailbox/mailbox-pdc/Makefile
 create mode 100644 drivers/mailbox/mailbox-pdc/pdc.c
 create mode 100644 drivers/mailbox/mailbox-pdc/pdc.h
 create mode 100644 drivers/mailbox/mailbox-pdc/pdc_debug.c
 create mode 100644 drivers/mailbox/mailbox-pdc/pdc_debug.h
 create mode 100644 include/linux/mailbox/brcm-message.h

-- 
2.1.0
