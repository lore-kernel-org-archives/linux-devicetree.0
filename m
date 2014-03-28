From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: [RFC PATCH v2 00/10] ARM: at91: move aic driver to drivers/irqchips
Date: Fri, 28 Mar 2014 18:58:58 +0100
Message-ID: <1396029548-10928-1-git-send-email-b.brezillon.dev@gmail.com>
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
To: Rob Landley <rob@landley.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This series is a proposal to move AIC driver to the irqchip directory.

It also changes the implementation design of the interrupt controller in
several ways:
 - make use of the generic chip framework whenever possible
 - add support for irq muxing definition to prevent spurious interrupts
   during system startup (see https://lkml.org/lkml/2013/3/8/175)
 - only support dt enabled boards


Best Regards,

Boris

Changes since v1:
 - rework the irq-mux bindings

Boris BREZILLON (10):
  genirq: generic chip: export irq_map_generic_chip function
  irqchip: atmel-aic: add new atmel AIC driver
  ARM: at91: introduce OLD_IRQ_AT91 Kconfig option
  ARM: at91: enclose at91_aic_xx calls in
    IS_ENABLED(CONFIG_OLD_IRQ_AT91) blocks
  ARM: at91: make use of the new AIC driver for dt enabled boards
  irqchip: atmel-aic: move binding doc to interrupt-controller
    directory
  irqchip: atmel-aic: document new dt properties and children nodes
  ARM: at91: remove old irq material
  ARM: at91/dt: add new AIC irq mux definitions for sam9x5 SoCs
  ARM: at91/dt: add new AIC irq mux definitions for sama5 SoCs

 .../devicetree/bindings/arm/atmel-aic.txt          |   42 -
 .../bindings/interrupt-controller/atmel,aic.txt    |   82 ++
 arch/arm/boot/dts/at91sam9x5.dtsi                  |  108 +++
 arch/arm/boot/dts/sama5d3.dtsi                     |   37 +
 arch/arm/boot/dts/sama5d3_tcb1.dtsi                |   20 +
 arch/arm/mach-at91/Kconfig                         |   11 +
 arch/arm/mach-at91/Kconfig.non_dt                  |    7 +
 arch/arm/mach-at91/Makefile                        |    3 +-
 arch/arm/mach-at91/board-dt-rm9200.c               |   13 -
 arch/arm/mach-at91/board-dt-sam9.c                 |   14 -
 arch/arm/mach-at91/board-dt-sama5.c                |   13 -
 arch/arm/mach-at91/irq.c                           |  270 +------
 arch/arm/mach-at91/pm.c                            |   32 +-
 arch/arm/mach-at91/setup.c                         |    3 +-
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-atmel-aic.c                    |  851 ++++++++++++++++++++
 include/linux/irq.h                                |    2 +
 kernel/irq/generic-chip.c                          |    5 +-
 18 files changed, 1152 insertions(+), 362 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/atmel-aic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
 create mode 100644 drivers/irqchip/irq-atmel-aic.c

-- 
1.7.9.5
