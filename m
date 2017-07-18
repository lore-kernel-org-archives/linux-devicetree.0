From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/4] gpio: davinci: Add keystone-k2g support and few clean ups
Date: Tue, 18 Jul 2017 16:27:12 +0530
Message-ID: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, ssantosh@kernel.org
Cc: robh+dt@kernel.org, nsekhar@ti.com, s-anna@ti.com, fcooper@ti.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org

The patch series adds support for keystone-k2g soc GPIO.
Also does a couple of important return handling which were missed
earlier in the driver probe.

This is based on Suman's:

http://marc.info/?l=linux-arm-kernel&m=150034845427555&w=2
http://marc.info/?l=linux-arm-kernel&m=150034856627618&w=2

The driver patches should have no dependency but the device Tree
will need the above set.

Keerthy (4):
  gpio: davinci: Use devm_gpiochip_add_data in place of
    gpiochip_add_data
  gpio: davinci: Handle the return value of davinci_gpio_irq_setup
    function
  gpio: davinci: Add a separate compatible for keystone-k2g soc
  ARM: dts: keystone-k2g-evm: Add gpio nodes

 .../devicetree/bindings/gpio/gpio-davinci.txt      |  3 +-
 arch/arm/boot/dts/keystone-k2g.dtsi                | 42 ++++++++++++++++++++++
 drivers/gpio/gpio-davinci.c                        | 21 +++++++++--
 3 files changed, 62 insertions(+), 4 deletions(-)

-- 
1.9.1
