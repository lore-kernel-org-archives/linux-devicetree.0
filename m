From: Biao Huang <biao.huang@mediatek.com>
Subject: [v2,PATCH 0/1] arm64: dts: mt2712: add ethernet device node
Date: Wed, 9 Oct 2019 15:10:21 +0800
Message-ID: <20191009071022.4972-1-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com
List-Id: devicetree@vger.kernel.org

v2:
add properties to default/sleep pinctrl-state node.

Biao Huang (1):
  arm64: dts: mt2712: add ethernet device node

 arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 74 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 65 ++++++++++++++++++
 2 files changed, 139 insertions(+)

--
2.18.0
