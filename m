From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v2 0/2] AUXADC: Mediatek auxadc driver on MT8183
Date: Wed, 24 Apr 2019 09:11:10 +0800
Message-ID: <20190424011112.14283-1-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com, yingjoe.chen@mediatek.com, sean.wang@mediatek.com, erin.lo@mediatek.com, eddie.huang@mediatek.com, matthias.bgg@gmail.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series includes two patches:
1.Add mt8183 auxadc compatible node in binding document.
1.Add mt8183 auxadc device node.

Changes in patch v2:
1)change auxadc compatible node in binding document for mt8183.

Zhiyong Tao (2):
  dt-bindings: adc: mt8183: add binding document
  arm64: dts: mt8183: Add auxadc device node

 Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt |  1 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts                 |  4 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                    | 10 ++++++++++
 3 files changed, 15 insertions(+)

--
2.12.5
