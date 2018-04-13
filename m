From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v2 0/2] gpio: dwapb: Add support for 1 interrupt per port A GPIO
Date: Fri, 13 Apr 2018 09:08:18 +0100
Message-ID: <1523606900-2332-1-git-send-email-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>
List-Id: devicetree@vger.kernel.org

All details about the change is in patch 0001. patch 0002 fixes up other users
of 'struct dwapb_port_property'.

One point to mention is that I have made it possible for users to have
unconncted interrupts by specifying holes in the list of interrupts. This is
done by supporting the interrupts-extended DT prop.
However, I have no use for this and had to hack some test case for this.
Perhaps the driver should support 1 interrupt or all GPIOa as interrupts?

Phil Edworthy (2):
  gpio: dwapb: Add support for 1 interrupt per port A GPIO
  mfd: intel_quark_i2c_gpio: Update Synopsys GPIO interrupts

 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |  9 ++++-
 drivers/gpio/gpio-dwapb.c                          | 43 +++++++++++++++++-----
 drivers/mfd/intel_quark_i2c_gpio.c                 |  3 +-
 include/linux/platform_data/gpio-dwapb.h           |  3 +-
 4 files changed, 45 insertions(+), 13 deletions(-)

-- 
2.7.4
