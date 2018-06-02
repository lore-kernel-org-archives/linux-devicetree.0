From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH 0/2] gpio: mediatek: driver for gpio chip in MT7621 SoC
Date: Sat,  2 Jun 2018 09:30:08 +0200
Message-ID: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
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
cleanups cycles we consider to git it a try to get mainlined.

The functionality is presented as a single irq-chip but 3 separate
gpio-chips, as this seemed simplest. Is this acceptable, or does it
need to be changed? We'd like to have review comments and feedback 
specially for this.

Hope this helps and thanks in advance.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (2):
  gpio: mediatek: add driver for MT7621
  dt-bindings: document gpio-mt7621 bindings

 .../bindings/gpio/mediatek,mt7621-gpio.txt         |  68 ++++
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-mt7621.c                         | 370 +++++++++++++++++++++
 4 files changed, 446 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
 create mode 100644 drivers/gpio/gpio-mt7621.c

-- 
2.7.4
