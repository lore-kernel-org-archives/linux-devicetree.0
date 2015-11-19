From: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: [PATCH v2 0/3] Mediatek EFUSE Support
Date: Thu, 19 Nov 2015 18:46:51 +0800
Message-ID: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch adds EFUSE support driver which is used by other drivers
like thermal sensor and HDMI impedance.

There are some efuses these fuses store things like calibration data,
speed bins.. etc. Drivers like thermal sensor, HDMI impedance would
read out this data for configuring the driver.

Change in v2:
1. Rebase to 4.4-rc1
2. Modify the driver Makefile for more consistent with other drivers
3. Modify the compatible string to "mediatek,mt8173-efuse" and "mediatek,efuse"

Andrew-CT Chen (3):
  dt-bindings: add document of mediatek efuse driver
  nvmem: mediatek: Add Mediatek EFUSE driver
  dts: arm64: Add EFUSE device node

 .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 +++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  5 ++
 drivers/nvmem/Kconfig                              | 11 +++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/mtk-efuse.c                          | 89 ++++++++++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
 create mode 100644 drivers/nvmem/mtk-efuse.c

--
1.9.1
