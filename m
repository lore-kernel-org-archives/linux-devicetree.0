From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 2/6] mfd: dt: ranges, #address-cells and #size-cells as optional properties
Date: Tue,  6 Dec 2016 13:53:17 +1100
Message-ID: <20161206025321.1792-3-andrew@aj.id.au>
References: <20161206025321.1792-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161206025321.1792-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Corey Minyard <minyard@acm.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Whilst describing a device and not a bus, simple-mfd is modelled on
simple-bus where child nodes are iterated and registered as platform
devices. Some complex devices, e.g. the Aspeed LPC controller, can
benefit from address space mapping such that child nodes can use the
regs property to describe their resources within the multi-function
device.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/mfd/mfd.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mfd.txt b/Documentation/devicetree/bindings/mfd/mfd.txt
index f1fceeda12f1..bcb6abb9d413 100644
--- a/Documentation/devicetree/bindings/mfd/mfd.txt
+++ b/Documentation/devicetree/bindings/mfd/mfd.txt
@@ -25,6 +25,16 @@ Optional properties:
   be used. In the latter case the child devices will be determined by the
   operating system.
 
+- ranges: Describes the address mapping relationship to the parent. Should set
+  the child's base address to 0, the physical address within parent's address
+  space, and the length of the address map.
+
+- #address-cells: Specifies the number of cells used to represent physical base
+  addresses. Must be present if ranges is used.
+
+- #size-cells: Specifies the number of cells used to represent the size of an
+  address. Must be present if ranges is used.
+
 Example:
 
 foo@1000 {
-- 
2.9.3
