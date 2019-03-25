From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v3 RESEND 0/4] PINCTRL: Mediatek pinctrl patch on mt8183
Date: Mon, 25 Mar 2019 20:41:33 +0800
Message-ID: <20190325124137.6117-1-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com, sean.wang@kernel.org
Cc: srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com, hui.liu@mediatek.com, eddie.huang@mediatek.com, chuanjia.liu@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com, erin.lo@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series includes 4 patches:
1.add pintcrl binding document on mt8183.
2.add pintcrl file on mt8183.
3.add pintcrl device node on mt8183.
4.add drive for I2C related pins on MT8183.

Changes in patch v3:
1)add the patch "dt-bindings: pinctrl: mt8183: add binding document".
2)add the patch "arm64: dts: mt8183: add pintcrl file".
3)add the patch "arm64: dts: mt8183: add pintcrl device node".
4)add more datail information for the specific driving setup in commit message.
5)use "mediatek,drive-strength-adv" instead of
  "mediatek,drive-enable-adv" and "mediatek,drive-enable-disable".
6)change "PINCTRL_PIN_REG_DRV_EN_DIS" to "PINCTRL_PIN_REG_DRV_EN".
7)change the function "mtk_pinconf_adv_drive_set".

Changes in patch v2:
1)add the details strength specification of the I2c pins.
2)change "mt8183_pin_drv_en_dis_range" to "mt8183_pin_e1e0en_range".
3)change "mt8183_pin_drv_e0_range" to "mt8183_pin_e0_range".
4)change "mt8183_pin_drv_e1_range" to "mt8183_pin_e1_range".

Zhiyong Tao (4):
  dt-bindings: pinctrl: mt8183: add binding document
  arm64: dts: mt8183: add pintcrl file
  arm64: dts: mt8183: add pintcrl device node
  pinctrl: add drive for I2C related pins on MT8183

 .../devicetree/bindings/pinctrl/pinctrl-mt8183.txt |  132 +++
 arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h      | 1120 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   27 +-
 drivers/pinctrl/mediatek/pinctrl-mt8183.c          |   50 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   47 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |   11 +
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   12 +
 7 files changed, 1398 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h

--
2.12.5
