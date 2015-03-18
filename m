From: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v8 0/3] dmaengine: APM X-Gene SoC DMA engine driver support
Date: Wed, 18 Mar 2015 19:17:33 +0530
Message-ID: <1426686456-15536-1-git-send-email-rsahu@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set implements the APM X-Gene SoC DMA driver support to offload
the DMA operations such as memory copy(memcpy), scatter gather memory copy,
raid5 xor and raid6 p+q.

v8 changes:
	1. Fixed macro namespace issues.
	2. Fixed tx status check issues.
v7 changes:
	1. Added raid5 xor offload support.
	2. Added raid6 p+q offload support.
v6 changes:
	1. Maintained sw queue for pending, running, and completed
	   requests. Used link list as queue.
	2. Fixed issue_pending and tx_submit routines.
	3. Fixed prep_dma routines.
	4. Fixed free_irqs.

v5 changes:
	1. Minor changes in coding style.
	2. Added DMA_CTRL_ACK flag initialization
v4 changes:
	1. Fixed dma-ranges property on DTS.

Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
Rameshwar Prasad Sahu (3):
  dmaengine: Add support for APM X-Gene SoC DMA engine driver
  arm64: dts: Add APM X-Gene SoC DMA device and DMA clock DTS nodes
  Documentation: dma: Add documentation for the APM X-Gene SoC DMA
    device DTS binding

 .../devicetree/bindings/dma/apm-xgene-dma.txt      |   47 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   26 +
 drivers/dma/Kconfig                                |    8 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/xgene-dma.c                            | 2090 ++++++++++++++++++++
 5 files changed, 2172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/apm-xgene-dma.txt
 create mode 100755 drivers/dma/xgene-dma.c

--
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
