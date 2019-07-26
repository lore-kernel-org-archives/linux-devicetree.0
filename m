From: Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH 11/17] dt-bindings: misc: Document reg for aspeed,p2a-ctrl nodes
Date: Fri, 26 Jul 2019 15:09:53 +0930
Message-ID: <20190726053959.2003-12-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-aspeed@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Patrick Venture <venture@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

The P2A controller node sits under a syscon device, and can assume
offsets from the base of the syscon based on the compatible. However,
for devicetree correctness allow a reg property to be specified, which
an associated driver may choose to use to discover associated resources.

Cc: Patrick Venture <venture@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
index 854bd67ffec6..091d1c5ec58f 100644
--- a/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
+++ b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
@@ -18,6 +18,7 @@ Required properties:
 Optional properties:
 ===================
 
+- reg: A hint for the memory regions associated with the P2A controller
 - memory-region: A phandle to a reserved_memory region to be used for the PCI
 		to AHB mapping
 
-- 
2.20.1
