From: Qianggui Song <qianggui.song@amlogic.com>
Subject: [PATCH 0/3] pinctrl: meson-a1: add pinctrl driver
Date: Tue, 17 Sep 2019 14:07:19 +0800
Message-ID: <1568700442-18540-1-git-send-email-qianggui.song@amlogic.com>
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
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Qianggui Song <qianggui.song@amlogic.com>, Mark Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

This patchset adds Pin controller driver support for Meson-A1 Soc
which shares the same register layout of pinmux with previous
Meson-G12A, however there is difference for gpio and pin config
registers in A1.

This patchset is based on A1 DTBv4[1].

[1] https://lore.kernel.org/linux-amlogic/1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com

Qianggui Song (3):
  pinctrl: add compatible for Amlogic Meson A1 pin controller
  pinctrl: meson-a1: add pinctrl driver for Meson A1 Soc
  arm64: dts: meson: a1: add pinctrl controller support

 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   1 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  18 +
 drivers/pinctrl/meson/Kconfig                      |   6 +
 drivers/pinctrl/meson/Makefile                     |   1 +
 drivers/pinctrl/meson/pinctrl-meson-a1.c           | 942 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |   8 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |   9 +
 include/dt-bindings/gpio/meson-a1-gpio.h           |  73 ++
 8 files changed, 1056 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-a1.c
 create mode 100644 include/dt-bindings/gpio/meson-a1-gpio.h

-- 
1.9.1
