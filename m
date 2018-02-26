Return-Path: <SRS0=8w0u=FU=mleia.com=vz@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 0/2] hwrng: mxc-rnga - add driver support on boards with device tree
Date: Mon, 26 Feb 2018 20:38:47 +0200
Message-Id: <20180226183849.11562-1-vz@mleia.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The series is a trivial change to extend Freescale i.MX31 RNGA
driver to work on boards with device description taken from device
tree blob. The change was tested on a legacy LogicPD MX31Lite board.

Vladimir Zapolskiy (2):
  dt-bindings: rng: Document Freescale i.MX31 RNGA compatible
  hwrng: mxc-rnga - add driver support on boards with device tree

 .../bindings/rng/{imx-rngc.txt => imx-rng.txt}     | 10 ++++-----
 drivers/char/hw_random/mxc-rnga.c                  | 24 ++++++++++++++--------
 2 files changed, 19 insertions(+), 15 deletions(-)
 rename Documentation/devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt} (59%)

-- 
2.10.2
