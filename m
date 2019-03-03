From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v2 0/1] PINCTRL: Mediatek pinctrl patch for mt8183
Date: Sun, 3 Mar 2019 09:53:40 +0800
Message-ID: <20190303015341.986-1-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com, sean.wang@kernel.org
Cc: srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com, liguo.zhang@mediatek.com, eddie.huang@mediatek.com, hongkun.cao@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com, chuanjia.liu@mediatek.com, erin.lo@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series includes one patche:
1.Add drive for I2C related pins on MT8183.

Changes in patch v2:
1)add the details strength specification description of the I2C pin.
2)change "mt8183_pin_drv_en_dis_range" to "mt8183_pin_e1e0en_range".
3)change "mt8183_pin_drv_e0_range" to "mt8183_pin_e0_range".
4)change "mt8183_pin_drv_e1_range" to "mt8183_pin_drv_e1_range".

Zhiyong Tao (1):
  pinctrl: add drive for I2C related pins on MT8183

 drivers/pinctrl/mediatek/pinctrl-mt8183.c        | 50 ++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 45 +++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 13 ++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 20 ++++++++++
 4 files changed, 128 insertions(+)

--
2.12.5
