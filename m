From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 3/5] uio: dt-bindings: Add binding for "marvell,88e2040"
Date: Tue, 10 Oct 2017 11:46:53 +1300
Message-ID: <20171009224655.6173-4-chris.packham@alliedtelesis.co.nz>
References: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The marvell,88e2040 is a N-BaseT Ethernet PHY which requires a userspace
driver. The only kernel presence is an interrupt handler which
uio_pdrv_genirq can provide.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v3:
- (replaces "uio: dt-bindings: document binding for uio-pdrv-genirq")
- split the bindings up into the devices I'm actually wanting to support. The
  second is a marvell N-BaseT Ethernet PHY

 Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
index fb4c1b5059f2..7b28bead4016 100644
--- a/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
+++ b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
@@ -1,8 +1,8 @@
 *Generic UIO platform driver with interrupts
 
 Required properties:
-- compatible: Should be a value set with the of_id module parameter or the
-  built in value "st,stm32f100".
+- compatible: Should be a value set with the of_id module parameter or one of
+  the built in values "st,stm32f100", "marvell,88e2040".
 
 Optional properties:
 - interrupts: Should contain the interrupt to be associated with this device
-- 
2.14.2
