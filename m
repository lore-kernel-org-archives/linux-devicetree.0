From: Nishanth Menon <nm@ti.com>
Subject: [PATCH] dt-bindings: mailbox: ti,message-manager: Fix interrupt name error
Date: Sat, 9 Dec 2017 13:35:28 -0600
Message-ID: <20171209193528.29491-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, Marco Franchi <marco.franchi@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Message Manager's mailbox interrupts are queue based and not proxy
specific. The interrupt names are wrong in the binding, however
correctly reflected in the example provided. Remove the relation
to proxy ID in the documentation of binding. Existing device tree
descriptions follow the correct conventions already and documentation
update has been missed.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 Documentation/devicetree/bindings/mailbox/ti,message-manager.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt b/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
index c3b55b3ede8a..ebf0e3710cee 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
+++ b/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
@@ -20,9 +20,9 @@ Required properties:
 		        order referring to the transfer path.
 - interrupt-names:	Contains interrupt names matching the rx transfer path
 			for a given SoC. Receive interrupts shall be of the
-			format: "rx_<QID>_<PID>".
+			format: "rx_<QID>".
 			For ti,k2g-message-manager, this shall contain:
-				"rx_005_002", "rx_057_002"
+				"rx_005", "rx_057"
 - interrupts:		Contains the interrupt information corresponding to
 			interrupt-names property.
 
-- 
2.14.1
