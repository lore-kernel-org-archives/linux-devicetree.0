From: Semen Protsenko <semen.protsenko@globallogic.com>
Subject: [PATCH 0/4] gpio: max732x: Update MAX732X driver to use modern kernel API
Date: Tue, 13 Jan 2015 15:41:41 +0200
Message-ID: <1421156505-16600-1-git-send-email-semen.protsenko@globallogic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marc Zyngier <maz@misterjones.org>, Grygorii Strashko <grygorii.strashko@globallogic.com>, Illia Smyrnov <illia.smyrnov@globallogic.com>
List-Id: devicetree@vger.kernel.org

This patch series updates driver for MAX732X I/O expander to use modern kernel
API (like Device Tree). Basically, I was needed this driver to work with
kernel 3.8 on our ARM-based board, but it was in obsolete state (supporting
only platform data from board-file). First patch makes driver work with
data taken from device tree file (old platform data support also kept in place
for compatibility reasons).

After adding device tree support it came to me that current approach to
implement interrupt controller is to use irq-domain framework. Hence the second
patch (only affects the code for generating interrupts on level change on
expander's GPIO input lines).

Once driver became fully functional (using data from device tree), another
issue showed up: lockdep validator revealed possible dead-lock in driver code.
Third patch fixes this problem.

Finally, fourth patch adds binding documentation showing how to describe MAX732X
driver in device tree file.

Semen Protsenko (4):
  gpio: max732x: Add device tree support
  gpio: max732x: Rewrite IRQ code to use irq_domain API
  gpio: max732x: Fix possible deadlock
  gpio: max732x: Add DT binding documentation

 .../devicetree/bindings/gpio/gpio-max732x.txt      |   59 +++++++
 drivers/gpio/Kconfig                               |    1 +
 drivers/gpio/gpio-max732x.c                        |  174 ++++++++++++++------
 3 files changed, 187 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt

-- 
1.7.9.5

