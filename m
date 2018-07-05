From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH v4 0/2] gpio: mediatek: driver for gpio chip in MT7621 SoC
Date: Thu,  5 Jul 2018 15:43:09 +0200
Message-ID: <1530798191-25471-1-git-send-email-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, neil@brown.name
List-Id: devicetree@vger.kernel.org

This patch series add support for gpio driver in mediatek MT7621
SoC. This driver has been in staging for a while and after some
cleanups cycles we consider to give it a new try to get mainlined.

Previous comments from Linus Walleij are here:

http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-June/121742.html

Comments from Rob Herring are here:

http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-June/121974.html

Changes in v4:
 - Fix gpio banks naming issues
 - Use custom xlate to be able to use only one node in DT.
 - Add Reviewed-by: NeilBrown <neil at brown.name> to the patches.

Changes in v3:
 - Fix added Makefile entry which was wrong.

Changes in v2 are the ones pointed out in previous mails:

 - use bgpio_init
 - avoid custom irq_domain using IRQF_SHARED and
   gpiochip_set_chained_irqchip from GPIOLIB_IRQCHIP
 - use only one node in the device tree making it simple
 - Implement high and low level irqs
 - avoid include gpio.h
 - use builtin_platform_driver
 - add COMPILE_TEST
 - cleanups after this changes


Hope this helps and thanks in advance.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (2):
  gpio: mediatek: add driver for MT7621
  dt-bindings: document gpio-mt7621 bindings

 .../bindings/gpio/mediatek,mt7621-gpio.txt         |  35 +++
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-mt7621.c                         | 331 +++++++++++++++++++++
 4 files changed, 375 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
 create mode 100644 drivers/gpio/gpio-mt7621.c

-- 
2.7.4
