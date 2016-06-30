From: Rob Rice <rob.rice@broadcom.com>
Subject: [PATCH v2 0/3] Add Broadcom PDC mailbox driver
Date: Thu, 30 Jun 2016 15:59:21 -0400
Message-ID: <1467316764-19686-1-git-send-email-rob.rice@broadcom.com>
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
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Anup Patel <anup.patel@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Catalin Marinas <catalin.marinas@arm.com>, rob.rice@broadcom.com, linux-arm-kernel@lists.infradead.org, Rob Rice <rrice@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Rob Rice <rrice@broadcom.com>

Changes in v2:
- Added COMPILE_TEST depend to PDC Kconfig
- Renamed pdc.c to bcm-pdc-mailbox.c and moved it from subdirectory
  to drivers/mailbox
- Moved code from pdc.h, pdc_debug.h, and pdc_debug.c into
  bcm-pdc-mailbox.c
- Removed a few function parameters

The Broadcom PDC mailbox driver is a ring manager for the Broadcom
Secure Processing Unit (SPU) kernel driver and other mailbox clients.
The PDC driver registers with the Linux mailbox framework a mailbox
controller, once for each PDC instance. Ring 0 for each PDC is registered as
a mailbox channel. The PDC driver uses interrupts to determine when ring
transfers to and from an offload engine are complete. The PDC driver uses
threaded IRQs so that response messages are handled outside of interrupt
context.

Rob Rice (3):
  dt-bindings: add bindings documentation for PDC driver.
  mailbox: Add Broadcom PDC mailbox driver
  arm64: dts: Add Broadcom Northstar2 device tree entries for PDC
    driver.

 .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       |   23 +
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |   36 +
 drivers/mailbox/Kconfig                            |    9 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/bcm-pdc-mailbox.c                  | 1531 ++++++++++++++++++++
 include/linux/mailbox/brcm-message.h               |   56 +
 6 files changed, 1657 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
 create mode 100644 drivers/mailbox/bcm-pdc-mailbox.c
 create mode 100644 include/linux/mailbox/brcm-message.h

-- 
2.1.0
