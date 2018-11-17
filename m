From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/7] dt-bindings: vendor-prefix: add prefix for IC Plus Corp.
Date: Sat, 17 Nov 2018 19:20:01 +0100
Message-ID: <20181117182007.14791-2-martin.blumenstingl@googlemail.com>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

IC Plus Corp. has various Ethernet related products such as Ethernet
transceivers, Ethernet controllers, Ethernet switches, etc.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8fcc16..cc6b2c0d3b49 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -170,6 +170,7 @@ holtek	Holtek Semiconductor, Inc.
 hwacom	HwaCom Systems Inc.
 i2se	I2SE GmbH
 ibm	International Business Machines (IBM)
+icplus	IC Plus Corp.
 idt	Integrated Device Technologies, Inc.
 ifi	Ingenieurburo Fur Ic-Technologie (I/F/I)
 ilitek	ILI Technology Corporation (ILITEK)
-- 
2.19.1
