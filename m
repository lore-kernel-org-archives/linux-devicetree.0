From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH v7 0/3] gpio: bcm281xx: GPIO driver
Date: Fri, 30 Aug 2013 10:15:11 -0700
Message-ID: <1377882914-30152-1-git-send-email-markus.mayer@linaro.org>
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
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, Markus Mayer <markus.mayer@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This patch series adds the GPIO driver, and its device tree bindings,
for the Broadcom bcm281xx family of mobile SoCs.

Changes since v6:
- Broke out arch/arm/mach-bcm/Kconfig into its own patch
- Changed commit title messages accordingly

Markus Mayer (3):
  gpio: bcm281xx: Add GPIO driver
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
