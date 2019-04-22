From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH 0/1] AUXADC: Mediatek auxadc driver on MT8183
Date: Mon, 22 Apr 2019 19:54:15 +0800
Message-ID: <20190422115417.16751-1-zhiyong.tao@mediatek.com>
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

Zhiyong Tao (1):
  arm64: dts: mt8183: Add auxadc device node

 arch/arm64/boot/dts/mediatek/mt8183-evb.dts |  4 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 10 ++++++++++
 2 files changed, 14 insertions(+)

--
2.12.5
