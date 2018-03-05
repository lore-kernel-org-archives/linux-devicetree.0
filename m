Return-Path: <SRS0=ZXHR=F3=mleia.com=vz@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v2 0/2] hwrng: mxc-rnga - add driver support on boards with device tree
Date: Tue,  6 Mar 2018 00:20:58 +0200
Message-Id: <20180305222100.29351-1-vz@mleia.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The series is a trivial change to extend Freescale i.MX31 RNGA
driver to work on boards with device description taken from device
tree blob. The change was tested on a legacy LogicPD MX31Lite board.

Vladimir Zapolskiy (2):
  dt-bindings: rng: Document Freescale i.MX21 and i.MX31 RNGA compatibles
  hwrng: mxc-rnga - add driver support on boards with device tree

Changes from v1 to v2:
* a kernel for iMX boards is always built with multiplatform support,
  thus CONFIG_OF guards were removed, thanks to Kim Phillips for review,
* added i.MX21 RNGA compatible, i.MX31 RNGA is backward compatible to it,
* though the list of documented compatibles is extended, I dare to add
  Rob's Reviewed-by tag casted for v1.

 .../bindings/rng/{imx-rngc.txt => imx-rng.txt}     | 11 +++++------
 drivers/char/hw_random/mxc-rnga.c                  | 23 +++++++++++++---------
 2 files changed, 19 insertions(+), 15 deletions(-)
 rename Documentation/devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt} (54%)

-- 
2.10.2
