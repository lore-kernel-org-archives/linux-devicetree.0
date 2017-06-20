From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v11 0/4] i2c: aspeed: added driver for Aspeed I2C
Date: Tue, 20 Jun 2017 14:15:12 -0700
Message-ID: <20170620211516.13095-1-brendanhiggins@google.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org, joel@jms.id.au, martin.petersen@oracle.com, benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Addressed comments from:
  - Wolfram in: http://www.spinics.net/lists/devicetree/msg182142.html
    and http://www.spinics.net/lists/devicetree/msg182144.html

Changes since previous update:
  - MAINTAINERS: Added MAINTAINERS entry for Aspeed I2C driver and friends
  - I2C driver: Added support for COMPILE_TEST
  - I2C driver: Fixed i2c fault codes in interrupt handler
  - I2C driver: Use i2c_{get|set}_adapdata instead of adapter->algo_data
  - I2C driver: Fixed some other stylistic issues

As the Aspeed I2C interrupt controller changes were already accepted by the
irqchip maintainers, this patchset no longer contains them.

As before, tested on Aspeed 2500 evaluation board and a real platform with an
Aspeed 2520.
