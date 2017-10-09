From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 2/5] uio: dt-bindings: Add binding for "st,stm32f100"
Date: Tue, 10 Oct 2017 11:46:52 +1300
Message-ID: <20171009224655.6173-3-chris.packham@alliedtelesis.co.nz>
References: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The stm32f100 is a general purpose micro controller. Document a binding
that allows a user-space driver to be implemented for these devices.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v3:
- (replaces "uio: dt-bindings: document binding for uio-pdrv-genirq")
- split the bindings up into the devices I'm actually wanting to support. The
  first is a stm32f100 micro controller.

 Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
index 5a92b1f8825f..fb4c1b5059f2 100644
--- a/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
+++ b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
@@ -1,7 +1,8 @@
 *Generic UIO platform driver with interrupts
 
 Required properties:
-- compatible: Should be a value set with the of_id module parameter.
+- compatible: Should be a value set with the of_id module parameter or the
+  built in value "st,stm32f100".
 
 Optional properties:
 - interrupts: Should contain the interrupt to be associated with this device
-- 
2.14.2
