From: <srv_hongzhou.yang@mediatek.com>
Subject: [PATCH 0/4] Add Mediatek SoC Pinctrl/GPIO driver for MT8135.
Date: Fri, 19 Sep 2014 19:48:22 +0800
Message-ID: <1411127306-13677-1-git-send-email-srv_hongzhou.yang@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, =Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch is Mediatek SoC Pinctrl/GPIO driver for MT8135,
it is based on Joe.C' basic device tree support.
See http://lists.infradead.org/pipermail/linux-arm-kernel/2014-September/288582.html

This driver include common and MT8135 part, other Mediatek SoCs
will share the common part, and MT8135 part only support MT8135.
MT8135 has GPIO controller, it includes 203 pins.

Hongzhou Yang (3):
ARM: mediatek: Add Pinctrl/GPIO driver for mt8135.
ARM: dts: mt8135: Add pinctrl node for mt8135.
dt-bindings: Add pinctrl bindings for mt65xx/mt81xx.

Joe.C (1):
arm: mediatek: Add config option for mediatek SoCs.

.../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |   92 +
arch/arm/boot/dts/mt8135-pinfunc.h                 | 1304 +++++++++++
arch/arm/boot/dts/mt8135.dtsi                      |   11 +
arch/arm/mach-mediatek/Kconfig                     |   23 +-
drivers/pinctrl/Kconfig                            |    1 +
drivers/pinctrl/Makefile                           |    1 +
drivers/pinctrl/mediatek/Kconfig                   |   12 +
drivers/pinctrl/mediatek/Makefile                  |    5 +
drivers/pinctrl/mediatek/pinctrl-mt8135.c          |   82 +
drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  836 +++++++
drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |   95 +
drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h      | 2460 ++++++++++++++++++++
include/dt-bindings/pinctrl/mt65xx.h               |   27 +
13 files changed, 4946 insertions(+), 3 deletions(-)
create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
create mode 100644 arch/arm/boot/dts/mt8135-pinfunc.h
create mode 100644 drivers/pinctrl/mediatek/Kconfig
create mode 100644 drivers/pinctrl/mediatek/Makefile
create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8135.c
create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-common.c
create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-common.h
create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h
create mode 100644 include/dt-bindings/pinctrl/mt65xx.h

--
1.8.1.1.dirty
