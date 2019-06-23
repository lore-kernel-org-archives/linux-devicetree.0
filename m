From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v4 00/11] add thermal driver for h6
Date: Sun, 23 Jun 2019 12:41:55 -0400
Message-ID: <20190623164206.7467-1-tiny.windzz@gmail.com>
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
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
Cc: Yangtao Li <tiny.windzz@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset add support for H3 and H6 thermal sensor.

BTY, do a cleanup in thermal makfile.

Yangtao Li (11):
  thermal: sun8i: add thermal driver for h6
  dt-bindings: thermal: add binding document for h6 thermal controller
  thermal: fix indentation in makefile
  thermal: sun8i: get ths sensor number from device compatible
  thermal: sun8i: rework for sun8i_ths_get_temp()
  thermal: sun8i: get ths init func from device compatible
  thermal: sun8i: rework for ths irq handler func
  thermal: sun8i: support ahb clocks
  thermal: sun8i: rework for ths calibrate func
  dt-bindings: thermal: add binding document for h3 thermal controller
  thermal: sun8i: add thermal driver for h3

 .../bindings/thermal/sun8i-thermal.yaml       |  94 +++
 MAINTAINERS                                   |   7 +
 drivers/thermal/Kconfig                       |  14 +
 drivers/thermal/Makefile                      |   9 +-
 drivers/thermal/sun8i_thermal.c               | 534 ++++++++++++++++++
 5 files changed, 654 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
 create mode 100644 drivers/thermal/sun8i_thermal.c

---
v4:
-add h3 support
-fix yaml file
---
2.17.1
