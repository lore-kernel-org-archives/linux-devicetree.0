From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/5] Add XOR engine support to Armada 3700 SoC (ARM64)
Date: Wed, 30 Mar 2016 19:35:15 +0200
Message-ID: <1459359320-12638-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This series adds the support of the Marvell XOR engine to the Armada
3700 SoC. As this SoC is an ARM64 one, then the code has been fixed to
support the 64 bits platform.

The initialization for the Armada 3700 is different from the other
SoCs, so in order to support it, a new way of handling the different
family have been added.

Once the dmaengine part will be approved, I will apply the dts part
in the mvebu/dt64 tree.

Thanks,

Gregory

Gregory CLEMENT (3):
  dmaengine: mv_xor: make the code 64 bits compliant
  dmaengine: mv_xor: use SoC type instead of directly the operation mode
  dmaengine: mv_xor: Allow selecting mv_xor for mvebu only compatible
    SoC

Marcin Wojtas (2):
  dmaengine: mv_xor: add support for Armada 3700 SoC
  arm64: dts: marvell: add XOR node for Armada 3700 SoC

 Documentation/devicetree/bindings/dma/mv-xor.txt |  3 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi     | 13 ++++
 drivers/dma/Kconfig                              |  2 +-
 drivers/dma/mv_xor.c                             | 98 +++++++++++++++++++-----
 drivers/dma/mv_xor.h                             |  1 +
 5 files changed, 95 insertions(+), 22 deletions(-)

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
