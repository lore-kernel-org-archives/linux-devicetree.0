From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 0/3] irqchip: meson-gpio: add support for Meson-AXG SoCs
Date: Sun, 8 Apr 2018 14:56:57 +0000
Message-ID: <20180408145700.23520-1-yixun.lan@amlogic.com>
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
To: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

  This series try to add GPIO interrupt controller support for Meson-AXG SoCs.
  The first patch is a trivial typo fix, I can fold the first two patches
together if necessary.

Yixun Lan (3):
  dt-bindings: interrupt-controller: fix the double quotes
  dt-bindings: interrupt-controller: New binding for Meson-AXG SoC
  irqchip/meson-gpio: add support for Meson-AXG SoCs

 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt | 11 ++++++-----
 drivers/irqchip/irq-meson-gpio.c                              |  5 +++++
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.16.2
