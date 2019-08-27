Return-Path: <SRS0=dUwE=WX=nic.cz=marek.behun@kernel.org>
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH mvebu-dt64 2/3] dt-bindings: marvell: document Turris Mox compatible
Date: Tue, 27 Aug 2019 17:16:43 +0200
Message-Id: <20190827151644.12532-3-marek.behun@nic.cz>
In-Reply-To: <20190827151644.12532-1-marek.behun@nic.cz>
References: <20190827151644.12532-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: arm@kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-ID: <devicetree@vger.kernel.org>

This adds the documentation for the Turris Mox compatible in armada-37xx
device-tree binding documentation.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 .../devicetree/bindings/arm/marvell/armada-37xx.txt       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.txt b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.txt
index eddde4faef01..f6d6642d81c0 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.txt
@@ -48,3 +48,11 @@ avs: avs@11500 {
 	compatible = "marvell,armada-3700-avs", "syscon";
 	reg = <0x11500 0x40>;
 }
+
+
+CZ.NIC's Turris Mox SOHO router Device Tree Bindings
+----------------------------------------------------
+
+Required root node property:
+
+ - compatible: must contain "cznic,turris-mox"
-- 
2.21.0
