From: Sean Cross <xobs@kosagi.com>
Subject: [PATCH v2 2/2] mfd: stmpe: Document DT binding for irq_over_gpio
Date: Fri, 12 Sep 2014 11:18:34 +0800
Message-ID: <1410491914-23378-3-git-send-email-xobs@kosagi.com>
References: <1410491914-23378-1-git-send-email-xobs@kosagi.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410491914-23378-1-git-send-email-xobs@kosagi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: bunnie@kosagi.com, Sean Cross <xobs@kosagi.com>
List-Id: devicetree@vger.kernel.org

STMPE now supports using a GPIO as an IRQ source.  Document the device
tree binding for this option.

Signed-off-by: Sean Cross <xobs@kosagi.com>
---
 Documentation/devicetree/bindings/mfd/stmpe.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/stmpe.txt b/Documentation/devicetree/bindings/mfd/stmpe.txt
index 56edb55..3fb68bf 100644
--- a/Documentation/devicetree/bindings/mfd/stmpe.txt
+++ b/Documentation/devicetree/bindings/mfd/stmpe.txt
@@ -13,6 +13,7 @@ Optional properties:
  - interrupt-parent             : Specifies which IRQ controller we're connected to
  - wakeup-source                : Marks the input device as wakable
  - st,autosleep-timeout         : Valid entries (ms); 4, 16, 32, 64, 128, 256, 512 and 1024
+ - irq-gpio                     : If present, which GPIO to use for event IRQ
 
 Example:
 
-- 
2.1.0
