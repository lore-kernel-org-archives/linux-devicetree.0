From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/3] meson-gpio-irqc: Add support for the Meson-G12A SoC
Date: Sat,  8 Jun 2019 21:04:08 +0200
Message-ID: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
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
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds GPIO interrupt controller support for Meson-G12A SoCs.
Although the total number of pins is the same as the Meson-AXG SoC, the
GPIO banks and IRQ numbers are different. Add a new compatible string
to avoid confusion when using it.

I am re-sending this update because v2 looked good in my opinion (Xingyu
Chen did good work here) but it never made it into mainline.


Changes since v1 at [1]:
- share the device data with Meson-AXG

Changes since v2 at [2]:
- dropped "Change-Id" from patch #2
- added .dts patch #3 - this should go through Kevin's linux-amlogic
  tree. if required I can re-send it in a separate series


[1] https://lore.kernel.org/lkml/20181203061324.36248-1-xingyu.chen@amlogic.com
[2] https://lore.kernel.org/patchwork/cover/1021232/


Martin Blumenstingl (1):
  arm64: dts: meson: g12a: add the GPIO interrupt controller

Xingyu Chen (2):
  dt-bindings: interrupt-controller: New binding for Meson-G12A SoC
  irqchip/meson-gpio: Add support for Meson-G12A SoC

 .../interrupt-controller/amlogic,meson-gpio-intc.txt     | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi              | 9 +++++++++
 drivers/irqchip/irq-meson-gpio.c                         | 1 +
 3 files changed, 11 insertions(+)

-- 
2.21.0
