From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v1 0/2] AUXADC: support efuse calibration on MT818
Date: Thu, 18 Jul 2019 16:01:17 +0800
Message-ID: <20190718080119.30707-1-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com, jg_poxu@mediatek.com, sj.huang@mediatek.com, yingjoe.chen@mediatek.com, sean.wang@mediatek.com, erin.lo@mediatek.com, eddie.huang@mediatek.com, matthias.bgg@gmail.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series includes two patches:
1.Add mt8183 auxadc efuse information in device tree.
1.Add mt8183 efuse calibration function in auxadc driver.

Zhiyong Tao (2):
  arm64: dts: mt8183: auxadc: add efuse information in device tree
  auxadc: mediatek: support efuse calibration in auxadc driver

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  5 +++
 drivers/iio/adc/mt6577_auxadc.c          | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

--
2.12.5
