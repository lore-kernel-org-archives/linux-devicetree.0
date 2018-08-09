Return-Path: <SRS0=sFwS=KY=gmail.com=esben.haabendal@kernel.org>
Sender: Esben Haabendal <esbenhaabendal@gmail.com>
From: Esben Haabendal <esben.haabendal@gmail.com>
Subject: [PATCH v3 0/3] i2c: imx: Fix and enable DMA support for LS1021A
Date: Thu,  9 Aug 2018 14:32:04 +0200
Message-Id: <20180809123207.9732-1-esben.haabendal@gmail.com>
To: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc: Esben Haabendal <eha@deif.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

From: Esben Haabendal <eha@deif.com>

This patch series fixes two race conditions and minor issues with tracking
the stopped state when something goes wrong.

With that in place, DMA support works with NXP LS1021A, so it is enabled in
the last patch.

Changes in v3:

* Rebased to v4.18-rc8, dropping patch 1/4 which have been merged
* Avoid unnecessary register write in patch 2/3
* Removed unneeded braces in patch 3/3

Changes in v2:

* Fixed speling mistake in commit message
* Rebased to v4.18-rc4

Esben Haabendal (3):
  i2c: imx: Fix race condition in dma read
  i2c: imx: Simplify stopped state tracking
  arm: dts: ls1021a: Enable I2C DMA support

 arch/arm/boot/dts/ls1021a.dtsi |  6 ++++++
 drivers/i2c/busses/i2c-imx.c   | 20 +++++++++-----------
 2 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.18.0
