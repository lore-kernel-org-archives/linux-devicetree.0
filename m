Return-Path: <SRS0=25OJ=TV=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 4/4] dt-bindings: clk: armada3700: document the PCIe clock
Date: Tue, 21 May 2019 15:03:57 +0200
Message-Id: <20190521130357.20803-5-miquel.raynal@bootlin.com>
In-Reply-To: <20190521130357.20803-1-miquel.raynal@bootlin.com>
References: <20190521130357.20803-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Add a reference to the missing PCIe clock managed by this IP. The
clock resides in the south bridge.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/armada3700-periph-clock.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
index 85972715e593..fbf58c443c04 100644
--- a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
+++ b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
@@ -46,6 +46,7 @@ ID	Clock name	Description
 10	sdio		SDIO
 11	usb32-sub2-sys	USB 2 clock
 12	usb32-ss-sys	USB 3 clock
+13	pcie		PCIe controller
 
 Required properties:
 
-- 
2.19.1
