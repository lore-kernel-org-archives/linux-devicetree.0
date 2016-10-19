From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 00/10] Revamp Semtech SX150x driver
Date: Wed, 19 Oct 2016 07:03:56 -0700
Message-ID: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello everyone,

This is the second version of the patchset originally submitted here:

http://www.spinics.net/lists/devicetree/msg146176.html

The only change since v1 is that, per Rob Herring's recommendation, all
of the changes to bindings documentation were coalesced into a single patch.

Thank you,
Andrey Smirnov

Andrey Smirnov (10):
  gpio-sx150x: Remove 'gpio_base' from pdata
  gpio-sx150x: Remove 'irq_summary' parameter
  gpio-sx150x: Remove 'irq_base' parameter
  gpio-sx150x: Replace 'io_polarity' with DT binding
  gpio-sx150x: Replace "io_pull*_ena" with DT bindings
  gpio-sx150x: Replace 'reset_during_probe" with DT binding
  gpio-sx150x: Replace 'oscio_is_gpio' with DT binding
  gpio-sx150x: Remove struct sx150x_platform_data
  gpio-sx150x: Pass device type in DT match table
  bindings: gpio-sx150x: Document new bindings

 .../devicetree/bindings/gpio/gpio-sx150x.txt       |  29 ++++
 drivers/gpio/gpio-sx150x.c                         | 184 +++++++++------------
 2 files changed, 105 insertions(+), 108 deletions(-)

-- 
2.5.5
