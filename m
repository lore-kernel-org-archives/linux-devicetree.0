From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH v3 3/5] dt-bindings: i3c: Make 'assigned-address' valid if static address == 0
Date: Thu,  5 Sep 2019 12:00:36 +0200
Message-ID: <35e317ef6c9c0c729f713e57a55a2cd8bd55899b.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
Cc: bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pgaj@cadence.com, Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>
List-Id: devicetree@vger.kernel.org

The I3C devices without a static address can require a specific dynamic
address for priority reasons.

Let's update the binding document to make the 'assigned-address' property
valid if static address == 0 and add an example with this use case.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Change in v3:
  - Add Rob rb-tag

Change in v2:
  - Fix typo in commit message

 Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index ab729a0..c851e75 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -98,9 +98,7 @@ Required properties
 
 Optional properties
 -------------------
-- assigned-address: dynamic address to be assigned to this device. This
-		    property is only valid if the I3C device has a static
-		    address (first cell of the reg property != 0).
+- assigned-address: dynamic address to be assigned to this device.
 
 
 Example:
@@ -129,6 +127,15 @@ Example:
 
 		/*
 		 * I3C device without a static I2C address but requiring
+		 * specific dynamic address.
+		 */
+		sensor@0,39200154004 {
+			reg = <0x0 0x6072 0x303904d2>;
+			assigned-address = <0xb>;
+		};
+
+		/*
+		 * I3C device without a static I2C address but requiring
 		 * resources described in the DT.
 		 */
 		sensor@0,39200154004 {
-- 
2.7.4
