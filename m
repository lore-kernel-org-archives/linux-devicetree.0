From: Sean Cross <xobs@kosagi.com>
Subject: [PATCH v2 0/2] Add irq_over_gpio DT support to STMPE
Date: Fri, 12 Sep 2014 11:18:32 +0800
Message-ID: <1410491914-23378-1-git-send-email-xobs@kosagi.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: bunnie@kosagi.com, Sean Cross <xobs@kosagi.com>
List-Id: devicetree@vger.kernel.org

These patches add support for using a GPIO as an IRQ source for the
STMPE module when configured using device tree.

Changes since v1:
    - Split actual patch and Documentation into two parts

Sean Cross (2):
  mfd: stmpe: support gpio over irq under device tree
  mfd: stmpe: Document DT binding for irq_over_gpio

 Documentation/devicetree/bindings/mfd/stmpe.txt | 1 +
 drivers/mfd/stmpe.c                             | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.1.0
