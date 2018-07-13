From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 2/3] dt-bindings: arm: syna: add support for the AS370 SoC
Date: Fri, 13 Jul 2018 17:24:57 +0800
Message-ID: <20180713172457.6193a92f@xhacker.debian>
References: <20180713171712.05f58a74@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713171712.05f58a74@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

The AS370 SoC is a new derivative of the berlin family. The only
difference is the SoC isn't named as berlin*.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 Documentation/devicetree/bindings/arm/syna.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/syna.txt b/Documentation/devicetree/bindings/arm/syna.txt
index 3bab18409b7a..3ba1d7b5ee74 100644
--- a/Documentation/devicetree/bindings/arm/syna.txt
+++ b/Documentation/devicetree/bindings/arm/syna.txt
@@ -1,4 +1,4 @@
-Marvell Berlin SoC Family Device Tree Bindings
+Synaptics SoC Device Tree Bindings
 ---------------------------------------------------------------
 
 Work in progress statement:
@@ -13,6 +13,10 @@ stable binding/ABI.
 
 ---------------------------------------------------------------
 
+Boards with the Synaptics AS370 SoC shall have the following properties:
+  Required root node property:
+    compatible: "syna,as370"
+
 Boards with a SoC of the Marvell Berlin family, e.g. Armada 1500
 shall have the following properties:
 
-- 
2.18.0
