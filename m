From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] dt-bindings: Clarify interrupts-extended usage
Date: Mon, 26 Aug 2019 19:55:11 -0700
Message-ID: <20190827025511.22166-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandru M Stan <amstan@chromium.org>
List-Id: devicetree@vger.kernel.org

Reading the description about when to use interrupts-extended leads some
developers to think that it shouldn't be used unless a device has
interrupts from more than one interrupt controller. This isn't true. We
should encourage devicetree writers to use this property in situations
where it isn't the inherited interrupt-parent so that we have less
properties in a DT node by virtue of not having to specify an
interrupt-parent and an interrupts property.

Reported-by: Alexandru M Stan <amstan@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/interrupt-controller/interrupts.txt          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
index 8a3c40829899..4a3ee253f7f0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
@@ -22,10 +22,10 @@ controller node. This property is inherited, so it may be specified in an
 interrupt client node or in any of its parent nodes. Interrupts listed in the
 "interrupts" property are always in reference to the node's interrupt parent.
 
-The "interrupts-extended" property is a special form for use when a node needs
-to reference multiple interrupt parents. Each entry in this property contains
-both the parent phandle and the interrupt specifier. "interrupts-extended"
-should only be used when a device has multiple interrupt parents.
+The "interrupts-extended" property is a special form; useful when a node needs
+to reference multiple interrupt parents or a different interrupt parent than
+the inherited one. Each entry in this property contains both the parent phandle
+and the interrupt specifier.
 
   Example:
 	interrupts-extended = <&intc1 5 1>, <&intc2 1 0>;

base-commit: 609488bc979f99f805f34e9a32c1e3b71179d10b
-- 
Sent by a computer through tubes
