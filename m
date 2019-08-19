From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v4 0/2] add imx8mq nitrogen support - changes since v3
Date: Mon, 19 Aug 2019 19:26:04 +0200
Message-ID: <20190819172606.6410-1-dafna.hirschfeld@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dafna.hirschfeld@collabora.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

change log:
patch 1: no changes
patch 2:
- gpio-key,wakeup -> source-wakeup
- newline between property list and child nodes.
- settting pinctrl nodes names to: "pinctrl_xxx: xxxgrp {"

Gary Bisson (2):
  dt-bindings: arm: imx: add imx8mq nitrogen support
  arm64: dts: imx: Add i.mx8mq nitrogen8m basic dts support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mq-nitrogen.dts    | 405 ++++++++++++++++++
 3 files changed, 407 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts

-- 
2.20.1
