From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/2] Broadcom FlexRM ring manager support
Date: Thu,  5 Jan 2017 16:37:53 +0530
Message-ID: <1483614475-3442-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod KUMAR <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Broadcom FlexRM ring manager provides producer-consumer style
ring interface for offload engines on Broadcom iProc SoCs. We can
have one or more instances of Broadcom FlexRM ring manager in a SoC.

This patchset adds a mailbox driver for Broadcom FlexRM ring manager
which can be used by offload engine drivers as mailbox clients.

The Broadcom FlexRM mailbox driver is feature complete for RAID and
Crypto offload engines. We will have incremental patches in-future
for ring-level statistics using debugfs and minor optimizations.

This patchset is based on Linux-4.10-rc2 and it is also available
at flexrm-v4 branch of https://github.com/Broadcom/arm64-linux.git

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
