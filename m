From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/6] ARM: DTS: da850: eDMA new bindings and MMC/SPI DMA support
Date: Fri, 4 Dec 2015 15:53:24 +0200
Message-ID: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Switch to use the new eDMA bindings and enable DMA for MMC0, SPI1.
Add node for MMC1.

Regards,
Peter
---
Peter Ujfalusi (6):
  ARM: DTS: da850: fix edma0 reg space
  ARM: DTS: da850: Use the new DT bindings for the eDMA3
  ARM: DTS: da850: Enable eDMA1
  ARM: DTS: da850: Enable DMA use for MMC0
  ARM: DTS: da850: Add node for mmc1
  ARM: DTS: da850: Enable DMA for SPI1

 arch/arm/boot/dts/da850-enbw-cmc.dts |  9 ++++++
 arch/arm/boot/dts/da850-evm.dts      |  9 ++++++
 arch/arm/boot/dts/da850.dtsi         | 59 ++++++++++++++++++++++++++++++++----
 3 files changed, 71 insertions(+), 6 deletions(-)

-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
