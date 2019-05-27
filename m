From: Neal Liu <neal.liu@mediatek.com>
Subject: [PATCH v2 0/3] MediaTek Security random number generator support
Date: Mon, 27 May 2019 16:38:43 +0800
Message-ID: <1558946326-13630-1-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Neal Liu <neal.liu@mediatek.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, wsd_upstream@mediatek.com, Crystal Guo <Crystal.Guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

These patch series introduce a generic rng driver for Trustzone
based kernel driver which would like to communicate with ATF
SIP services.

Patch #1 initials SMC fid table for MediaTek SIP interfaces and
adds HWRNG related SMC call.

Patch #2..3 adds mtk-sec-rng kernel driver for Trustzone based SoCs.
For MediaTek SoCs on ARMv8 with TrustZone enabled, peripherals like
entropy sources is not accessible from normal world (linux) and
rather accessible from secure world (ATF/TEE) only. This driver aims
to provide a generic interface to ATF rng service.


changes since v2:
- rename mt67xx-rng to mtk-sec-rng since all MediaTek ARMv8 SoCs
can reuse this driver.
- refine coding style and unnecessary check.

Neal Liu (3):
  soc: mediatek: add SMC fid table for SIP interface
  dt-bindings: rng: update bindings for MediaTek ARMv8 SoCs
  hwrng: add mtk-sec-rng driver

 .../devicetree/bindings/rng/mtk-rng.txt       | 13 ++-
 drivers/char/hw_random/Kconfig                | 16 +++
 drivers/char/hw_random/Makefile               |  1 +
 drivers/char/hw_random/mtk-sec-rng.c          | 97 +++++++++++++++++++
 include/linux/soc/mediatek/mtk_sip_svc.h      | 51 ++++++++++
 5 files changed, 175 insertions(+), 3 deletions(-)
 create mode 100644 drivers/char/hw_random/mtk-sec-rng.c
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

-- 
2.18.0
