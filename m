From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH v5 0/3] ARM: bcm281xx: GPIO driver
Date: Wed, 28 Aug 2013 15:16:10 -0700
Message-ID: <1377728173-30711-1-git-send-email-markus.mayer@linaro.org>
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
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, Markus Mayer <markus.mayer@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This patch series adds the GPIO driver, and its device tree bindings,
for the Broadcom bcm281xx family of chips.

Changes since v4:

- Added "brcm,bcm11351-gpio" to compatible value in device tree binding
- Added references to other device tree documentation
- Explicitly mention 1:1 mapping between GPIO banks and IRQs.
- Select driver in Kconfig, but don't depend on ARCH_BCM & don't default y
- Changed hex numbers to lower case
- Removed irq_base/irq_alloc_descs()/irq_free_descs()
- Added kona_gpio to struct bcm_kona_gpio_bank in lieu of reg_base, so
  interrupt handler can access irq_domain
- Removed bcm_kona_count_irq_resources() and switched to using
  of_irq_count()
- Switched interrupt handler to use irq_find_mapping() instead of
  gpio_to_irq()
- Print no error message if devm_kzalloc() fails
- Don't check return value of platform_get_resource()
- Check for maximum bank number
- Use devm_ioremap_resource() instead of devm_request_and_ioremap()
- Use bit operations rather than spelling out bit shifts
- Added a loop to interrupt handler, so it'll handle IRQs that happened
  during IRQ processing
- Some formatting clean-up

Markus Mayer (3):
  ARM: bcm281xx: Add GPIO driver
  ARM: bcm281xx: Enable GPIO driver
  ARM: bcm281xx: Add device node for the GPIO controller

 .../devicetree/bindings/gpio/gpio-bcm-kona.txt     |   52 ++
 arch/arm/boot/dts/bcm11351.dtsi                    |   16 +
 arch/arm/mach-bcm/Kconfig                          |    2 +-
 drivers/gpio/Kconfig                               |    5 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-bcm-kona.c                       |  631 ++++++++++++++++++++
 6 files changed, 706 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-bcm-kona.txt
 create mode 100644 drivers/gpio/gpio-bcm-kona.c

-- 
1.7.9.5
