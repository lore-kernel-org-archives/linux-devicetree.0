From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v1 0/1] PINCTRL: Mediatek pinctrl patch for mt8183
Date: Tue, 11 Dec 2018 16:01:22 +0800
Message-ID: <20181211080123.1397-1-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: srv_heupstream@mediatek.com, liguo.zhang@mediatek.com, eddie.huang@mediatek.com, hongkun.cao@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com, chuanjia.liu@mediatek.com, erin.lo@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series includes one patche:
1.Add drive for I2C related pins on MT8183.

Zhiyong Tao (1):
  pinctrl: add drive for I2C related pins on MT8183

 drivers/pinctrl/mediatek/pinctrl-mt8183.c        | 50 ++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 45 +++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 13 ++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 20 ++++++++++
 4 files changed, 128 insertions(+)

--
2.12.5
