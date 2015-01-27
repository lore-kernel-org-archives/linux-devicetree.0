From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Add Mediatek SoC Pinctrl/GPIO/EINT driver for MT8173.
Date: Tue, 27 Jan 2015 15:13:53 +0800
Message-ID: <1422342836-27689-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, eddie.huang@mediatek.com, linux-kernel@vger.kernel.org, alan.cheng@mediatek.com, maoguang.meng@mediatek.com, Ashwin Chaugule <ashwin.chaugule@linaro.org>, toby.liu@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, dandan.he@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is the first version of add Mediatek SoC Pinctrl/GPIO/EINT driver for MT8173.
It is base on MT8135 pinctrl driver, MT8173 has 135 pins.

Hongzhou Yang (3):
  arm64: mediatek: Add config option for mt8173.
  arm64: mediatek: Add Pinctrl/GPIO/EINT driver for mt8173.
  arm64: dts: mt8173: Add pinctrl/GPIO/EINT node for mt8173.

 arch/arm64/Kconfig                            |    6 +
 arch/arm64/boot/dts/mediatek/mt8173-pinfunc.h |  682 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   19 +
 drivers/pinctrl/mediatek/Kconfig              |    4 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  452 +++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   14 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |    7 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h | 1226 +++++++++++++++++++++++++
 9 files changed, 2411 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8173.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h

-- 
1.8.1.1.dirty
