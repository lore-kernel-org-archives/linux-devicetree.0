From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/5] K2G: Add QSPI support
Date: Wed, 16 Aug 2017 10:20:48 +0530
Message-ID: <20170816045053.15492-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for Cadence QSPI IP present in TI's 66AK2G SoC.
The patches enhance the existing cadence-quadspi driver to support
loopback clock circuit, pm_runtime support and tweaks for 66AK2G SoC.


Changes in v2:
* Drop DT patches. Will be sent as separate series as requested by
 maintainer.
* Split binding docs into separate patches.
* Address comments by Rob Herring.

Vignesh R (5):
  mtd: spi-nor: cadence-quadspi: Add TI 66AK2G SoC specific compatible
  mtd: spi-nor: cadence-quadspi: add a delay in write sequence
  mtd: spi-nor: cadence-quadspi: Add new binding to enable loop-back
    circuit
  mtd: spi-nor: cadence-quadspi: Add support to enable loop-back clock
    circuit
  mtd: spi-nor: cadence-quadspi: Add runtime PM support

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  7 +++-
 drivers/mtd/spi-nor/cadence-quadspi.c              | 46 ++++++++++++++++++++--
 2 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
