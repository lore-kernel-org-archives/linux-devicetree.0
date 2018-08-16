Return-Path: <SRS0=eJvs=K7=gmail.com=esben.haabendal@kernel.org>
Sender: Esben Haabendal <esbenhaabendal@gmail.com>
From: Esben Haabendal <esben.haabendal@gmail.com>
Subject: [PATCH v4 0/3] i2c: imx: Fix and enable DMA support for LS1021A
Date: Thu, 16 Aug 2018 10:43:11 +0200
Message-Id: <20180816084315.7857-1-esben.haabendal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc: Esben Haabendal <eha@deif.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

From: Esben Haabendal <eha@deif.com>

This patch series fixes two race conditions and minor issues with tracking
the stopped state when something goes wrong.

With that in place, DMA support works with NXP LS1021A, so it is enabled in
the last patch.

Changes in v4:

* Added condition checking by use of common use_dma variable in patch 1/3
* Added Acked-by for patches 1/3 and 2/3
* Rebased to v4.18

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
 drivers/i2c/busses/i2c-imx.c   | 23 +++++++++++------------
 2 files changed, 17 insertions(+), 12 deletions(-)

-- 
2.18.0
