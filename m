From: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/4] Add support for Broadcom iProc mailbox controller
Date: Wed, 25 Jan 2017 16:26:58 -0800
Message-ID: <1485390422-3984-1-git-send-email-jonathan.richardson@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set contains mailbox support for Broadcom iProc based SoC's. The
mailbox controller handles all communication with a Cortex-M0 MCU processor that
provides support for power, clock, and reset management.

The patch set enables the mailbox controller for Cygnus and also interrupt
support for the Cygnus CRMU GPIO driver which requires use of the M0 processor.

Changes from v2:
 - Fixed binding to remove leading 0 (Rob's comment). Also added more detail as
   suggested by Jassi.
 - Added changelog to dt binding and enable dts commits.
 - Changed year in copyright in bcm_iproc_mailbox.h.
 - Changes to bcm-cygnus.dtsi were prematurely merged into the mainline after
   Rob acked the DT changes but Jassi suggested changes to the mailbox driver.
   The result was that the mailbox controller node and changes to the crmu gpio
   driver to enable interrupt handling were incorrectly added to the dtsi. A
   commit is included in this patchset to revert those changes. Enabling
   interrupt handling in the the crmu gpio driver will be introduced when the
   interrupt controller driver is added to provide mailbox interrupt support.

Jonathan Richardson (4):
  dt-bindings: Document Broadcom iProc mailbox controller driver
  mailbox: Add iProc mailbox controller driver
  ARM: dts: Remove Broadcom iProc mailbox controller node
  ARM: dts: Enable Broadcom iProc mailbox controller

 .../bindings/mailbox/brcm,iproc-mailbox.txt        |  18 ++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   8 +-
 drivers/mailbox/Kconfig                            |  10 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/bcm-iproc-mailbox.c                | 199 +++++++++++++++++++++
 include/linux/mailbox/bcm_iproc_mailbox.h          |  32 ++++
 6 files changed, 262 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt
 create mode 100644 drivers/mailbox/bcm-iproc-mailbox.c
 create mode 100644 include/linux/mailbox/bcm_iproc_mailbox.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
