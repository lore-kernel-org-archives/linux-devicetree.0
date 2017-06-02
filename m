From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v9 0/5] i2c: aspeed: added driver for Aspeed I2C
Date: Fri,  2 Jun 2017 01:45:58 -0700
Message-ID: <20170602084603.30811-1-brendanhiggins@google.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org, benh@kernel.crashing.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Addressed comments from:
  - Ben in: http://www.spinics.net/lists/devicetree/msg179006.html

Changes since previous update:
  - Fairly minimal changes in master support patch, all else is the same

As before, tested on Aspeed 2500 evaluation board and a real platform with an
Aspeed 2520.
