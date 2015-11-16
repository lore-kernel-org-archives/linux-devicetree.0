From: rsahu-qTEPVZfXA3Y@public.gmane.org
Subject: [PATCH v2 0/3] dmaengine: Add supports for APM X-Gene SoC CRC32C accerlerator driver
Date: Mon, 16 Nov 2015 14:38:34 +0530
Message-ID: <1447664917-12574-1-git-send-email-rsahu@apm.com>
References: <rsahu@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <rsahu-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>

This patch implements support for APM X-Gene SoC CRC32C h/w accelerator driver
and adds CRC32C computations support in dmaengine framework. APM X-Gene SoC has
DMA engine capable of performing CRC32C computations.

v2 changes:
	1. Added helper function in dmaengine framework
	2. Documented CRC32C support in Documentations/dmaengine/provider.txt
	3. Fixed algo name
	4. Fixed coding style issues

Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
---

Rameshwar Prasad Sahu (3):
  dmaengine: Add support for new feature CRC32C computations
  dmaengine: xgene-dma: Add support for CRC32C computations via DMA
    engine
  Crypto: Add support for APM X-Gene SoC CRC32C h/w accelerator driver

 Documentation/dmaengine/provider.txt |    3 +
 drivers/crypto/Kconfig               |    8 +
 drivers/crypto/Makefile              |    1 +
 drivers/crypto/xgene-crc32c.c        |  234 +++++++++++++++++++++++++
 drivers/dma/dmaengine.c              |    2 +
 drivers/dma/xgene-dma.c              |  314 ++++++++++++++++++++++++++++++++--
 include/linux/dmaengine.h            |   13 ++
 7 files changed, 560 insertions(+), 15 deletions(-)
 create mode 100755 drivers/crypto/xgene-crc32c.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
