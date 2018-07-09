Return-Path: <SRS0=Ja5d=JZ=gmail.com=esben.haabendal@kernel.org>
Sender: Esben Haabendal <esbenhaabendal@gmail.com>
From: Esben Haabendal <esben.haabendal@gmail.com>
Subject: [PATCH v2 0/4] i2c: imx: Fix and enable DMA support for LS1021A
Date: Mon,  9 Jul 2018 11:43:00 +0200
Message-Id: <20180709094304.8814-1-esben.haabendal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yuan Yao <yao.yuan@freescale.com>, Esben Haabendal <eha@deif.com>
List-ID: <devicetree@vger.kernel.org>

From: Esben Haabendal <eha@deif.com>

This patch series fixes two race conditions and minor issues with tracking
the stopped state when something goes wrong.

With that in place, DMA support works with NXP LS1021A, so it is enabled in
the last patch.

Changes in v2:

* Fixed speling mistake in commit message
* Rebased to v4.18-rc4

Esben Haabendal (4):
  i2c: imx: Fix reinit_completion() use
  i2c: imx: Fix race condition in dma read
  i2c: imx: Simplify stopped state tracking
  arm: dts: ls1021a: Enable I2C DMA support

 arch/arm/boot/dts/ls1021a.dtsi |  6 ++++++
 drivers/i2c/busses/i2c-imx.c   | 23 ++++++++++++-----------
 2 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.18.0
