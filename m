From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 2/5] ARM: dts: keystone: Add PSC node
Date: Wed, 11 Jan 2017 19:48:40 -0600
Message-ID: <20170112014843.19569-3-s-anna@ti.com>
References: <20170112014843.19569-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170112014843.19569-1-s-anna@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

The Power Sleep Controller (PSC) module is responsible
for the power and clock management for each of the peripherals
present on the SoC. Represent this as a syscon node so that
multiple users can leverage it for various functionalities.

Signed-off-by: Suman Anna <s-anna@ti.com>
[afd@ti.com: add simple-mfd compatible]
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
v2: No changes

 arch/arm/boot/dts/keystone.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 02708ba2d4f4..ec203d0a673d 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -83,6 +83,11 @@
 			reg = <0x02310000 0x200>;
 		};
 
+		psc: power-sleep-controller@02350000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x02350000 0x1000>;
+		};
+
 		devctrl: device-state-control@02620000 {
 			compatible = "ti,keystone-devctrl", "syscon";
 			reg = <0x02620000 0x1000>;
-- 
2.10.2
